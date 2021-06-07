use v6.c;

use Method::Also;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Property;

use ICal::GLib::Object;
use ICal::GLib::Time;

our subset ICalPropertyAncestry is export of Mu
  where ICalProperty | ICalObjectAncestry;

# For when ICal::GLib::Property exists
class ICal::GLib::Property is ICal::GLib::Object {
  has ICalProperty $!icp;

  submethod BUILD (:$ical-component) {
    self.setICalProperty($ical-component) if $ical-component;
  }

  method setICalProperty(ICalPropertyAncestry $_) {
    my $to-parent;

    $!icp = do {
      when ICalProperty {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalProperty, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalProperty
    is also<ICalProperty>
  { $!icp }

  method get_datetime_with_component (ICalComponent() $comp, :$raw = False) \
    is also<get-datetime-with-component>
  {
    my $t = i_cal_property_get_datetime_with_component($!icp, $comp);

    # Transfer: full
    $t ??
      ( $raw ?? $t !! ICal::GLib::Time.new($t, :!ref) )
      !!
      Nil;
  }

  method get_parent (:$raw = False) is also<get-parent> {
    my $c = i_cal_property_get_parent($!icp);

    $c ??
      ( $raw ?? $c !! ::('ICal::GLib::Component').new($c, :!ref) )
      !!
      Nil;
  }
  
  method set_parent (ICalComponent() $component) is also<set-parent> {
    i_cal_property_set_parent($!icp, $component);
  }

}
