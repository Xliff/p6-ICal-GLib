use v6.c;

use Test;

use ICal::GLib::Raw::Types;
use ICal::GLib::Recurrence;

constant IGR = ICal::GLib::Recurrence;

my $weekday = IGR.day-day-of-week(0);
is $weekday,                        I_CAL_NO_WEEKDAY,                   '.day-day-of-week returns I_CAL_NO_WEEKDAY';
$weekday = IGR.day-day-of-week(1);
is $weekday,                        I_CAL_SUNDAY_WEEKDAY,               '.day-day-of-week returns I_CAL_SUNDAY_WEEKDAY';

is IGR.day-position(15),            1,                                  'Recurrence day position 15 is 1';
is IGR.day-position(16),            2,                                  'Recurrence day position 16 is 2';
is IGR.day-position(25),            3,                                  'Recurrence day position 25 is 3';

# Skip encoding tests as those routines no longer exist!

my $string = 'COUNT=10;FREQ=DAILY';
my $recurrence = ICal::GLib::Recurrence.new-from-string($string);
is ~$recurrence,                    'FREQ=DAILY;COUNT=10',              'Recurrence object string representation matches expectation';

my $by-second = $recurrence.get-by-second-array;
ok $by-second.elems == (61, 62).any,                                    'BySecond array has the proper number of elements';

my $by-minute = $recurrence.get-by-minute-array;
ok $by-minute.elems == 61,                                              'ByMinute array has the proper number of elements';

my $by-hour = $recurrence.get-by-hour-array;
ok $by-hour.elems == 25,                                                'ByHour array has the proper number of elements';

my $by-day = $recurrence.get-by-day-array;
ok $by-day.elems == (364, 386).any,                                     'ByDay array has the proper number of elements';

my $by-month-day = $recurrence.get-by-month-day-array;
ok $by-month-day.elems == 32,                                           'ByMonthDay array has the proper number of elements';

my $by-year-day = $recurrence.get-by-year-day-array;
ok $by-year-day.elems ==(367, 386).any,                                 'ByYearDay array has the proper number of elements';

my $by-week-no = $recurrence.get-by-week-no-array;
ok $by-week-no.elems ==(54, 56).any,                                    'ByWeekNo array has the proper number of elements';

my $by-month = $recurrence.get-by-month-array;
ok $by-month.elems ==(13, 14).any,                                      'ByMonth array has the proper number of elements';

my $by-set-pos = $recurrence.get-by-set-pos-array;
ok $by-set-pos.elems ==(367, 386).any,                                  'BySetPos array has the proper number of elements';

{
  $recurrence.set-by-second(0, 1);
  $recurrence.set-by-second(1, I_CAL_RECURRENCE_ARRAY_MAX);
  is $recurrence.get-by-second(0),     1,                                 'Recurrence by-second at position 0 is 1';
  is $recurrence.get-by-second(1),     I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence by-second at position 1 is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  my $array = $recurrence.get-by-second-array;

  #diag "A: { $array.Array(:raw).map({ .defined ?? .gist !! 0 }) }";
  #diag "A.elems: { $array.elems }";;

  is $array[0],                        1,                                 'Recurrence by-second at position 0 (array) is 1';
  is $array[1],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence by-second at position 1 (array) is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  $array = (100, 101);
  is $array.elems,                     2,                                 'Recurrence array has the proper number of elements, after assignment';
  $recurrence.set_by_second_array($array);
  is $recurrence.get-by-second(0),     100,                               'Recurrence .get-by-second index 0 is 100';
  is $recurrence.get-by-second(1),     101,                               'Recurrence .get-by-second index 1 is 101';
  is $recurrence.get-by-second(2),     I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-second index 2 is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  $array = $recurrence.get-by-second-array;

  diag "A: { $array.Array(:raw).map({ .defined ?? .gist !! 0 }) }";
  diag "A.elems: { $array.elems }";;

  is $array[0],                        100,                               'Recurrence .get-by-second index 0 is 100';
  is $array[1],                        101,                               'Recurrence .get-by-second index 1 is 101';
  is $array[2],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-second index 2 is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
}

