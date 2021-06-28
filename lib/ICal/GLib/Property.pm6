use v6.c;

use Method::Also;

use ICal::Raw::Definitions;
use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Property;

use ICal::GLib::Object;
use ICal::GLib::Parameter;
use ICal::GLib::Time;
use ICal::GLib::Value;

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
  multi method new ( $kind where *.^can('Int') ) {
    my ICalPropertyKindEnum $k = $kind.Int;

    my $ical-property = i_cal_property_new($k);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method new_from_string (Str() $str) is also<new-from-string> {
    my $ical-property = i_cal_property_new_from_string($str);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method parent is rw {
    Proxy.new:
      FETCH => -> $     { self.get_parent    },
      STORE => -> $, \v { self.set_parent(v) }
  }

  method value is rw {
    Proxy.new:
      FETCH => -> $     { self.get_value    },
      STORE => -> $, \v { self.set_value(v) }
  }

  method x_name is rw is also<x-name> {
    Proxy.new:
      FETCH => -> $     { self.get_x_name    },
      STORE => -> $, \v { self.set_x_name(v) }
  }


  method add_parameter (ICalParameter() $parameter) is also<add-parameter> {
    i_cal_property_add_parameter($!icp, $parameter);
  }

  method as_ical_string
    is also<
      as-ical-string
      Str
    >
  {
    i_cal_property_as_ical_string($!icp);
  }

  method clone (:$raw = False) {
    my $c = i_cal_property_clone($!icp);

    $c ??
      ( $raw ?? $c !! ICal::GLib::Property.new($c, :!ref) )
      !!
      Nil;
  }

  method count_parameters is also<count-parameters> {
    i_cal_property_count_parameters($!icp);
  }

  method enum_to_string (ICal::GLib::Property:U: Int() $kind) is also<enum-to-string> {
    i_cal_property_enum_to_string($kind);
  }

  method free {
    i_cal_property_free($!icp);
  }

  method get_first_parameter (Int() $kind, :$raw = False)
    is also<get-first-parameter>
  {
    my ICalParameterKind $k = $kind;

    my $p = i_cal_property_get_first_parameter($!icp, $kind);

    $p ??
      ( $raw ?? $p !! ICal::GLib::Parameter.new($p, :!ref) )
      !!
      Nil;
  }

  method get_next_parameter (Int() $kind, :$raw = False)
    is also<get-next-parameter>
  {
    my ICalParameterKind $k = $kind;

    my $p = i_cal_property_get_next_parameter($!icp, $kind);

    $p ??
      ( $raw ?? $p !! ICal::GLib::Parameter.new($p, :!ref) )
      !!
      Nil;
  }

  method get_parameter_as_string (Str() $name, :$raw = False)
    is also<get-parameter-as-string>
  {
    my $p = i_cal_property_get_parameter_as_string($!icp, $name);

    $p ??
      ( $raw ?? $p !! ICal::GLib::Parameter.new($p, :!ref) )
      !!
      Nil;
  }

  method get_property_name
    is also<
      get-property-name
      property_name
      property-name
    >
  {
    i_cal_property_get_property_name($!icp);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_property_get_type, $n, $t );
  }

  method get_datetime_with_component (ICalComponent() $comp, :$raw = False)
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

  method get_value (:$raw = False) is also<get-value>
  {
    my $v = i_cal_property_get_value($!icp);

    $v ??
      ( $raw ?? $v !! ICal::GLib::Value.new($v, :!ref) )
      !!
      Nil;
  }

  method get_value_as_string is also<get-value-as-string> {
    i_cal_property_get_value_as_string($!icp);
  }

  method get_x_name is also<get-x-name> {
    i_cal_property_get_x_name($!icp);
  }

  method isa {
    ICalPropertyKindEnum( i_cal_property_isa($!icp) );
  }

  method isa_property is also<isa-property> {
    so i_cal_property_isa_property($!icp);
  }

  method remove_parameter_by_kind (Int() $kind)
    is also<remove-parameter-by-kind>
  {
    my ICalParameterKind $k = $kind;

    i_cal_property_remove_parameter_by_kind($!icp, $k);
  }

  method remove_parameter_by_name (Str() $name)
    is also<remove-parameter-by-name>
  {
    i_cal_property_remove_parameter_by_name($!icp, $name);
  }

  method remove_parameter_by_ref (ICalParameter() $param)
    is also<remove-parameter-by-ref>
  {
    i_cal_property_remove_parameter_by_ref($!icp, $param);
  }

  method set_parameter (ICalParameter() $parameter) is also<set-parameter> {
    i_cal_property_set_parameter($!icp, $parameter);
  }

  method set_parent (ICalComponent() $component) is also<set-parent> {
    i_cal_property_set_parent($!icp, $component);
  }

  method set_parameter_from_string (Str() $name, Str() $value)
    is also<set-parameter-from-string>
  {
    i_cal_property_set_parameter_from_string($!icp, $name, $value);
  }

  method set_value (ICalValue() $value) is also<set-value> {
    i_cal_property_set_value($!icp, $value);
  }

  method set_value_from_string (Str() $value, Str() $kind)
    is also<set-value-from-string>
  {
    i_cal_property_set_value_from_string($!icp, $value, $kind);
  }

  method set_x_name (Str() $name) is also<set-x-name> {
    i_cal_property_set_x_name($!icp, $name);
  }

  method take_parameter (ICalParameter() $parameter) is also<take-parameter> {
    i_cal_property_take_parameter($!icp, $parameter);
  }

  method take_value (ICalValue() $value) is also<take-value> {
    i_cal_property_take_value($!icp, $value);
  }

}

