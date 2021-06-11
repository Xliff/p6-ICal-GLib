use v6.c;

use Method::Also;

use ICal::Raw::Structs;
use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Array;

use ICal::GLib::Object;

our subset ICalArrayAncestry is export of Mu
  where ICalArray | ICalObjectAncestry;

class ICal::GLib::Array is ICal::GLib::Object {
  has ICalArray $!ica;

  submethod BUILD (:$array) {
    self.setICalArray($array) if $array;
  }

  method setICalArray(ICalArrayAncestry $_) {
    my $to-parent;

    $!ica = do {
      when ICalArray {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalArray, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalArray
    is also<ICalArray>
  { $!ica }

  method ICal::Raw::Structs::icalarray
    is also<icalarray>
  { cast(icalarray, self.get_native) }

  multi method new (icalarray $native-ical-array, :$raw = False) {
    use NativeCall;
    use ICal::Raw::Array;

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      icalarray
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-ical-array,
      &icalarray_free,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalArrayAncestry $array, :$ref = True) {
    return Nil unless $array;

    my $o = self.bless( :$array );
    $o.ref if $ref;
    $o
  }

  method copy (:$raw = False) {
    my $c = i_cal_array_copy($!ica);

    # Transfer: full
    $c ??
      ( $raw ?? $c !! ICal::GLib::Array.new($c, :!ref) )
      !!
      Nil;
  }

  method free {
    i_cal_array_free($!ica);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_array_get_type, $n, $t );
  }

  method remove_element_at (Int() $position) is also<remove-element-at> {
    my gint $p = $position;

    i_cal_array_remove_element_at($!ica, $p);
  }

  method size is also<elems> {
    i_cal_array_size($!ica);
  }

  method sort (&compare) {
    i_cal_array_sort($!ica, &compare);
  }

}