{
  $recurrence.set-by-minute(0, 2);
  $recurrence.set-by-minute(1, I_CAL_RECURRENCE_ARRAY_MAX);
  is $recurrence.get-by-minute(0),     2,                                 'Recurrence by-minute at position 0 is 2';
  is $recurrence.get-by-minute(1),     I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence by-minute at position 1 is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  my $array = $recurrence.get-by-minute-array;
  is $array[0],                        2,                                 'Recurrence by-minute at position 0 (array) is 1';
  is $array[1],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence by-minute at position 1 (array) is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  $array = (200, 201);
  $recurrence.set-by-minute-array($array);
  is $recurrence.get-by-minute(0),     200,                               'Recurrence .get-by-minute index 0 is 200';
  is $recurrence.get-by-minute(1),     201,                               'Recurrence .get-by-minute index 1 is 201';
  is $recurrence.get-by-minute(2),     I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-minute index 2 is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  $array = $recurrence.get-by-minute-array;
  is $array[0],                        200,                               'Recurrence .get-by-minute index 0 is 200';
  is $array[1],                        201,                               'Recurrence .get-by-minute index 1 is 201';
  is $array[2],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-minute index 2 is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
}

{
  $recurrence.set-by-hour(0, 3);
  $recurrence.set-by-hour(1, I_CAL_RECURRENCE_ARRAY_MAX);
  is $recurrence.get-by-hour(0),       3,                                 'Recurrence by-hour at position 0 is 3';
  is $recurrence.get-by-hour(1),     I_CAL_RECURRENCE_ARRAY_MAX.Int,      'Recurrence by-hour at position 1 is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  my $array = $recurrence.get-by-hour-array;
  is $array[0],                        3,                                 'Recurrence by-hour at position 0 (array)   is 1';
  is $array[1],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence by-hour at position 1 (array) is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  $array = (300, 301);
  $recurrence.set-by-hour-array($array);
  is $recurrence.get-by-hour(0),       300,                               'Recurrence .get-by-hour index 0 is 300';
  is $recurrence.get-by-hour(1),       301,                               'Recurrence .get-by-hour index 1 is 301';
  is $recurrence.get-by-hour(2),       I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-hour index 2 is I_CAL_RECURRENCE_ARRAY_MAX   (Int)';
  $array = $recurrence.get-by-hour-array;
  is $array[0],                        300,                               'Recurrence .get-by-hour index 0 is 300';
  is $array[1],                        301,                               'Recurrence .get-by-hour index 1 is 301';
  is $array[2],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-hour index 2 is I_CAL_RECURRENCE_ARRAY_MAX   (Int)';
}

{
  $recurrence.set-by-day(0, 4);
  $recurrence.set-by-day(1, I_CAL_RECURRENCE_ARRAY_MAX);
  is $recurrence.get-by-day(0),        4,                                 'Recurrence by-day at position 0 is 4';
  is $recurrence.get-by-day(1),        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence by-day at position 1 is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  my $array = $recurrence.get-by-day-array;
  is $array[0],                        4,                                 'Recurrence by-day at position 0 (array)   is 1';
  is $array[1],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence by-day at position 1 (array) is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  $array = (400, 401);
  $recurrence.set-by-day-array($array);
  is $recurrence.get-by-day(0),        400,                               'Recurrence .get-by-day index 0 is 400';
  is $recurrence.get-by-day(1),        401,                               'Recurrence .get-by-day index 1 is 401';
  is $recurrence.get-by-day(2),        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-day index 2 is I_CAL_RECURRENCE_ARRAY_MAX   (Int)';
  $array = $recurrence.get-by-day-array;
  is $array[0],                        400,                               'Recurrence .get-by-day index 0 is 400';
  is $array[1],                        401,                               'Recurrence .get-by-day index 1 is 401';
  is $array[2],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-day index 2 is I_CAL_RECURRENCE_ARRAY_MAX   (Int)';
}

{
  $recurrence.set-by-month-day(0, 5);
  $recurrence.set-by-month-day(1, I_CAL_RECURRENCE_ARRAY_MAX);
  is $recurrence.get-by-month-day(0),  5,                                 'Recurrence by-month_day at position 0 is 5';
  is $recurrence.get-by-month-day(1),  I_CAL_RECURRENCE_ARRAY_MAX.Int,        'Recurrence by-month_day at position 1 is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  my $array = $recurrence.get-by-month-day-array;
  is $array[0],                        5,                                 'Recurrence by-month_day at position 0 (array)   is 1';
  is $array[1],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence by-month_day at position 1 (array) is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  $array = (500, 501);
  $recurrence.set-by-month-day-array($array);
  is $recurrence.get-by-month-day(0),  500,                               'Recurrence .get-by-month_day index 0 is 500';
  is $recurrence.get-by-month-day(1),  501,                               'Recurrence .get-by-month_day index 1 is 501';
  is $recurrence.get-by-month-day(2),  I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-month_day index 2 is I_CAL_RECURRENCE_ARRAY_MAX   (Int)';
  $array = $recurrence.get-by-month-day-array;
  is $array[0],                        500,                               'Recurrence .get-by-month_day index 0 is 500';
  is $array[1],                        501,                               'Recurrence .get-by-month_day index 1 is 501';
  is $array[2],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-month_day index 2 is I_CAL_RECURRENCE_ARRAY_MAX   (Int)';
}

{
  $recurrence.set-by-year-day(0, 6);
  $recurrence.set-by-year-day(1, I_CAL_RECURRENCE_ARRAY_MAX);
  is $recurrence.get-by-year-day(0),   6,                                 'Recurrence by-year_day at position 0 is 6';
  is $recurrence.get-by-year-day(1),   I_CAL_RECURRENCE_ARRAY_MAX.Int,        'Recurrence by-year_day at position 1 is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  my $array = $recurrence.get-by-year-day-array;
  is $array[0],                        6,                                 'Recurrence by-year_day at position 0 (array)   is 1';
  is $array[1],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence by-year_day at position 1 (array) is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  $array = (600, 601);
  $recurrence.set-by-year-day-array($array);
  is $recurrence.get-by-year-day(0),   600,                               'Recurrence .get-by-year_day index 0 is 600';
  is $recurrence.get-by-year-day(1),   601,                               'Recurrence .get-by-year_day index 1 is 601';
  is $recurrence.get-by-year-day(2),   I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-year_day index 2 is I_CAL_RECURRENCE_ARRAY_MAX   (Int)';
  $array = $recurrence.get-by-year-day-array;
  is $array[0],                        600,                               'Recurrence .get-by-year_day index 0 is 600';
  is $array[1],                        601,                               'Recurrence .get-by-year_day index 1 is 601';
  is $array[2],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-year_day index 2 is I_CAL_RECURRENCE_ARRAY_MAX   (Int)';
}

{
  $recurrence.set-by-week-no(0, 7);
  $recurrence.set-by-week-no(1, I_CAL_RECURRENCE_ARRAY_MAX);
  is $recurrence.get-by-week-no(0),    7,                                 'Recurrence by-week_no at position 0 is 7';
  is $recurrence.get-by-week-no(1),    I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence by-week_no at position 1 is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  my $array = $recurrence.get-by-week-no-array;
  is $array[0],                        7,                                 'Recurrence by-week_no at position 0 (array)   is 1';
  is $array[1],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence by-week_no at position 1 (array) is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  $array = (700, 701);
  $recurrence.set-by-week-no-array($array);
  is $recurrence.get-by-week-no(0),    700,                               'Recurrence .get-by-week_no index 0 is 700';
  is $recurrence.get-by-week-no(1),    701,                               'Recurrence .get-by-week_no index 1 is 701';
  is $recurrence.get-by-week-no(2),    I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-week_no index 2 is I_CAL_RECURRENCE_ARRAY_MAX   (Int)';
  $array = $recurrence.get-by-week-no-array;
  is $array[0],                        700,                               'Recurrence .get-by-week_no index 0 is 700';
  is $array[1],                        701,                               'Recurrence .get-by-week_no index 1 is 701';
  is $array[2],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-week_no index 2 is I_CAL_RECURRENCE_ARRAY_MAX   (Int)';
}

{
  $recurrence.set-by-set-pos(0, 8);
  $recurrence.set-by-set-pos(1, I_CAL_RECURRENCE_ARRAY_MAX);
  is $recurrence.get-by-set-pos(0),    8,                                 'Recurrence by-set_pos at position 0 is 8';
  is $recurrence.get-by-set-pos(1),    I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence by-set_pos at position 1 is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  my $array = $recurrence.get-by-set-pos-array;
  is $array[0],                        8,                                 'Recurrence by-set_pos at position 0 (array)   is 1';
  is $array[1],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence by-set_pos at position 1 (array) is I_CAL_RECURRENCE_ARRAY_MAX (Int)';
  $array = (800, 801);
  $recurrence.set-by-set-pos-array($array);
  is $recurrence.get-by-set-pos(0),    800,                               'Recurrence .get-by-set_pos index 0 is 800';
  is $recurrence.get-by-set-pos(1),    801,                               'Recurrence .get-by-set_pos index 1 is 801';
  is $recurrence.get-by-set-pos(2),    I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-set_pos index 2 is I_CAL_RECURRENCE_ARRAY_MAX   (Int)';
  $array = $recurrence.get-by-set-pos-array;
  is $array[0],                        800,                               'Recurrence .get-by-set_pos index 0 is 800';
  is $array[1],                        801,                               'Recurrence .get-by-set_pos index 1 is 801';
  is $array[2],                        I_CAL_RECURRENCE_ARRAY_MAX.Int,    'Recurrence .get-by-set_pos index 2 is I_CAL_RECURRENCE_ARRAY_MAX   (Int)';
}

{
  $recurrence.set-by-second(0, 13);
  my $by-second = $recurrence.get-by-second-array;
  is $by-second[0],                    13,                                'Recurrence .get-by-second index 0 is 13';
}

$recurrence = ICal::GLib::Recurrence.new-from-string($string);
my $mo = ICal::GLib::Recurrence.weekday-from-string('MO');
is $mo,                              I_CAL_MONDAY_WEEKDAY,                '.weekday-from-string can identify from a substring';

my $start = 100000;
my $result = ICal::GLib::Recur.expand_recurrence($string, $start, 10);
my $sec-per-day = 24 * 60 * 60; # 86400
for ^10 {
  is +$result[$_],                     $start + $_* $sec-per-day,         ".expand_recur index $_ test passed";
}

use ICal::GLib::Period;
use ICal::GLib::RecurIterator;

$string         = '19970101T183248Z/19970102T071625Z';
my $period      = ICal::GLib::Period.new-from-string($string);
$start          = $period.start;
my $iter        = ICal::GLib::RecurIterator.new($recurrence, $start);
my $timetype    = $iter.next;
my ($day, $ref) = ($timetype.day, 1);

while $day {
  is $day,                             $ref,                              "Day == Ref (idx {$ref}) while looping";
  $ref++;
  ($timetype, $day) = ($iter.next, $timetype.day);
}
#
# $recurrence = ICal::GLib::Recurrence.new-from-string($string);
# $start      = ICal::GLib::Time.new-from-string('20161224T000000Z');
# $iter       = ICal::GLib::RecurIterator.new($recurrence, $start);
#
# # Note reuse of start, since the last assignment is no longer necessary after
# # init of $iter
# $start      = ICal::GLib::Time.new-from-string('20181224T000000Z');
# is $iter.set-start($start),          0,                                 'Could not .set-start on an ivalid start date';
#
# $recurrence = ICal::GLib::Recurrence.new-from-string('FREQ=YEARLY');
# $start      = ICal::GLib::Time.new-from-string('20161224T000000Z');
# $iter       = ICal::GLib::RecurIterator.new($recurrence, $start);
# # Reuse, again
# $start      = ICal::GLib::Time.new-from-string('20181224T000000Z');
# is $iter.set-start($start),          1,                                 '.set-start can be used on a valid start date';
# is $iter.next,                       2018,                              'Iter starts properly with value of 2018';
# is $iter.next,                       2019,                              'Iter\'s next value is 2019';