class ICal::GLib::Property::Kind {
  also does GLib::Roles::StaticClass;

  method and_string_to_enum (Int() $kind, Str() $str)
    is also<and-string-to-enum>
  {
    my ICalPropertyKind $k = $kind;

    # cw: Not quite sure as to why we want $kind as a parameter,
    #     only to return it, so leaving this return value naked.
    i_cal_property_kind_and_string_to_enum($k, $str);
  }

  method from_string (Str $str) is also<from-string> {
    ICalPropertyKindEnum( i_cal_property_kind_from_string($str) );
  }

  method has_property (Int() $kind, Int() $e) is also<has-property> {
    my ICalPropertyKind $k  = $kind;
    my gint             $ee = $e;

    i_cal_property_kind_has_property($k, $ee);
  }

  method is_valid (Int() $kind) is also<is-valid> {
    my ICalPropertyKind $k = $kind;

    so i_cal_property_kind_is_valid($k);
  }

  method to_string (Int() $kind) is also<to-string> {
    my ICalPropertyKind $k = $kind;

    i_cal_property_kind_to_string($k);
  }

  method to_value_kind (Int() $kind) is also<to-value-kind> {
    my ICalPropertyKind $k = $kind;

    ICalValueKindEnum( i_cal_property_kind_to_value_kind($k) );
  }
}

class ICal::GLib::Property::Method {
  also does GLib::Roles::StaticClass;

  method from_string (Str() $string) is also<from-string> {
    ICalPropertyMethodEnum( i_cal_property_method_from_string($string) );
  }

  method to_string (Int() $method) is also<to-string> {
    my ICalPropertyMethod $m = $method;

    i_cal_property_method_to_string($m);
  }
}


class ICal::GLib::Property::Status {
  also does GLib::Roles::StaticClass;

  method status_from_string (Str() $string) is also<status-from-string> {
    ICalPropertyStatusEnum( i_cal_property_status_from_string($string) );
  }

  method status_to_string (Int() $status) is also<status-to-string> {
    my ICalPropertyStatus $s = $status;

    i_cal_property_status_to_string($s);
  }
}
