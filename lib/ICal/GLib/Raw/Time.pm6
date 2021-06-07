use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;

unit package ICal::GLib::Raw::Time;

### /usr/include/libical-glib/i-cal-time.h

sub i_cal_time_add (ICalTime $t, ICalDuration $d)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_adjust (
  ICalTime $tt,
  gint     $days,
  gint     $hours,
  gint     $minutes,
  gint     $seconds
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_as_ical_string (ICalTime $tt)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_as_timet (ICalTime $tt)
  returns time_t
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_as_timet_with_zone (
  ICalTime     $tt,
  ICalTimezone $zone
)
  returns time_t
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_clone (ICalTime $timetype)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_compare (ICalTime $a, ICalTime $b)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_compare_date_only (ICalTime $a, ICalTime $b)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_compare_date_only_tz (
  ICalTime     $a,
  ICalTime     $b,
  ICalTimezone $zone
)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_convert_to_zone (ICalTime $tt, ICalTimezone $zone)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_convert_to_zone_inplace (
  ICalTime     $tt,
  ICalTimezone $zone
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_day_of_week (ICalTime $tt)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_day_of_year (ICalTime $tt)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_days_in_month (gint $month, gint $year)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_days_in_year (gint $year)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_days_is_leap_year (gint $year)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_get_date (
  ICalTime $timetype,
  gint $year          is rw,
  gint $month         is rw,
  gint $day           is rw
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_get_day (ICalTime $timetype)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_get_hour (ICalTime $timetype)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_get_minute (ICalTime $timetype)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_get_month (ICalTime $timetype)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_get_second (ICalTime $timetype)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_get_time (
  ICalTime $timetype,
  gint     $hour      is rw,
  gint     $minute    is rw,
  gint     $second    is rw
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_get_timezone (ICalTime $tt)
  returns ICalTimezone
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_get_tzid (ICalTime $tt)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_get_year (ICalTime $timetype)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_is_date (ICalTime $tt)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_is_daylight (ICalTime $timetype)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_is_null_time (ICalTime $tt)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_is_utc (ICalTime $tt)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_is_valid_time (ICalTime $tt)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_new ()
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_new_current_with_zone (ICalTimezone $zone)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_new_from_day_of_year (gint $day, gint $year)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_new_from_string (Str $str)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_new_from_timet_with_zone (
  time_t       $v,
  gint         $is_date,
  ICalTimezone $zone
)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_new_null_date ()
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_new_null_time ()
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_new_today ()
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_normalize (ICalTime $t)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_normalize_inplace (ICalTime $tt)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_set_date (
  ICalTime $timetype,
  gint     $year,
  gint     $month,
  gint     $day
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_set_day (ICalTime $timetype, gint $day)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_set_hour (ICalTime $timetype, gint $hour)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_set_is_date (
  ICalTime $timetype,
  gboolean $is_date
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_set_is_daylight (
  ICalTime $timetype,
  gboolean $is_daylight
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_set_minute (ICalTime $timetype, gint $minute)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_set_month (ICalTime $timetype, gint $month)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_set_second (ICalTime $timetype, gint $second)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_set_time (
  ICalTime $timetype,
  gint     $hour,
  gint     $minute,
  gint     $second
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_set_timezone (ICalTime $tt, ICalTimezone $zone)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_set_year (ICalTime $timetype, gint $year)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_span_contains (
  ICalTimeSpan $s,
  ICalTimeSpan $container
)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_span_new (
  ICalTime $dtstart,
  ICalTime $dtend,
  gint     $is_busy
)
  returns ICalTimeSpan
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_span_overlaps (ICalTimeSpan $s1, ICalTimeSpan $s2)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_start_doy_week (ICalTime $tt, gint $fdow)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_subtract (ICalTime $t1, ICalTime $t2)
  returns ICalDuration
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_week_number (ICalTime $tt)
  returns gint
  is native(ical-glib)
  is export
{ * }
