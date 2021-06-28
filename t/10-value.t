use v6.c;

use Test;

use ICal::GLib::Raw::Types;

use ICal::GLib::Value;

my $value = ICal::GLib::Value.new(my $kind  = I_CAL_ATTACH_VALUE);
ok $value.is_valid,                                   'Value created from enum is valid';
is $value.isa,       $kind,                           'Value returns the correct enum from .isa';
is $value.isa-value, True,                            'Value is recognized as a proper ICalValue';

my $string = 'This is a test';
my $vfs    = ICal::GLib::Value.new-from-string($kind, $string);
is $vfs,             $string,                         'StringValue object contains the data it was create from';
ok $vfs.is_valid,                                     'StringValue is recognized as a proper ICalValue';
is $vfs.isa,         $kind,                           'StringValue returns the correct enum from .isa';
is $vfs.isa-value,   True,                            'StringValue is recognized as a proper ICalValue';

my $vfsc   = $vfs.clone;
is $vfsc,             $string,                        'StringValue object contains the data it was create from';
ok $vfsc.is_valid,                                    'StringValue is recognized as a proper ICalValue';
is $vfsc.isa,         $kind,                          'StringValue returns the correct enum from .isa';
is $vfsc.isa-value,   True,                           'StringValue is recognized as a proper ICalValue';

my @strings         = my ($string-a, $string-b) = <a b>.map('string_' ~ *);
my ($val-a, $val-b) = @strings.map({ ICal::GLib::Value.new-from-string($kind, $_) });
my $comp-result     = $val-a.compare($val-b);
is $comp-result,      I_CAL_XLICCOMPARETYPE_NOTEQUAL, "'{ $string-a }' and '{ $string-b }' are not equal";

my $kind-string = ICal::GLib::Value::Kind.to-string($kind);
is $kind-string,      'ATTACH',                       'Enum value converted to string matches expected value';
my $conv-string = ICal::GLib::Value::Kind.from-string($kind-string);
is $conv-string,      $kind,                          'Kind enum roundtrips vis string';

my $szText    = "This is a text\nand this is a new line";
my $after-op  = "This is a text\\nand this is a new line";
my $before-op = "This is a text\\\nand this is a new line";
my $result = ICal::GLib::Value.encode-ical-string($szText);
is $result,           $after-op,                      'Encoded value matches expectation';

$result = ICal::GLib::Value.decode-ical-string($before-op);
is $result,           $szText,                        'Decoded value matches expectation';

$result = ICal::GLib::Value.encode-ical-string($szText = 'Simple text');
is $result,           $szText,                        'Encoded simple value matches expectation';
$result = ICal::GLib::Value.decode-ical-string($result);
is $result,           $szText,                        'Decoded simple value matches expectation';
