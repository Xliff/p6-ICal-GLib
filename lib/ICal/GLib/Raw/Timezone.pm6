use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;

### /usr/include/libical-glib/i-cal-timezone.h

sub i_cal_time_convert_timezone (
  ICalTime     $tt,
  ICalTimezone $from_zone,
  ICalTimezone $to_zone
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_timezone_expand_vtimezone (
  ICalComponent $comp,
  gint          $end_year,
  ICalArray     $changes
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_array_append_from_vtimezone (
  ICalArray     $timezones,
  ICalComponent $child
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_array_element_at (ICalArray $timezones, guint $index)
  returns ICalTimezone
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_array_free (ICalArray $timezones)
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_array_new ()
  returns ICalArray
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_copy (ICalTimezone $zone)
  returns ICalTimezone
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_dump_changes (
  ICalTimezone $zone,
  gint         $max_year,
  Pointer      $fp         # FILE*
)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_free (ICalTimezone $zone, gint $free_struct)
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_free_builtin_timezones ()
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_free_zone_directory ()
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_builtin_timezone (Str $location)
  returns ICalTimezone
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_builtin_timezone_from_offset (gint $offset, Str $tzname)
  returns ICalTimezone
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_builtin_timezone_from_tzid (Str $tzid)
  returns ICalTimezone
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_builtin_timezones ()
  returns ICalArray
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_builtin_tzdata ()
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_component (ICalTimezone $zone)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_display_name (ICalTimezone $zone)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_latitude (ICalTimezone $zone)
  returns gdouble
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_location (ICalTimezone $zone)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_location_from_vtimezone (ICalComponent $component)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_longitude (ICalTimezone $zone)
  returns gdouble
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_tzid (ICalTimezone $zone)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_tznames (ICalTimezone $zone)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_tznames_from_vtimezone (ICalComponent $component)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_utc_offset (
  ICalTimezone $zone,
  ICalTime     $tt,
  gint         $is_daylight is rw
)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_utc_offset_of_utc_time (
  ICalTimezone $zone,
  ICalTime     $tt,
  gint         $is_daylight is rw
)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_utc_timezone ()
  returns ICalTimezone
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_new ()
  returns ICalTimezone
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_release_zone_tab ()
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_set_builtin_tzdata (gboolean $set)
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_set_component (ICalTimezone $zone, ICalComponent $comp)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_set_tzid_prefix (Str $new_prefix)
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_set_zone_directory (Str $path)
  is native(ical-glib)
  is export
{ * }

sub i_cal_timezone_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }
