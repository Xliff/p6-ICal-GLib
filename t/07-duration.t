use v6.c;

use Test;

use ICal::GLib::Raw::Types;

use ICal::GLib::Duration;

my ($length, $bad-string) = (1e9, 'This is a bad string');

my $duration = ICal::GLib::Duration.new-from-int($length);
is $duration.Int,  $length,        'Duration object matches expected length when rendered as an integer';

my $duration1 = ICal::GLib::Duration.new-from-string(~$duration);
is ~$duration,     ~$duration,     'String representation of both duration objects are equivalent';
is $duration1.Int, $length,        'String representation of Duration1 matches length when converted to Int';

$duration         = ICal::GLib::Duration.new-from-string($bad-string);
my $duration-bad  = ICal::GLib::Duration.new-bad-duration;
is ~$duration,    ~$duration-bad,  'String representations of bad duration objects are equivalent';
ok $duration.is-bad-duration,      'Duration object is recognized as BAD';

my $duration-null = ICal::GLib::Duration.new-null-duration;
ok $duration.is-null-duration,     'Duration object is recognized as NULL';
