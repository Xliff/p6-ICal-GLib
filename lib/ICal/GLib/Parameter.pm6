use v6.c;

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
  { $!icp }

  method ICal::Raw::Definitions::icalparameter
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

  method new_from_string (Str() $value) {
    my $ical-parameter = i_cal_parameter_new_from_string($value);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method new_from_value_string (Int() $kind, Str() $value) {
    my ICalParameterKind $k = $kind;

    my $ical-parameter = i_cal_parameter_new_from_value_string($k, $value);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method as_ical_string {
    i_cal_parameter_as_ical_string($!icp);
  }

  method clone (:$raw = False) {
    my $c = i_cal_parameter_clone($!icp);

    $c ??
      ( $raw ?? $c !! ICal::GLib::Property.new($c, :!ref) )
      !!
      Nil;
  }

  method free {
    i_cal_parameter_free($!icp);
  }

  method get_iana_name {
    i_cal_parameter_get_iana_name($!icp);
  }

  method get_iana_value {
    i_cal_parameter_get_iana_value($!icp);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_parameter_get_type, $n, $t );
  }

  method get_xname {
    i_cal_parameter_get_xname($!icp);
  }

  method get_xvalue {
    i_cal_parameter_get_xvalue($!icp);
  }

  method has_same_name (ICalParameter() $param2) {
    i_cal_parameter_has_same_name($!icp, $param2);
  }

  method isa {
    ICalParameterKindEnum( i_cal_parameter_isa($!icp) );
  }

  method isa_parameter {
    so i_cal_parameter_isa_parameter($!icp);
  }

  method set_iana_name (Str() $v) {
    i_cal_parameter_set_iana_name($!icp, $v);
  }

  method set_iana_value (Str() $v) {
    i_cal_parameter_set_iana_value($!icp, $v);
  }

  method set_xname (Str() $v) {
    i_cal_parameter_set_xname($!icp, $v);
  }

  method set_xvalue (Str() $v) {
    i_cal_parameter_set_xvalue($!icp, $v);
  }

}

class ICal::GLib::Parameter::Kind {
  also does GLib::Roles::StaticClass;

  method from_string (Str() $str) {
    ICalParameterKindEnum( i_cal_parameter_kind_from_string($str) );
  }

  method is_valid (Int() $kind) {
    my ICalParameterKind $k = $kind;

    i_cal_parameter_kind_is_valid($k);
  }

  method to_string (Int() $kind) {
    my ICalParameterKind $k = $kind;

    i_cal_parameter_kind_to_string($k);
  }

}
