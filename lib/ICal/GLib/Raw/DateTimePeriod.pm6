use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;

unit package ICal::GLib::Raw::DateTimePeriod;

### /usr/include/libical-glib/i-cal-datetimeperiod.h

sub i_cal_datetimeperiod_get_period (ICalDatetimeperiod $dtp)
  returns ICalPeriod
  is native(ical-glib)
  is export
{ * }

sub i_cal_datetimeperiod_get_time (ICalDatetimeperiod $dtp)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_datetimeperiod_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_datetimeperiod_new ()
  returns ICalDatetimeperiod
  is native(ical-glib)
  is export
{ * }

sub i_cal_datetimeperiod_set_period (ICalDatetimeperiod $dtp, ICalPeriod $period)
  is native(ical-glib)
  is export
{ * }

sub i_cal_datetimeperiod_set_time (ICalDatetimeperiod $dtp, ICalTime $time)
  is native(ical-glib)
  is export
{ * }
