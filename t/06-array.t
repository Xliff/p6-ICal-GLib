use v6.c;

use Test;

use ICal::GLib::Raw::Types;

use ICal::GLib::Array;
use ICal::GLib::Timezone;

my $array = ICal::GLib::Timezone::Array.new;

my @zones;
@zones.push( ICal::GLib::Timezone.get-builtin-timezone($_) ) for <
  Pacific/Midway
  America/Vancouver
  Atlantic/Bermuda
  Africa/Casablanca
  Asia/Irkutsk
>;
$array.append-from-vtimezone(@zones);

is   $array.elems,         5,                 'Array contains 5 components';
for @zones.kv -> $k, $v {
  is $array[$k].location,  $v.location,       "Array component { $k + 1 } and zone { $k + 1 } have the same location";
}

my $array2 = $array.copy;
is   $array2.elems,        5,                 'Copied array has 5 components';
for @zones.kv -> $k, $v {
  is $array2[$k].location, $v.location,       "Copied Array component { $k + 1 } and zone { $k + 1 } have the same location";
}

$array.remove-element-at(2);
is   $array.elems,        4,                  'Copied array has 4 components, after deletion of index 2';
for @zones.kv -> $k is copy, $v {
  next if $k == 2;
  $k-- if $k > 2;
  is $array[$k].location, $v.location,        "Array component { $k + 1 } and zone { $k + 1 } have the same location";
}
