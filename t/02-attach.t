use v6.c;

use Test;



use ICal::GLib::Attach;

my $dummy-url = 'https://people.gnome.org/~engagement/logos/GnomeLogoVertical.svg';
my $dummy-data = "It's a super large attachment";

my $attach-url = ICal::GLib::Attach.new-from-url($dummy-url);
ok  $attach-url.is-url,                'Attach object is a URL';

is  $attach-url.url,    $dummy-url,    'URL of Attach object matches string it was created from';

my $attach-data = ICal::GLib::Attach.new-from-data($dummy-data);
nok $attach-data.is-url,                'Data object is NOT a URL';

my $value = $attach-data.data(:buf, size => $dummy-data.chars).decode;
is  $value,             $dummy-data,    'Attach-object-as-string matches string it was created from';
