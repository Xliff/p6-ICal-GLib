use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;
use ICal::GLib::Raw::Enums;

unit package ICal::GLib::Raw::Property;

### /usr/include/libical-glib/i-cal-property.h

sub i_cal_property_add_parameter (ICalProperty $prop, ICalParameter $parameter)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_as_ical_string (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_clone (ICalProperty $prop)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_count_parameters (ICalProperty $prop)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_enum_to_string (gint $e)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_free (ICalProperty $prop)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_first_parameter (
  ICalProperty      $prop,
  ICalParameterKind $kind
)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_next_parameter (
  ICalProperty      $prop,
  ICalParameterKind $kind
)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_parameter_as_string (ICalProperty $prop, Str $name)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_property_name (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_value (ICalProperty $prop)
  returns ICalValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_value_as_string (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_x_name (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_parent (ICalParameter $param)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_parent (ICalParameter $param, ICalProperty $property)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_value_to_value_kind (ICalParameterValue $value)
  returns ICalValueKind
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_isa (ICalProperty $property)
  returns ICalPropertyKind
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_isa_property (ICalProperty $property)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_kind_and_string_to_enum (gint $kind, Str $str)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_kind_from_string (Str $string)
  returns ICalPropertyKind
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_kind_has_property (ICalPropertyKind $kind, gint $e)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_kind_is_valid (ICalPropertyKind $kind)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_kind_to_string (ICalPropertyKind $kind)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_kind_to_value_kind (ICalPropertyKind $kind)
  returns ICalValueKind
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_method_from_string (Str $str)
  returns ICalPropertyMethod
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_method_to_string (ICalPropertyMethod $method)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new (ICalPropertyKind $kind)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_from_string (Str $str)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_remove_parameter_by_kind (
  ICalProperty      $prop,
  ICalParameterKind $kind
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_remove_parameter_by_name (ICalProperty $prop, Str $name)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_remove_parameter_by_ref (
  ICalProperty  $prop,
  ICalParameter $param
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_parameter (ICalProperty $prop, ICalParameter $parameter)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_parameter_from_string (
  ICalProperty $prop,
  Str          $name,
  Str          $value
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_value (ICalProperty $prop, ICalValue $value)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_value_from_string (
  ICalProperty $prop,
  Str          $value,
  Str          $kind
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_x_name (ICalProperty $prop, Str $name)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_status_from_string (Str $str)
  returns ICalPropertyStatus
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_status_to_string (ICalPropertyStatus $method)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_take_parameter (
  ICalProperty  $prop,
  ICalParameter $parameter
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_take_value (ICalProperty $prop, ICalValue $value)
  is native(ical-glib)
  is export
{ * }

### /usr/include/libical-glib/i-cal-component.h

sub i_cal_property_get_datetime_with_component (
  ICalProperty  $prop,
  ICalComponent $comp
)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_parent (ICalProperty $property)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_parent (
  ICalProperty  $property,
  ICalComponent $component
)
  is native(ical-glib)
  is export
{ * }
