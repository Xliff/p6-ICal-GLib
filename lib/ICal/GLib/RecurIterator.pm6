use v6.c;

use ICal::Raw::Defintions;
use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::RecurIterator;

use ICal::GLib::Object;
use ICal::GLib::Time;

our subset ICalRecurIterAncestry is export of Mu
  where ICalRecurIter | ICalObjectAncestry;

class ICal::GLib::RecurIterator is ICal::GLib::Object {
  has ICalRecurIterator $!icri;

  submethod BUILD (:$iter) {
    self.setICalRecurIter($iter) if $iter;
  }

  method setICalRecurIter(ICalRecurIterAncestry $_) {
    my $to-parent;

    $!icc = do {
      when ICalRecurIter {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalRecurIter, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalRecurIter
    is also<ICalRecurIter>
  { $!icc }

  method ICal::Raw::Definitions::ICalRecurIter
    is also<icalrecuritertype>
  { cast(ICalRecurIter, self.get_native) }

  multi method new (icalrecur_iterator $native-iter, :$raw = False) {
    use NativeCall;
    use ICal::Raw::Component;

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      icalrecur_iterrator,
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
  multi method new (ICalRecurIterAncestry $iter, :$ref = True) {
    return Nil unless $iter;

    my $o = self.bless( :$iter );
    $o.ref if $ref;
    $o;
  }

  method new (ICalTime() $dtstart) {
    my $iter = i_cal_recur_iterator_new($!icr, $dtstart);

    $iter ?? self.bless( :$iter ) !! Nil;
  }

  method free {
    i_cal_recur_iterator_free($!icr);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_recur_iterator_get_type, $n, $t );
  }


  method next (:$raw = False) {
    my $t = i_cal_recur_iterator_next($!icr);

    $t ??
      ( $raw ?? $t !! ICal::GLib::Time.new($t, :!ref) )
      !!
      Nil
  }

  method set_start (ICalTime() $start) {
    i_cal_recur_iterator_set_start($!icr, $start);
  }


}
