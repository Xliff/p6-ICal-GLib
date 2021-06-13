use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;

unit package ICal::GLib::Raw::Duration;

### /usr/include/libical-glib/i-cal-duration.h

sub i_cal_duration_as_ical_string (ICalDuration $duration)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_as_int (ICalDuration $duration)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_get_days (ICalDuration $duration)
  returns guint
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_get_hours (ICalDuration $duration)
  returns guint
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_get_minutes (ICalDuration $duration)
  returns guint
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_get_seconds (ICalDuration $duration)
  returns guint
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_get_weeks (ICalDuration $duration)
  returns guint
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_is_bad_duration (ICalDuration $duration)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_is_neg (ICalDuration $duration)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_is_null_duration (ICalDuration $duration)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_new_bad_duration ()
  returns ICalDuration
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_new_from_int (gint $t)
  returns ICalDuration
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_new_from_string (Str $str)
  returns ICalDuration
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_new_null_duration ()
  returns ICalDuration
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_set_days (ICalDuration $duration, guint $days)
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_set_hours (ICalDuration $duration, guint $hours)
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_set_is_neg (ICalDuration $duration, gboolean $is_neg)
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_set_minutes (ICalDuration $duration, guint $minutes)
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_set_seconds (ICalDuration $duration, guint $seconds)
  is native(ical-glib)
  is export
{ * }

sub i_cal_duration_set_weeks (ICalDuration $duration, guint $weeks)
  is native(ical-glib)
  is export
{ * }
