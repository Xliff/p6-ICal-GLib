use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;

unit package ICal::GLib::Raw::Trigger;

### /usr/include/libical-glib/i-cal-trigger.h

sub i_cal_trigger_get_duration (ICalTrigger $trigger)
  returns ICalDuration
  is native(ical-glib)
  is export
{ * }

sub i_cal_trigger_get_time (ICalTrigger $trigger)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_trigger_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_trigger_is_bad_trigger (ICalTrigger $tr)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_trigger_is_null_trigger (ICalTrigger $tr)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_trigger_new_from_int (gint $reltime)
  returns ICalTrigger
  is native(ical-glib)
  is export
{ * }

sub i_cal_trigger_new_from_string (Str $str)
  returns ICalTrigger
  is native(ical-glib)
  is export
{ * }

sub i_cal_trigger_set_duration (ICalTrigger $trigger, ICalDuration $duration)
  is native(ical-glib)
  is export
{ * }

sub i_cal_trigger_set_time (ICalTrigger $trigger, ICalTime $time)
  is native(ical-glib)
  is export
{ * }
