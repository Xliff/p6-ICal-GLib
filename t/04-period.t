use Test;

use ICal::GLib::Raw::Types;

use ICal::GLib::Duration;
use ICal::GLib::Period;

plan 32;

my $string = '19970101T183248Z/19970102T071625Z';
my $period = ICal::GLib::Period.new-from-string($string);

is  $period.as-ical-string,      $string,   'Period can be serialized to string, properly';

my  $null-period = ICal::GLib::Period.new-null-period;
ok  $null-period.is-null-period,            'Created null period is indeed a null period';
nok $period.is-null-period,                 'First period is NOT a null period';

ok $null-period.is-valid-period,            'Null period is considered valid';
ok $period.is-valid-period,                 'First period is considered valid';

my $start = $period.start;
is $start.year,                  1997,      'First period starts in 1997';
is $start.month,                 1,         'First period starts in January';
is $start.day,                   1,         'First period starts on the 1st';
is $start.hour,                  18,        'First period starts during the 6PM hours';
is $start.minute,                32,        'First period starts 32 minutes after the hour';
is $start.second,                48,        'First period starts 48 seconds after the minute';

my $end = $period.end;
is $end.year,                    1997,      'First period ends in 1997';
is $end.month,                   1,         'First period ends in January';
is $end.day,                     2,         'First period ends on the 2nd';
is $end.hour,                    7,         'First period ends during the 7AM hour';
is $end.minute,                  16,        'First period ends 16 minutes after the hour';
is $end.second,                  25,        'First period ends 25 seconds after the minute';

my $duration= $period.duration;
is $duration.as_int,             0,         'Duration object, rendered as an integer, is 0';

$string = '19970101T182346Z/PT5H30M';
$period = ICal::GLib::Period.new-from-string($string);
is ~$period,                     $string,   'A new period object matches the string it was created from, when stringified';

$start = $period.start;
is $start.year,                  1997,      'Second period starts in 1997';
is $start.month,                 1,         'Second period starts in January';
is $start.day,                   1,         'Second period starts on the 1st';
is $start.hour,                  18,        'Second period starts during the 6PM hour';
is $start.minute,                23,        'Second period starts 23 minutes after the hour';
is $start.second,                46,        'Second period starts 46 seconds after the minute';

$end = $period.end;
is $end.year,                    0,         'Second period has no ending value for the year';
is $end.month,                   0,         'Second period has no ending value for the month';
is $end.day,                     0,         'Second period has no ending value for the day';
is $end.hour,                    0,         'Second period has no ending value for the hour';
is $end.minute,                  0,         'Second period has no ending value for the minute';
is $end.second,                  0,         'Second period has no ending value for the second';

$duration = $period.duration;
is ~$duration,                   'PT5H30M', 'Second period duration matches expected value when converted to a string';
