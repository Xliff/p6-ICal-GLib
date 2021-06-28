use v6.c;

use Method::Also;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Value;

use ICal::GLib::Object;

our subset ICalValueAncestry is export of Mu
  where ICalValue | ICalObjectAncestry;

class ICal::GLib::Value is ICal::GLib::Object {
  has ICalValue $!icv;

  submethod BUILD (:$value) {
    self.setICalValue($value) if $value;
  }

  method setICalValue(ICalValueAncestry $_) {
    my $to-parent;

    $!icv = do {
      when ICalValue {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalValue, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalValue
    is also<ICalValue>
  { $!icv }

  method ICal::Raw::Definitions::icalvalue
    is also<icalvalue>
  { cast(icalvalue, self.get_native) }

  multi method new (icalcomponent $native-value, :$raw = False) {
    use NativeCall;
    use ICal::Raw::Value;

    # sub icalvalue_free (icalvalue $d) {
    #   free($d);
    # }

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      icalvalue,
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-value,
      &icalvalue_free,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalValueAncestry $value, :$ref = True) {
    return Nil unless $value;

    my $o = self.bless( :$value );
    $o.ref if $ref;
    $o;
  }

  multi method new ( $k where *.^can('Int') ) {
    my ICalValueKind $kk = $k.Int;

    my $value = i_cal_value_new($k);

    $value ?? self.bless( :$value ) !! Nil
  }

  method new_from_string (Int() $kind, Str $str) is also<new-from-string> {
    my ICalValueKind $k = $kind;

    my $value = i_cal_value_new_from_string($k, $str);

    $value ?? self.bless( :$value ) !! Nil
  }

  method parent is rw {
    Proxy.new:
      FETCH => -> $     { self.get_parent    },
      STORE => -> $, \v { self.set_parent(v) }
  }

  method as_ical_string
    is also<
      as-ical-string
      Str
    >
  {
    i_cal_value_as_ical_string($!icv);
  }

  method clone (:$raw = False) {
    my $c = i_cal_value_clone($!icv);

    $c ??
      ( $raw ?? $c !! ICal::GLib::Value.new($c, :!ref) )
      !!
      Nil;
  }

  multi method compare (ICal::GLib::Value:D: ICalValue() $b) {
    ICal::GLib::Value.compare($!icv, $b);
  }
  multi method compare (
    ICal::GLib::Value:U:

    ICalValue() $a,
    ICalValue() $b
  ) {
    ICalParameterXliccomparetypeEnum( i_cal_value_compare($a, $b) );
  }

  method decode_ical_string (ICal::GLib::Value:U: Str() $data)
    is also<decode-ical-string>
  {
    i_cal_value_decode_ical_string($data);
  }

  method encode_ical_string (ICal::GLib::Value:U: Str() $data)
    is also<encode-ical-string>
  {
    i_cal_value_encode_ical_string($data);
  }

  method free {
    i_cal_value_free($!icv);
  }

  method get_parent (:$raw = False) is also<get-parent> {
    my $p = i_cal_value_get_parent($!icv);

    $p ??
      ( $raw ?? $p !! ::('ICal::GLib::Property').new($p, :!ref) )
      !!
      Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_value_get_type, $n, $t );
  }

  method is_valid is also<is-valid> {
    so i_cal_value_is_valid($!icv);
  }

  method isa {
    my $k = i_cal_value_isa($!icv);

    ICalValueKindEnum($k);
  }

  method isa_value is also<isa-value> {
    so i_cal_value_isa_value($!icv);
  }

  method set_parent (ICalProperty() $property) is also<set-parent> {
    i_cal_value_set_parent($!icv, $property);
  }

  method clear_parent
    is also<
      clear-parent
      unset_parent
      unset-parent
    >
  {
    self.set_parent(ICalProperty);
  }
}

use GLib::Roles::StaticClass;

class ICal::GLib::Value::Kind {
  also does GLib::Roles::StaticClass;

  method is_valid (
    Int()               $kind
  )
    is also<is-valid>
  {
    my ICalValueKind $k = $kind;

    so i_cal_value_kind_is_valid($k);
  }

  method to_property_kind (Int() $kind) is also<to-property-kind> {
    my ICalValueKind $k = $kind;

    ICalPropertyKindEnum( i_cal_value_kind_to_property_kind($k) );
  }

  method to_string (
    Int()               $kind
  )
    is also<to-string>
  {
    my ICalValueKind $k = $kind;

    i_cal_value_kind_to_string($k);
  }

  method from_string (Str() $str) is also<from-string> {
    my $k = i_cal_value_kind_from_string($str);

    $k.defined ?? ICalValueKindEnum($k) !! Nil;
  }
}
