use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;
use ICal::GLib::Raw::Enums;

unit package ICal::GLib::Value;

### /usr/include/libical-glib/i-cal-value.h

sub i_cal_value_as_ical_string (ICalValue $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_clone (ICalValue $value)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_compare (ICalValue $a, ICalValue $b)
  returns ICalParameterXliccomparetype
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_decode_ical_string (Str $szText)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_encode_ical_string (Str $szText)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_free (ICalValue $value)
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_is_valid (ICalValue $value)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_isa (ICalValue $value)
  returns ICalValueKind
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_isa_value (ICalValue $value)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_kind_from_string (Str $str)
  returns ICalValueKind
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_kind_is_valid (ICalValueKind $kind)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_kind_to_string (ICalValueKind $kind)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new (ICalValueKind $kind)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_new_from_string (ICalValueKind $kind, Str $str)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

### /usr/include/libical-glib/i-cal-property.h

sub i_cal_value_get_parent (ICalValue $value)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_kind_to_property_kind (ICalValueKind $kind)
  returns ICalPropertyKind
  is native(ical-glib)
  is export
{ * }

sub i_cal_value_set_parent (ICalValue $value, ICalProperty $property)
  is native(ical-glib)
  is export
{ * }
