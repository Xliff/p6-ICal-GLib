use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;

unit package ICal::GLib::Raw::Period;

### /usr/include/libical-glib/i-cal-period.h

sub i_cal_period_as_ical_string (ICalPeriod $p)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_period_get_duration (ICalPeriod $period)
  returns ICalDuration
  is native(ical-glib)
  is export
{ * }

sub i_cal_period_get_end (ICalPeriod $period)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_period_get_start (ICalPeriod $period)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_period_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_period_is_null_period (ICalPeriod $p)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_period_is_valid_period (ICalPeriod $p)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_period_new_from_string (Str $str)
  returns ICalPeriod
  is native(ical-glib)
  is export
{ * }

sub i_cal_period_new_null_period ()
  returns ICalPeriod
  is native(ical-glib)
  is export
{ * }

sub i_cal_period_set_duration (ICalPeriod $period, ICalDuration $duration)
  is native(ical-glib)
  is export
{ * }

sub i_cal_period_set_end (ICalPeriod $period, ICalTime $end)
  is native(ical-glib)
  is export
{ * }

sub i_cal_period_set_start (ICalPeriod $period, ICalTime $start)
  is native(ical-glib)
  is export
{ * }
