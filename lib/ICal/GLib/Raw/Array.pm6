use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;

unit package ICal::GLib::Raw::Array;

### /usr/include/libical-glib/i-cal-array.h

sub i_cal_array_copy (ICalArray $array)
  returns ICalArray
  is native(ical-glib)
  is export
{ * }

sub i_cal_array_free (ICalArray $array)
  is native(ical-glib)
  is export
{ * }

sub i_cal_array_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_array_remove_element_at (ICalArray $array, gint $position)
  is native(ical-glib)
  is export
{ * }

sub i_cal_array_size (ICalArray $array)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_array_sort (
  ICalArray $array,
            &compare (gpointer, gpointer --> gint)
)
  is native(ical-glib)
  is export
{ * }
