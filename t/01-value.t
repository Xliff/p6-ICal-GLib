#!/usr/bin/env raku

use ICal::GLib::Raw::Types;
use ICal::GLib::Value;

use Test;

plan 19;

my $kind = I_CAL_ATTACH_VALUE;
my $val  = ICal::GLib::Value.new($kind, :kind);

ok $val.is-valid,                                              'Value is valid';
is $val.isa,                  $kind,                           'Value is an I_CAL_ATTACH_VALUE';
ok $val.isa-value,                                             'Value is recognized as an ICalValue';

my $string = 'This is a link';
my $val-from-string = ICal::GLib::Value.new-from-string($kind, $string);
is ~$val-from-string,          $string,                        'Value and string contain the same data';
ok $val-from-string.is-valid,                                  'Value object from string is valid';
is $val-from-string.isa,       $kind,                          'Value is an I_CAL_ATTACH_VALUE';
ok $val-from-string.isa-value,                                 'Value from string is recognized as an ICalValue';

my $vfs-clone = $val-from-string.clone;
is ~$vfs-clone,                $string,                        'Cloned value from string contains proper data';
ok $vfs-clone.is-valid,                                        'Cloned value is a valid value';
is $vfs-clone.isa,             $kind,                          'Cloned value is an I_CAL_ATTACH_VALUE';

my $val-a = ICal::GLib::Value.new(I_CAL_RECUR_VALUE, :kind);
my $val-b = ICal::GLib::Value.new(I_CAL_ATTACH_VALUE, :kind);
is $val-a.compare($val-b),     I_CAL_XLICCOMPARETYPE_NOTEQUAL, '(from .new) ValueA is NOT EQUAL to ValueB';

my ($string-a, $string-b) = 'a string' xx 2;
($val-a, $val-b) = ($string-a, $string-b).map({ ICal::GLib::Value.new-from-string($kind, $_) });
is $val-a.compare($val-b),     I_CAL_XLICCOMPARETYPE_EQUAL,    '(from strings) ValueA is EQUAL to ValueB';

($string-a, $string-b) = ('a string', 'b string');
($val-a, $val-b) = ($string-a, $string-b).map({ ICal::GLib::Value.new-from-string($kind, $_) });
is $val-a.compare($val-b),     I_CAL_XLICCOMPARETYPE_NOTEQUAL, '(from different strings) ValueA is NOT EQUAL to ValueB';

my $kstr = ICal::GLib::Value::Kind.to-string($kind);
is $kstr,                      'ATTACH',                       '$kind, converted to an enum is \'ATTACH\'';
my $kind2 = ICal::GLib::Value::Kind.from-string($kstr);
is $kind2,                     $kind,                          '$kind value properly roundtrips to I_CAL_ATTACH_VALUE';

my $szText                = "This is a text\nand this is a new line";
my $after-encoded-szText  = 'This is a text\\nand this is a new line';
my $before-decoded-szText = "This is a text\\\nand this is a new line";

my $result = ICal::GLib::Value.encode_ical_string($szText);
is $result,                    $after-encoded-szText,          'String encodes properly via .encode-ical-string';
$result    = ICal::GLib::Value.decode_ical_string($before-decoded-szText);
is $result,                    $szText,                        'String decodes properly via .decode-ical-string';

$szText = 'Simple text';
$result = ICal::GLib::Value.encode-ical-string($szText);
is $result, $szText,                                           'Simple text does not change on encode';
$result = ICal::GLib::Value.decode-ical-string($result);
is $result, $szText,                                           'Simple text does not change on decode';
