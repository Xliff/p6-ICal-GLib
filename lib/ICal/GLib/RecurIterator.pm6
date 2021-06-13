use v6.c;

use Method::Also;

use ICal::Raw::Definitions;
use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::RecurIterator;

use ICal::GLib::Object;
use ICal::GLib::Time;

our subset ICalRecurIteratorAncestry is export of Mu
  where ICalRecurIterator | ICalObjectAncestry;

class ICal::GLib::RecurIterator is ICal::GLib::Object {
  has ICalRecurIterator $!icri;

  submethod BUILD (:$iter) {
    self.setICalRecurIter($iter) if $iter;
  }

  method setICalRecurIter(ICalRecurIteratorAncestry $_) {
    my $to-parent;

    $!icri = do {
      when ICalRecurIterator {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalRecurIterator, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalRecurIterator
    is also<ICalRecurIterator>
  { $!icri }

  method ICal::Raw::Definitions::icalrecur_iterator
    is also<icalrecur_iterator>
  { cast(icalrecur_iterator, self.get_native) }

  multi method new (icalrecur_iterator $native-iter, :$raw = False) {
    use NativeCall;
    use ICal::Raw::Component;

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      icalrecur_iterator,
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-iter,
      &i_cal_recur_iterator_free,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalRecurIteratorAncestry $iter, :$ref = True) {
    return Nil unless $iter;

    my $o = self.bless( :$iter );
    $o.ref if $ref;
    $o;
  }
  multi method new (ICalTime() $dtstart, :start-time(:$start) is required) {
    my $iter = i_cal_recur_iterator_new($!icri, $dtstart);

    $iter ?? self.bless( :$iter ) !! Nil;
  }

  method free {
    i_cal_recur_iterator_free($!icri);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_recur_iterator_get_type, $n, $t );
  }


  method next (:$raw = False) {
    my $t = i_cal_recur_iterator_next($!icri);

    $t ??
      ( $raw ?? $t !! ICal::GLib::Time.new($t, :!ref) )
      !!
      Nil
  }

  method set_start (ICalTime() $start) is also<set-start> {
    i_cal_recur_iterator_set_start($!icri, $start);
  }


}
