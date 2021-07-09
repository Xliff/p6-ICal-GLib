use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;
use ICal::GLib::Raw::Enums;

unit package ICal::GLib::Raw::DerivedValues;

### /usr/include/libical-glib/i-cal-derived-value.h

sub i_cal_value_get_action (ICalValue $value)
  returns ICalPropertyAction
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_attach (ICalValue $value)
  returns ICalAttach
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_binary (ICalValue $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_boolean (ICalValue $value)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_busytype (ICalValue $value)
  returns ICalPropertyBusytype
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_caladdress (ICalValue $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_carlevel (ICalValue $value)
  returns ICalPropertyCarlevel
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_class (ICalValue $value)
  returns ICalProperty_Class
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_cmd (ICalValue $value)
  returns ICalPropertyCmd
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_date (ICalValue $value)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_datetime (ICalValue $value)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_datetimedate (ICalValue $value)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_datetimeperiod (ICalValue $value)
  returns ICalDatetimeperiod
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_duration (ICalValue $value)
  returns ICalDuration
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_float (ICalValue $value)
  returns gdouble
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_geo (ICalValue $value)
  returns ICalGeo
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_integer (ICalValue $value)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_method (ICalValue $value)
  returns ICalPropertyMethod
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_period (ICalValue $value)
  returns ICalPeriod
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_pollcompletion (ICalValue $value)
  returns ICalPropertyPollcompletion
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_pollmode (ICalValue $value)
  returns ICalPropertyPollmode
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_query (ICalValue $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_querylevel (ICalValue $value)
  returns ICalPropertyQuerylevel
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_recur (ICalValue $value)
  returns ICalRecurrence
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_requeststatus (ICalValue $value)
  returns ICalReqstat
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_status (ICalValue $value)
  returns ICalPropertyStatus
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_string (ICalValue $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_taskmode (ICalValue $value)
  returns ICalPropertyTaskmode
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_text (ICalValue $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_transp (ICalValue $value)
  returns ICalPropertyTransp
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_trigger (ICalValue $value)
  returns ICalTrigger
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_uri (ICalValue $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_utcoffset (ICalValue $value)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_x (ICalValue $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_xlicclass (ICalValue $value)
  returns ICalPropertyXlicclass
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_action (ICalPropertyAction $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_attach (ICalAttach $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_binary (Str $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_boolean (gint $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_busytype (ICalPropertyBusytype $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_caladdress (Str $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_carlevel (ICalPropertyCarlevel $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_class (ICalProperty_Class $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_cmd (ICalPropertyCmd $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_date (ICalTime $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_datetime (ICalTime $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_datetimedate (ICalTime $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_datetimeperiod (ICalDatetimeperiod $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_duration (ICalDuration $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_float (gdouble $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_geo (ICalGeo $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_integer (gint $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_method (ICalPropertyMethod $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_period (ICalPeriod $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_pollcompletion (ICalPropertyPollcompletion $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_pollmode (ICalPropertyPollmode $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_query (Str $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_querylevel (ICalPropertyQuerylevel $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_recur (ICalRecurrence $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_requeststatus (ICalReqstat $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_status (ICalPropertyStatus $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_string (Str $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_taskmode (ICalPropertyTaskmode $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_text (Str $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_transp (ICalPropertyTransp $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_trigger (ICalTrigger $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_uri (Str $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_utcoffset (gint $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_x (Str $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_xlicclass (ICalPropertyXlicclass $v)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_reset_kind (ICalValue $value)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_action (ICalValue $value, ICalPropertyAction $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_attach (ICalValue $value, ICalAttach $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_binary (ICalValue $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_boolean (ICalValue $value, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_busytype (ICalValue $value, ICalPropertyBusytype $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_caladdress (ICalValue $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_carlevel (ICalValue $value, ICalPropertyCarlevel $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_class (ICalValue $value, ICalProperty_Class $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_cmd (ICalValue $value, ICalPropertyCmd $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_date (ICalValue $value, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_datetime (ICalValue $value, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_datetimedate (ICalValue $value, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_datetimeperiod (ICalValue $value, ICalDatetimeperiod $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_duration (ICalValue $value, ICalDuration $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_float (ICalValue $value, gdouble $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_geo (ICalValue $value, ICalGeo $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_integer (ICalValue $value, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_method (ICalValue $value, ICalPropertyMethod $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_period (ICalValue $value, ICalPeriod $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_pollcompletion (ICalValue $value, ICalPropertyPollcompletion $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_pollmode (ICalValue $value, ICalPropertyPollmode $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_query (ICalValue $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_querylevel (ICalValue $value, ICalPropertyQuerylevel $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_recur (ICalValue $value, ICalRecurrence $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_requeststatus (ICalValue $value, ICalReqstat $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_status (ICalValue $value, ICalPropertyStatus $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_string (ICalValue $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_taskmode (ICalValue $value, ICalPropertyTaskmode $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_text (ICalValue $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_transp (ICalValue $value, ICalPropertyTransp $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_trigger (ICalValue $value, ICalTrigger $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_uri (ICalValue $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_utcoffset (ICalValue $value, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_x (ICalValue $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_xlicclass (ICalValue $value, ICalPropertyXlicclass $v)
  is native(ical-glib)
  is export
{ * }
