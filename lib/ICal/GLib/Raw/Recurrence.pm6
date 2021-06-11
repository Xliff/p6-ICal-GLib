use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use ICal::GLib::Raw::Definitions;
use ICal::GLib::Raw::Enums;

unit package ICal::GLib::Raw::Recurrence;

### /usr/include/libical-glib/i-cal-recurrence.h

sub i_cal_recurrence_clear (ICalRecurrence $r)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_day_day_of_week (gshort $day)
  returns ICalRecurrenceWeekday
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_day_position (gshort $day)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_day (ICalRecurrence $recur, guint $index)
  returns gshort
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_day_array (ICalRecurrence $recur)
  returns GArray
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_hour (ICalRecurrence $recur, guint $index)
  returns gshort
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_hour_array (ICalRecurrence $recur)
  returns GArray
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_minute (ICalRecurrence $recur, guint $index)
  returns gshort
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_minute_array (ICalRecurrence $recur)
  returns GArray
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_month (ICalRecurrence $recur, guint $index)
  returns gshort
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_month_array (ICalRecurrence $recur)
  returns GArray
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_month_day (ICalRecurrence $recur, guint $index)
  returns gshort
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_month_day_array (ICalRecurrence $recur)
  returns GArray
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_second (ICalRecurrence $recur, guint $index)
  returns gshort
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_second_array (ICalRecurrence $recur)
  returns GArray
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_set_pos (ICalRecurrence $recur, guint $index)
  returns gshort
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_set_pos_array (ICalRecurrence $recur)
  returns GArray
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_week_no (ICalRecurrence $recur, guint $index)
  returns gshort
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_week_no_array (ICalRecurrence $recur)
  returns GArray
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_year_day (ICalRecurrence $recur, guint $index)
  returns gshort
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_by_year_day_array (ICalRecurrence $recur)
  returns GArray
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_count (ICalRecurrence $recur)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_freq (ICalRecurrence $recur)
  returns ICalRecurrenceFrequency
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_interval (ICalRecurrence $recur)
  returns gshort
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_until (ICalRecurrence $recur)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_get_week_start (ICalRecurrence $recur)
  returns ICalRecurrenceWeekday
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_month_is_leap (gshort $month)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_month_month (gshort $month)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_new ()
  returns ICalRecurrence
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_new_from_string (Str $str)
  returns ICalRecurrence
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_rscale_is_supported ()
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_rscale_supported_calendars ()
  returns ICalArray
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_day (
  ICalRecurrence $recur,
  guint          $index,
  gshort         $value
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_day_array (ICalRecurrence $recur, GArray $values)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_hour (
  ICalRecurrence $recur,
  guint          $index,
  gshort         $value
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_hour_array (ICalRecurrence $recur, GArray $values)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_minute (
  ICalRecurrence $recur,
  guint          $index,
  gshort         $value
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_minute_array (ICalRecurrence $recur, GArray $values)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_month (
  ICalRecurrence $recur,
  guint          $index,
  gshort         $value
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_month_array (ICalRecurrence $recur, GArray $values)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_month_day (
  ICalRecurrence $recur,
  guint          $index,
  gshort         $value
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_month_day_array (
  ICalRecurrence $recur,
  GArray $values
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_second (
  ICalRecurrence $recur,
  guint          $index,
  gshort         $value
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_second_array (
  ICalRecurrence $recur,
  GArray         $values
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_set_pos (
  ICalRecurrence $recur,
  guint          $index,
  gshort         $value
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_set_pos_array (
  ICalRecurrence $recur,
  GArray         $values
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_week_no (
  ICalRecurrence $recur,
  guint          $index,
  gshort         $value
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_week_no_array (
  ICalRecurrence $recur,
  GArray         $values
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_year_day (
  ICalRecurrence $recur,
  guint          $index,
  gshort         $value
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_by_year_day_array (
  ICalRecurrence $recur,
  GArray         $values
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_count (ICalRecurrence $recur, gint $count)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_freq (
  ICalRecurrence          $recur,
  ICalRecurrenceFrequency $freq
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_interval (ICalRecurrence $recur, gshort $interval)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_until (ICalRecurrence $recur, ICalTime $until)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_set_week_start (
  ICalRecurrence        $recur,
  ICalRecurrenceWeekday $week_start
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recurrence_to_string (ICalRecurrence $recur)
  returns Str
  is native(ical-glib)
  is export
{ * }
