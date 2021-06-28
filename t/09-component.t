use v6.c;

use Test;
use lib <. t>;

use ICal::GLib::Raw::Types;

use ICal::GLib::Component;

use ComponentVariables;

class TestCounter {
  has $.counter = 0;

  method inc { ++$!counter }
}

my $comp   = ICal::GLib::Component.new-from-string( @events[0] );
my $clone  = $comp.clone;
is     ~$clone,                          ~$comp,                 'String representations of the component, and its clone, are identical';
ok     $comp.is-valid,                                           'Component is valid';
ok     $comp.isa-component,                                      'Component is an ICalComponent';
is     $comp.isa,                        I_CAL_VEVENT_COMPONENT, 'Component\'s type is I_CAL_VEVENT_COMPONENT';

nok    $comp.check-restrictions,                                 'No restrictions found';
nok    $comp.count-errors,                                       'No errors found';

constant IGCK = ICal::GLib::Component::Kind;
ok     IGCK.is-valid(I_CAL_VEVENT_COMPONENT),                    'Enum I_CAL_VEVENT_COMPONENT is a valid value';
my $kind-string = IGCK.to-string(I_CAL_VEVENT_COMPONENT);
is     IGCK.from_string($kind-string),   I_CAL_VEVENT_COMPONENT, 'I_CAL_VEVENT_COMPONENT can be round-tripped via string';

my $parent = ICal::GLib::Component.new-from-string( @events[0] );
my @comp   = @events[1..*].map({ ICal::GLib::Component.new-from-string($_) });
$parent.add-component($_) for @comp;

{
  my $vevents = $parent.count-components(I_CAL_VEVENT_COMPONENT);
  is   $vevents,                         3,                      'Parent component has 3 I_CAL_VEVENT_COMPONENT children';

  my $vcalendars = $parent.count-components(I_CAL_VCALENDAR_COMPONENT);
  is   $vcalendars,                      1,                      'Parent component has only a single I_CAL_VCALENDAR_COMPONENT';
}

diag 'Traversing Using Internal API';
my $count = $parent.count_components(I_CAL_VEVENT_COMPONENT);
my $child-component = $parent.get-first-component(I_CAL_VEVENT_COMPONENT);
for ^$count {
  my ($prefix, $index) = ('test', $_ + 2);
  is   $child-component.summary,         $prefix ~ $index,       "Component summary at index { $index } is correct";
  $child-component = $parent.get-next-component(I_CAL_VEVENT_COMPONENT)
    if $_ != $count - 1;
}

diag 'Traversing Using External API';
my $iter = $parent.begin-component(I_CAL_VEVENT_COMPONENT);
($child-component = $iter.current).parent = $parent;
for ^$count {
  my ($prefix, $index) = ('test', $_ + 2);
  is   $child-component.summary,         $prefix ~ $index,       "Component summary at index { $index } is correct";
  ($child-component = $iter.next).parent = $parent if $_ != $count - 1;
}

$iter = $parent.end-component(I_CAL_VEVENT_COMPONENT);
($child-component = $iter.prior).parent = $parent;
for ^$count {
  my ($prefix, $index) = ('test', $count + 1 - $_);
  is   $child-component.summary,         $prefix ~ $index,       "Component summary at index { $index } is correct (rev)";
  ($child-component = $iter.prior).parent = $parent if $_ != $count - 1;
}

$iter            = $parent.begin-component(I_CAL_VEVENT_COMPONENT);
$child-component = $iter.current;

for ^$count {
  $iter.next if $_ != $count - 1;
  $parent.remove-component($child-component);
  $child-component = $iter.current if $_ != $count - 1;
}

{
  my $components-left = $parent.count-components(I_CAL_VEVENT_COMPONENT);
  is   $components-left,                 0,                       'No components left after iterated removal';
}

{
  my @property-strings = (
    'SUMMARY:Bastille Day Party',
    'SUMMARY:event-uid-123',
    'SUMMARY:20140306T090000'
  );
  my @string-properties = @property-strings.map({
      ICal::GLib::Property.new-from-string($_);
  });
  my $component = ICal::GLib::Component.new(I_CAL_VEVENT_COMPONENT);
  $component.add-property(@string-properties.head);

  my $sKind = I_CAL_SUMMARY_PROPERTY;
  my $p-elems = $component.count-properties($sKind);
  is   $p-elems,                         1,                      'Created component has one property';

  $component.remove-property(@string-properties.head);
  $p-elems = $component.count-properties($sKind);
  is   $p-elems,                         0,                      'Component has no properties after property removal';

  $component.add-property($_) for @string-properties;
  for @property-strings.kv -> $k, $v {
    my $p = $k.not ?? .get-first-property($sKind) !! .get-next-property($sKind)
      given $component;
    is (~$p).chomp,                      $v,                     "Property matches expected value of '{ $v }'";
  }
}

{
  my $component = ICal::GLib::Component.new-from-string( @events[0] );
  is   ~$comp.dtstart,                   '20140306T090000',      'Component from first event\'s .dtstart matches expected value';
  is   ~$comp.dtend,                     '20140306T093000',      'Component from first event\'s .dtend matches expected value';
}
