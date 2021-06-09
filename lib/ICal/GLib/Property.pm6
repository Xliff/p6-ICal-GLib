use v6.c;

use Method::Also;

use ICal::Raw::Definitions;
use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Property;

use ICal::GLib::Object;
use ICal::GLib::Time;

our subset ICalPropertyAncestry is export of Mu
  where ICalProperty | ICalObjectAncestry;

# For when ICal::GLib::Property exists
class ICal::GLib::Property is ICal::GLib::Object {
  has ICalProperty $!icp;

  submethod BUILD (:$ical-property) {
    self.setICalProperty($ical-property) if $ical-property;
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

  method ICal::Raw::Definitions::icalproperty
    is also<icalproperty>
  { cast(icalproperty, self.get_native) }

  multi method new (icalproperty $native-ical-prop, :$raw = False) {
    use NativeCall;
    use ICal::Raw::Property;

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      icalproperty,
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-ical-prop,
      &icalproperty_free,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalProperty $ical-property, :$ref = True) {
    return Nil unless $ical-property;

    my $o = self.bless( :$ical-property );
    $o.ref if $ref;
    $o;
  }

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
