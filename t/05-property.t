use v6.c;

use Test;

use ICal::GLib::Raw::Types;

use ICal::GLib::Property;
use ICal::GLib::Value;

my $action-property       = ICal::GLib::Property.new(I_CAL_ACKNOWLEDGED_PROPERTY);
my $action-property-clone = $action-property.clone;

is ~$action-property,                    ~$action-property-clone,      'Action Property and its clone have the same string representation';

my $property-string       = 'SUMMARY:Bastille Day Party';
my $string-property       = ICal::GLib::Property.new-from-string($property-string);
my $string-property-clone = $string-property.clone;

is ~$string-property,                    ~$string-property-clone,      'Summary Property and its clone have the same string representation';
is $string-property.isa,                 I_CAL_SUMMARY_PROPERTY,       'Summary Property is properly typed';
ok $string-property.isa-property,                                      'Summary Property is recognized as valid';
is $string-property.property-name,       'SUMMARY',                    'Summary Property is recognized as a SUMMARY property';

# cw: This is from i-cal-derived-parameter.h, which required another round of design and
#     an independent compunit.
#
# my $altrep1    = 'This is an altrep 1';
# my $parameter1 = ICal::GLib::Parameter.new-altrep($altrep1);
# my $altrep2    = 'This is an altrep 2';
# my $parameter2 = ICal::GLib::Parameter.new-altrep($altrep2);
# $string-property.add-property($_) for $parameter1, $parameter2;
# my @ap-string  = (my $ap-string = 'ACTIONPARAM=This is an action param').split('=');
# $string-property.set-parameter-from-string(|@ap-string);
#
# my @parameters;
# is $string-property.count-parameters,    3,                            'Summary property has 3 parameters';
# @parameters.push: $_ for $string-property.get-first-parameter(I_CAL_ALTREP_PARAMETER),
#                          $string-property.get-first-next(I_CAL_ALTREP_PARAMETER),
#                          $string-property.get_first_parameter(I_CAL_ACTIONPARAM_PARAMETER);
# is ~@parameters[0],                      ~$parameter1,                 'Summary parameter\'s parameter and parameter1 have the same string representation';
# is ~@parameters[1],                      ~$parameter2,                 'Summary parameter\'s parameter and parameter2 have the same string representation';
# is ~@parameters[2],                      $ap-string,                   'The ACTIONPARAM parameter and parameter3 have the same string representation';
#
# $string-property.remove-parameter-by-kind(I_CAL_CHARSET_PARAMETER);
# is $string-property.count-parameters,    3,                            'Summary property has 3 parameters after removal of all CHARSET_PARAMETER';
# $string-property.remove-parameter-by-kind(I_CAL_ALTREP_PARAMETER);
# is $string-property.count-parameters,    2,                            'Summary property has 3 parameters after removal of first ALTREP_PARAMETER';
# $string-property.remove-parameter-by-name('ACTIONPARAM');
# is $string-property.count-parameters,    1,                            'Summary property has 3 parameters after removal ACTIONPARAM';

my ($kind, $string) = (I_CAL_ATTACH_VALUE, 'This is a link');
my $value-from-string = ICal::GLib::Value.new-from-string($kind, $string);
$string-property.set-value($value-from-string);
is $string-property.get-value-as-string, $string,                      "String property is '{ $string }'";
my $value-from-property = $string-property.value;
is ~$value-from-property,                $string,                      'The string representation of the property\'s value is equal to the original string';
$string-property.set-value-from-string( $string, ICal::GLib::Value::Kind.to-string($kind) );
is $string-property.get-value-as-string, $string,                      '.get-value-as-string returns the same result';
is ~$string-property.value,              $string,                      'Direct stringification of the property\s value also give the same result';

$string-property.set-x-name(my $x-name-string = 'This is an x name!');
is $string-property.x-name,              $x-name-string,               'X-Name parameter can be retrieved, successfully';

my $vk-from-pk = ICal::GLib::Parameter::Value.to_value_kind(I_CAL_VALUE_BINARY);
is $vk-from-pk,                          I_CAL_BINARY_VALUE,           'I_CAL_VALUE_BINARY is recognized as an I_CAL_BINARY_VALUE';

my $pk-from-vk = ICal::GLib::Property::Kind.to_value_kind(I_CAL_ACKNOWLEDGED_PROPERTY);
is $pk-from-vk,                          I_CAL_DATETIME_VALUE,         'I_CAL_ACKNOWLEDGED_PROPERTY is recognized as an I_CAL_DATETIME_VALUE';

my $pk = ICal::GLib::Value::Kind.to-property-kind($pk-from-vk);
is $pk,                                  I_CAL_ACKNOWLEDGED_PROPERTY,  'Can round-trip from I_CAL_DATETIME_VALUE back to I_CAL_ACKNOWLEDGED_PROPERTY';

$kind = ICal::GLib::Property::Kind.from-string($string = 'ACKNOWLEDGED');
is $kind,                                I_CAL_ACKNOWLEDGED_PROPERTY,  "Can convert '{ $string }' to enum I_CAL_ACKNOWLEDGED_PROPERTY";

constant IGPM = ICal::GLib::Property::Method;
$string = IGPM.to_string(my $enum = I_CAL_METHOD_PUBLISH);
is IGPM.from-string($string),            $enum,                        "Can convert '{ $string }' to I_CAL_METHOD_PUBLISH";

$string = ICal::GLib::Property.enum-to-string(I_CAL_METHOD_PUBLISH);
is $string,                              'PUBLISH',                    "Can convert I_CAL_METHOD_PUBLISH to string 'PUBLISH'";

lives-ok {
  $property-string   = 'SUMMARY:Bastille Day Party';
  $string-property   = ICal::GLib::Property.new-from-string($property-string);
  ($kind, $string)   = (I_CAL_ATTACH_VALUE, 'This is a link');
  $value-from-string = ICal::GLib::Value.new-from-string($kind, $string);
  $value-from-string.set-parent($string-property);
  $value-from-string.clear-parent;
}, 'ICal::GLib::Value.set-parent, .clear-parent can be used without error';
