use v6.c;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Property;

# For when ICal::GLib::Property exists
class ICal::GLib::Property {
  has ICalProperty $!icp;

  submethod BUILD (:$ical-component) {
    self.setICalComponent($ical-component) if $ical-component;
  }

  method setICalComponent(ICalComponentAncestry $_) {
    my $to-parent;

    $!icc = do {
      when ICalComponent {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalComponent, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalComponent
    is also<ICalComponent>
  { $!icc }

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
      ( $raw ?? $c !! ICal::GLib::Component.new($c, :!ref) )
      !!
      Nil;
  }

  method recurrence_is_excluded (ICalTime() $dtstart, ICalTime() $recurtime)
    is also<recurrence-is-excluded>
  {
    so i_cal_property_recurrence_is_excluded($!icp, $dtstart, $recurtime);
  }

  method set_parent (ICalComponent() $component) is also<set-parent> {
    i_cal_property_set_parent($!icp, $component);
  }

}
