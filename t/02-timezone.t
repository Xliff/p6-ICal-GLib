#!/usr/bin/env raku

use Test;

use ICal::GLib::Component;
use ICal::GLib::Time;
use ICal::GLib::Timezone;

sub compareTimes ($time, $timeclone, $pre = '') {
  is $time."{ $_ }"(),     $timeclone."{ $_ }"(),    "{ $pre }Time object and its clone agree on the { $_ }"
    for <year month day hour minute second>;
  ok $time.timezone.equals($timeclone.timezone),     $pre ~ 'Time object and its clone agree on the timezone';
  is $time."is_{ $_ }"(),  $timeclone."is_{ $_ }"(), "{ $pre }Time object and its clone agree on the state of { $_ }"
    for <date daylight utc>;
}

sub MAIN {

  unless (my $zid = %*ENV<ZONEINFO_DIRECTORY>) {
    say 'Error: The ZONEINFO_DIRECTORY environment variable isn\'t set';
    exit 1;
  }

  unless $zid.IO.d {
    say "Error: The ZONEINFO_DIRECTORY environment variable isn't {
         '' }properly set";
    exit 1;
  }

  ICal::GLib::Timezone.set-zone-directory($zid);
  ICal::GLib::Timezone.set-tzid-prefix('/citadel.org/');

  my $la      = ICal::GLib::Timezone.get-builtin-timezone('America/Los_Angeles');
  my $chicago = ICal::GLib::Timezone.get-builtin-timezone('America/Chicago');

  plan 50;

  ok $la.tzid.contains('Los_Angeles'),    "\$la TZID contains 'Los_Angeles'";
  is  $la.location,         'America/Los_Angeles',    '$la Location contains the correct value';
  is  $la.tznames,          'PST/PDT',                '$la time zone names are correct';

  my $la-copy = $la.clone;
  is  $la-copy.tzid,        $la.tzid,                 'LA TZ Object and Clone agree on TZID';
  is  $la-copy.location,    $la.location,             'LA TZ Object and Clone agree on location';

  my $timezones = ICal::GLib::Timezone.get-builtin-timezones;
  my $timezone  = $timezones.element-at(0);
  if ICal::GLib::Timezone.builtin-tzdata {
    is  $timezone.location, 'Europa/Andorra',         'First element in Static Timezone data has the correct location';
  }
  ok  $timezones.elems > 0,                           'There is at least one built-in Timezone element';

  my $from-tzid = ICal::GLib::Timezone.get-builtin-timezone-from-tzid($la.tzid);
  is  $from-tzid.location,  'America/Los_Angeles',    'TZ Object created from the LA object has the correct location';

  my $utc = ICal::GLib::Timezone.utc-timezone;
  is  $utc.display-name,    'UTC',                    'UTC TZ Object has the correct display name';
  my $utc2 = ICal::GLib::Timezone.utc-timezone;
  ok  $utc.equals($utc2),                             'UTC TZ Objects from .get_utc_timezone are the same object';

  my $time   = ICal::GLib::Time.new;
  my $before = $time.hour;
  $time.convert-timezone($la, $chicago);
  my $after  = $time.hour;
  my $diff   = ($after - $before).abs;

  is  $diff,                2,                        'TZ difference computation yields 2 hours';
  $time.set-timezone($utc),
  ok  $time.timezone.equals($utc),                    'Time Object\'s timezone reports it is UTC after being set to UTC';
  $time.set-timezone($la);
  ok  $time.timezone.equals($la),                     'Time Object\'s timezone reports its timezone matches the LA object, after being set to the LA object';

  my $timeclone = $time.clone;
  nok $time.equals($timeclone),                       'Time and Timeclone are different objects';
  $time      = $time.convert-to-zone($chicago);
  $timeclone.convert-to-zone-inplace($chicago);
  compareTimes($time, $timeclone);

  $timeclone = $time.clone;
  nok $time.equals($timeclone),                       '(after cloning) Time and Timeclone are different objects';
  compareTimes($time, $timeclone, '(after cloning) ');

  $time.date = (2019, 1, 24);
  is  $time.year,            2019,                     'Time object\'s year is 2019';
  is  $time.month,           1,                        'Time object\'s month is 1';
  is  $time.day,             24,                       'Time object\'s day is 24';

  my $t = $time.date;
  is  $t[0],                 2019,                     '(.date index 0) Time object\'s year is 2019';
  is  $t[1],                 1,                        '(.date index 1) Time object\'s month is 1';
  is  $t[2],                 24,                       '(.date index 2) Time object\'s day is 24';

  $time.time = (12, 11, 10);
  is  $time.hour,            12,                       'Time object\'s hour is 12';
  is  $time.minute,          11,                       'Time object\'s minute is 11';
  is  $time.second,          10,                       'Time object\'s second is 10';

  my $tm = $time.time;
  is  $tm[0],                12,                       '(.time index 0) Time object\'s year is 12';
  is  $tm[1],                11,                       '(.time index 1) Time object\'s month is 11';
  is  $tm[2],                10,                       '(.time index 2) Time object\'s day is 10';

  ($timezone = ICal::GLib::Timezone.new).component =
    (my $la-comp-clone = $la.component.clone);
  is $timezone.location,     $la.location,             'Location of a newly created timezone equals LA\'s, after sharing a .component';

  my $array = ICal::GLib::Timezone::Array.new;
  $array.append-from-vtimezone($_) for $la-comp-clone, $chicago.component;
  is $array.elems,           2,                        'Newly created timezone array has 2 elements';
  is $array[0].display-name, $la.display-name,         'Timezone Array Index 0 location is the same as LA';
  is $array[1].display-name, $chicago.display-name,    'Timezone Array Index 1 location is the same as Chicago';

  ICal::GLib::Timezone.free-builtin-timezones;
  ICal::GLib::Object.free-global-objects;

}
