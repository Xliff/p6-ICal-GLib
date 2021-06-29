use v6.c;

use Test;

use ICal::GLib::Raw::Types;

use ICal::GLib::DerivedParameters;

my $altrep = 'This is an altrep';
my $parameter = ICal::GLib::DerivedParameter::AltRep.new($altrep);
my $o-altrep  = $parameter.altrep;
is $o-altrep,      $altrep,        'Original AltRep string and retrieved version are the same';

my $a-altrep      = 'This is another altrep';
$parameter.altrep = $a-altrep;
$o-altrep         = $parameter.altrep;
is $o-altrep,      $a-altrep,      'Another AltRep string and retrieved version are the same';

my $action   = I_CAL_ACTIONPARAM_X;
$parameter   = ICal::GLib::DerivedParameter::ActionParam.new($action);
my $r-action = $parameter.actionparam;
is $r-action,      $action,        'Original Action value and retrieved value are the same';

$parameter.actionparam = $action = I_CAL_ACTIONPARAM_ASK;
$r-action = $parameter.actionparam;
is $r-action,      $action,        'Ask Action value and retrieved value are the same';

my $kind = I_CAL_ACTIONPARAM_PARAMETER;
$parameter = ICal::GLib::Parameter.new($kind);
is $parameter.isa, $kind,          'Parameter value .isa matches original kind value';
ok $parameter.isa-parameter,       'Parameter object is recognized as a parameter';
is ~$parameter,    Str,            'There is no string representation for parameter';

my $clone = $parameter.clone;
is $clone.isa,     $kind,          'Parameter clone value .isa matches original kind value';
ok $clone.isa-parameter,           'Parameter clone object is recognized as a parameter';
is ~$clone,        Str,            'There is no string representation for the parameter clone';

constant IGPK = ICal::GLib::Parameter::Kind;

my $string = IGPK.to_string($kind);
is $string,        'ACTIONPARAM',  'Can convert ParameterKind enum to string';
my $k2 = IGPK.from-string($string);
is $k2,            $kind,          'Can convert said string back to enum';

my $value      = 'This is a value';
my $type-value = $string ~ '=' ~ $value;
$parameter = ICal::GLib::Parameter.new-from-string($type-value);
is ~$parameter,    $type-value,    'Stringified parameter is equal to the string it was created from';
is $parameter.isa, $kind,          "Parameter .isa matches { $kind }";
ok $parameter.isa-parameter,       'Parameter object is recognized as a ICalParameter';

my $a-parameter = ICal::GLib::Parameter.new-from-value-string($kind, $value);
is ~$a-parameter,  $type-value,    'Stringified parameter via .new-from-value-string equals the previous TYPEVALUE';
