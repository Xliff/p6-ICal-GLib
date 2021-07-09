use v6.c;

use Test;

use ICal::GLib::Raw::Types;

use ICal::GLib::Component;

use lib <. t>;

use ComponentVariables;

my $combined = @events.map( *.&crlf.chomp ).join("\r\n");

sub MAIN {

  my ($parent, @comp);
  for @combined-events {
    once {
      $parent = ICal::GLib::Component.new-from-string($_);
      next;
    }
    @comp.push: ICal::GLib::Component.new-from-string($_);
    $parent.add_component(@comp.tail);
  }

  is     (~$parent).&chomp,   $combined,                                  'Parent node is equivalent to combined string representation';
  my $count = $parent.count-components(I_CAL_VEVENT_COMPONENT);

  for @comp {
    next unless (.summary // '') eq 'childEvent2';

    .summary = 'childEventTwo';
    ( .dtstart, .dtend )    = <20141115T211923 20141115T221923>;
    ( .dtstamp, .location ) = ( .dtstart, 'East Lansing, MI, US' );
    .relcalid = 'relcalid for childEventTwo';

    my $recur-string = 'RRULE:FREQ=DAILY;INTERVAL=10;COUNT=5';
    .add-property( ICal::GLib::Property.new-from-string($recur-string) );
  }

  my $kind = I_CAL_VEVENT_COMPONENT;
  loop (
    my $comp = $parent.get-first-component($kind);
    $comp;
    $comp = $parent.get-next-component($kind)
  ) {
    given $comp {
      next unless .summary eq 'childEventTwo';

      is ~.dtstart,         '20141115T211923',                          'Child Event Two has the proper starting time';
      is ~.dtend,           '20141115T221923',                          'Child Event Two has the proper ending time';
      is ~.dtstamp,         '20141115T211923',                          'Child Event Two has proper time stamp';
      is .location,         'East Lansing, MI, US',                     'Child Event Two has the proper location';
      is .relcalid,         'relcalid for childEventTwo',               'Child Event Two has the proper .relcalid';

      my $recur-prop = .get-first-property(I_CAL_RRULE_PROPERTY);
      is ~$recur-prop,      "RRULE:FREQ=DAILY;COUNT=5;INTERVAL=10\r\n", 'Child Event Two has the proper recurrence rule';
    }
  }
}
