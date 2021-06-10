use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;
use ICal::GLib::Raw::Enums;

unit package ICal::GLib::Raw::Reqstat;

### /usr/include/libical-glib/i-cal-reqstat.h

sub i_cal_reqstat_get_code (ICalReqstat $reqstat)
  returns ICalRequestStatus
  is native(ical-glib)
  is export
{ * }

sub i_cal_reqstat_get_debug (ICalReqstat $reqstat)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_reqstat_get_desc (ICalReqstat $reqstat)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_reqstat_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_reqstat_new_from_string (Str $str)
  returns ICalReqstat
  is native(ical-glib)
  is export
{ * }

sub i_cal_reqstat_set_code (ICalReqstat $reqstat, ICalRequestStatus $code)
  is native(ical-glib)
  is export
{ * }

sub i_cal_reqstat_to_string (ICalReqstat $stat)
  returns Str
  is native(ical-glib)
  is export
{ * }
