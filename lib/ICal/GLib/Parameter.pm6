use v6.c;

use Method::Also;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Parameter;

use ICal::GLib::Object;

our subset ICalParameterAncestry is export of Mu
  where ICalParameter | ICalObjectAncestry;

class ICal::GLib::Parameter is ICal::GLib::Object {
  has ICalParameter $!icp;

  submethod BUILD (:$ical-parameter) {
    self.setICalParameter($ical-parameter) if $ical-parameter;
  }

  method setICalParameter(ICalParameterAncestry $_) {
    my $to-parent;

    $!icp = do {
      when ICalParameter {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalParameter, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalParameter
    is also<ICalParameter>
  { $!icp }

  method ICal::Raw::Definitions::icalparameter
    is also<icalparameter>
  { cast(icalparameter, self.get_native) }

  multi method new (icalparameter $native-parameter, :$raw = False) {
    use NativeCall;

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      icalparameter,
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-parameter,
      &i_cal_parameter_free,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalParameterAncestry $ical-parameter, :$ref = True) {
    return Nil unless $ical-parameter;

    my $o = self.bless( :$ical-parameter );
    $o.ref if $ref;
    $o;
  }
  multi method new (Int() $kind) {
    my ICalParameterKind $k = $kind;

    my $ical-parameter = i_cal_parameter_new($k);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method new_from_string (Str() $value) is also<new-from-string> {
    my $ical-parameter = i_cal_parameter_new_from_string($value);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method new_from_value_string (Int() $kind, Str() $value)
    is also<new-from-value-string>
  {
    my ICalParameterKind $k = $kind;

    my $ical-parameter = i_cal_parameter_new_from_value_string($k, $value);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method iana_name is rw {
    Proxy.new:
      FETCH => -> $     { self.get_iana_name    },
      STORE => -> $, \v { self.set_iana_name(v) }
  }

  method iana_value is rw {
    Proxy.new:
      FETCH => -> $     { self.get_iana_value    },
      STORE => -> $, \v { self.set_iana_value(v) }
  }

  method parent is rw {
    Proxy.new:
      FETCH => -> $     { self.get_parent    },
      STORE => -> $, \v { self.set_parent(v) }
  }

  method xname is rw {
    Proxy.new:
      FETCH => -> $     { self.get_xname    },
      STORE => -> $, \v { self.set_xname(v) }
  }

  method xvalue is rw {
    Proxy.new:
      FETCH => -> $     { self.get_xvalue    },
      STORE => -> $, \v { self.set_xvalue(v) }
  }

  method as_ical_string
    is also<
      as-ical-string
      Str
    >
  {
    i_cal_parameter_as_ical_string($!icp);
  }

  method clone (:$raw = False) {
    my $c = i_cal_parameter_clone($!icp);

    $c ??
      ( $raw ?? $c !! ICal::GLib::Parameter.new($c, :!ref) )
      !!
      Nil;
  }

  method free {
    i_cal_parameter_free($!icp);
  }

  method get_iana_name is also<get-iana-name> {
    i_cal_parameter_get_iana_name($!icp);
  }

  method get_iana_value is also<get-iana-value> {
    i_cal_parameter_get_iana_value($!icp);
  }

  method get_parent (:$raw = False) is also<get-parent> {
    my $p = i_cal_parameter_get_parent($!icp);

    $p ??
      ( $raw ?? $p !! ::('ICal::GLib::Property').new($p, :!ref) )
      !!
      Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_parameter_get_type, $n, $t );
  }

  method get_xname is also<get-xname> {
    i_cal_parameter_get_xname($!icp);
  }

  method get_xvalue is also<get-xvalue> {
    i_cal_parameter_get_xvalue($!icp);
  }

  method has_same_name (ICalParameter() $param2) is also<has-same-name> {
    i_cal_parameter_has_same_name($!icp, $param2);
  }

  method isa {
    ICalParameterKindEnum( i_cal_parameter_isa($!icp) );
  }

  method isa_parameter is also<isa-parameter> {
    so i_cal_parameter_isa_parameter($!icp);
  }

  method set_iana_name (Str() $v) is also<set-iana-name> {
    i_cal_parameter_set_iana_name($!icp, $v);
  }

  method set_iana_value (Str() $v) is also<set-iana-value> {
    i_cal_parameter_set_iana_value($!icp, $v);
  }

  method set_xname (Str() $v) is also<set-xname> {
    i_cal_parameter_set_xname($!icp, $v);
  }

  method set_xvalue (Str() $v) is also<set-xvalue> {
    i_cal_parameter_set_xvalue($!icp, $v);
  }

  method set_parent (ICalProperty() $property) is also<set-parent> {
    i_cal_parameter_set_parent($!icp, $property);
  }

}

class ICal::GLib::Parameter::Value {
  also does GLib::Roles::StaticClass;

  method to_value_kind (Int() $kind) is also<to-value-kind> {
    my ICalParameterKind $k = $kind;

    ICalValueKindEnum( i_cal_parameter_value_to_value_kind($k) );
  }
}

class ICal::GLib::Parameter::Kind {
  also does GLib::Roles::StaticClass;

  method from_string (Str() $str) is also<from-string> {
    ICalParameterKindEnum( i_cal_parameter_kind_from_string($str) );
  }

  method is_valid (Int() $kind) is also<is-valid> {
    my ICalParameterKind $k = $kind;

    i_cal_parameter_kind_is_valid($k);
  }

  method to_string (Int() $kind) is also<to-string> {
    my ICalParameterKind $k = $kind;

    i_cal_parameter_kind_to_string($k);
  }

}
