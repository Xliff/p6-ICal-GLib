use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;
use ICal::GLib::Raw::Enums;

unit package ICal::GLib::Raw::Parameter;

### /usr/include/libical-glib/i-cal-parameter.h

sub i_cal_parameter_as_ical_string (ICalParameter $parameter)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_clone (ICalParameter $p)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_free (ICalParameter $parameter)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_iana_name (ICalParameter $param)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_iana_value (ICalParameter $param)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_xname (ICalParameter $param)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_xvalue (ICalParameter $param)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_has_same_name (
  ICalParameter $param1,
  ICalParameter $param2
)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_isa (ICalParameter $parameter)
  returns ICalParameterKind
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_isa_parameter (ICalParameter $param)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_kind_from_string (Str $string)
  returns ICalParameterKind
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_kind_is_valid (ICalParameterKind $kind)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_kind_to_string (ICalParameterKind $kind)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new (ICalParameterKind $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_from_string (Str $value)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_from_value_string (ICalParameterKind $kind, Str $value)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_iana_name (ICalParameter $param, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_iana_value (ICalParameter $param, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_xname (ICalParameter $param, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_xvalue (ICalParameter $param, Str $v)
  is native(ical-glib)
  is export
{ * }
