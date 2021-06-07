use v6.c;

use Method::Also;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Component;

use ICal::GLib::Object;
use ICal::GLib::Property;
use ICal::GLib::Time;
#use ICal::GLib::TimeSpan;
use ICal::GLib::Timezone;

# Pre-definitions
class ICal::GLib::Component::Iter { ... }

our subset ICalComponentAncestry is export of Mu
  where ICalComponent | ICalObjectAncestry;

# Main Class definition
class ICal::GLib::Component is ICal::GLib::Object {
  has ICalComponent $!icc;

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

  multi method new (ICalComponentAncestry $ical-component, :$ref = True) {
    return Nil unless $ical-component;

    my $o = self.bless( :$ical-component );
    $o.ref if $ref;
    $o
  }
  multi method new (Int() $kind) {
    my ICalComponentKind $k = $kind;

    my $ical-component = i_cal_component_new($k);

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_from_string (Str() $str) is also<new-from-string> {
    my $ical-component = i_cal_component_new_from_string($str);

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_vagenda is also<new-vagenda> {
    my $ical-component = i_cal_component_new_vagenda();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_valarm is also<new-valarm> {
    my $ical-component = i_cal_component_new_valarm();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_vavailability is also<new-vavailability> {
    my $ical-component = i_cal_component_new_vavailability();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_vcalendar is also<new-vcalendar> {
    my $ical-component = i_cal_component_new_vcalendar();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_vevent is also<new-vevent> {
    my $ical-component = i_cal_component_new_vevent();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_vfreebusy is also<new-vfreebusy> {
    my $ical-component = i_cal_component_new_vfreebusy();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_vjournal is also<new-vjournal> {
    my $ical-component = i_cal_component_new_vjournal();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_vpoll is also<new-vpoll> {
    my $ical-component = i_cal_component_new_vpoll();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_vquery is also<new-vquery> {
    my $ical-component = i_cal_component_new_vquery();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_vtimezone is also<new-vtimezone> {
    my $ical-component = i_cal_component_new_vtimezone();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_vtodo is also<new-vtodo> {
    my $ical-component = i_cal_component_new_vtodo();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_vvoter is also<new-vvoter> {
    my $ical-component = i_cal_component_new_vvoter();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_x (Str() $x_name) is also<new-x> {
    my $ical-component = i_cal_component_new_x($!icc, $x_name);

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_xavailable is also<new-xavailable> {
    my $ical-component = i_cal_component_new_xavailable();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_xdaylight is also<new-xdaylight> {
    my $ical-component = i_cal_component_new_xdaylight();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_xstandard is also<new-xstandard> {
    my $ical-component = i_cal_component_new_xstandard();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method new_xvote is also<new-xvote> {
    my $ical-component = i_cal_component_new_xvote();

    $ical-component ?? self.bless( :$ical-component ) !! Nil;
  }

  method dtend is rw
    is also<
      dt_end
      dt-end
    >
  {
    Proxy.new:
      FETCH => -> $     { self.get_dtend    },
      STORE => -> $, \v { self.set_dtend(v) }
  }

  method dtstamp is rw
    is also<
      dt_stamp
      dt-stamp
    >
  {
    Proxy.new:
      FETCH => -> $     { self.get_dtstamp    },
      STORE => -> $, \v { self.set_dtstamp(v) }
  }

  method duration is rw {
    Proxy.new:
      FETCH => -> $     { self.get_duration    },
      STORE => -> $, \v { self.set_duration(v) }
  }

  method parent is rw {
    Proxy.new:
      FETCH => -> $     { self.get_parent    },
      STORE => -> $, \v { self.set_parent(v) }
  }

  method recurrenceid is rw {
    Proxy.new:
      FETCH => -> $     { self.get_recurrenceid    },
      STORE => -> $, \v { self.set_recurrencdid(v) }
  }

  method add_component (ICalComponent() $child) is also<add-component> {
    i_cal_component_add_component($!icc, $child);
  }

  method add_property (ICalProperty() $property) is also<add-property> {
    i_cal_component_add_property($!icc, $property);
  }

  method as_ical_string is also<as-ical-string> {
    i_cal_component_as_ical_string($!icc);
  }

  method begin_component (Int() $kind, :$raw = False) is also<begin-component> {
    my ICalComponentKind $k = $kind;

    my $ci = i_cal_component_begin_component($!icc, $k);

    # Transfer: full
    $ci ??
      ( $raw ?? $ci !! ICal::GLib::Component::Iter.new($ci, :!ref) )
      !!
      Nil
  }

  method check_restrictions is also<check-restrictions> {
    i_cal_component_check_restrictions($!icc);
  }

  method clone (:$raw = False) {
    my $c = i_cal_component_clone($!icc);

    # Transfer: full
    $c ??
      ( $raw ?? $c !! ICal::GLib::Component.new($c, :!ref) )
      !!
      Nil
  }

  method convert_errors is also<convert-errors> {
    i_cal_component_convert_errors($!icc);
  }

  method count_components (Int() $kind) is also<count-components> {
    my ICalPropertyKind $k = $kind;

    i_cal_component_count_components($!icc, $k);
  }

  method count_errors is also<count-errors> {
    i_cal_component_count_errors($!icc);
  }

  method count_properties (Int() $kind) is also<count-properties> {
    my ICalPropertyKind $k = $kind;

    i_cal_component_count_properties($!icc, $k);
  }

  method end_component (ICalComponentKind $kind) is also<end-component> {
    i_cal_component_end_component($!icc, $kind);
  }

  method foreach_recurrence (
    ICalTime() $start,
    ICalTime() $end,
               &callback,
    gpointer   $user_data = gpointer
  )
    is also<foreach-recurrence>
  {
    i_cal_component_foreach_recurrence(
      $!icc,
      $start,
      $end,
      &callback,
      $user_data
    );
  }

  method foreach_tzid (&callback, gpointer $user_data = gpointer)
    is also<foreach-tzid>
  {
    i_cal_component_foreach_tzid($!icc, &callback, $user_data);
  }

  multi method free (ICal::GLib::Component:D: ) {
    ICal::GLib::Component.free($!icc);
  }
  multi method free (ICal::GLib::Component:U: ICalComponent() $icomp) {
    i_cal_component_free($icomp);
  }

  method get_comment
    is also<
      get-comment
      comment
    >
  {
    i_cal_component_get_comment($!icc);
  }

  method get_current_component (:$raw = False)
    is also<
      get-current-component
      current_component
      current-component
    >
  {
    my $comp = i_cal_component_get_current_component($!icc);

    # Transfer: full
    $comp ??
      ( $raw ?? $comp !! ICal::GLib::Component.new($comp, :!ref) )
      !!
      Nil
  }

  method get_current_property (:$raw = False)
    is also<
      get-current-property
      current_property
      current-property
    >
  {
    my $prop = i_cal_component_get_current_property($!icc);

    # Transfer: full
    $prop ??
      ( $raw ?? $prop !! ICal::GLib::Property.new($prop, :!ref) )
      !!
      Nil;
  }

  method get_description
    is also<
      get-description
      description
    >
  {
    i_cal_component_get_description($!icc);
  }

  method get_dtend (:$raw = False)is also<get-dtend> {
    my $t = i_cal_component_get_dtend($!icc);

    # Transfer: full
    $t ??
      ( $raw ?? $t !! ICal::GLib::Time.new($t, :!ref) )
      !!
      Nil
  }

  method get_dtstamp (:$raw = False) is also<get-dtstamp>
  {
    my $t = i_cal_component_get_dtstamp($!icc);

    # Transfer: full
    $t ??
      ( $raw ?? $t !! ICal::GLib::Time.new($t, :!ref) )
      !!
      Nil
  }

  method get_dtstart (:$raw = False) is also<get-dtstart> {
    my $t = i_cal_component_get_dtstart($!icc);

    # Transfer: full
    $t ??
      ( $raw ?? $t !! ICal::GLib::Time.new($t, :!ref) )
      !!
      Nil
  }

  method get_due (:$raw = False)
    is also<
      get-due
      due
    >
  {
    my $t = i_cal_component_get_due($!icc);

    # Transfer: full
    $t ??
      ( $raw ?? $t !! ICal::GLib::Time.new($t, :!ref) )
      !!
      Nil
  }

  method get_duration (:$raw = False) is also<get-duration> {
    my $d = i_cal_component_get_duration($!icc);

    # Transfer: full
    $d ??
      ( $raw ?? $d !! ICal::GLib::Duration($d, :!ref) )
      !!
      Nil;
  }

  method get_first_component (Int() $kind, :$raw = False)
    is also<
      get-first-component
      first_component
      first-component
    >
  {
    my ICalComponentKind $k = $kind;

    my $comp = i_cal_component_get_first_component($!icc, $k);

    # Transfer: full
    $comp ??
      ( $raw ?? $comp !! ICal::GLib::Component.new($comp, :!ref) )
      !!
      Nil
  }

  method get_first_property (Int() $kind, :$raw = False)
    is also<get-first-property>
  {
    my ICalPropertyKind $k = $kind;

    my $prop = i_cal_component_get_first_property($!icc, $k);

    # Transfer: full
    $prop ??
      ( $raw ?? $prop !! ICal::GLib::Property.new($prop, :!ref) )
      !!
      Nil;
  }

  method get_first_real_component ( :$raw = False )
    is also<
      get-first-real-component
      first_real_component
      first-real-component
    >
  {
    my $comp = i_cal_component_get_first_real_component($!icc);

    # Transfer: full
    $comp ??
      ( $raw ?? $comp !! ICal::GLib::Component.new($comp, :!ref) )
      !!
      Nil
  }

  method get_inner ( :$raw = False )
    is also<
      get-inner
      inner
    >
  {
    my $comp = i_cal_component_get_inner($!icc);

    # Transfer: full
    $comp ??
      ( $raw ?? $comp !! ICal::GLib::Component.new($comp, :!ref) )
      !!
      Nil
  }

  method get_location
    is also<
      get-location
      location
    >
  {
    i_cal_component_get_location($!icc);
  }

  method get_method
    is also<
      get-method
      method
    >
  {
    ICalPropertyMethodEnum( i_cal_component_get_method($!icc) );
  }

  method get_next_component (Int() $kind, :$raw = False)
    is also<get-next-component>
  {
    my ICalComponentKind $k = $kind;

    my $comp = i_cal_component_get_next_component($!icc, $k);

    # Transfer: full
    $comp ??
      ( $raw ?? $comp !! ICal::GLib::Component.new($comp, :!ref) )
      !!
      Nil
  }

  method get_next_property (Int() $kind, :$raw = False)
    is also<get-next-property>
  {
    my ICalPropertyKind $k = $kind;

    my $prop = i_cal_component_get_next_property($!icc, $kind);

    # Transfer: full
    $prop ??
      ( $raw ?? $prop !! ICal::GLib::Property.new($prop, :!ref) )
      !!
      Nil;
  }

  method get_parent ( :$raw = False ) is also<get-parent> {
    my $comp = i_cal_component_get_parent($!icc);

    # Transfer: full
    $comp ??
      ( $raw ?? $comp !! ICal::GLib::Component.new($comp, :!ref) )
      !!
      Nil
  }

  method get_recurrenceid (:$raw = False) is also<get-recurrenceid> {
    my $t = i_cal_component_get_recurrenceid($!icc);

    # Transfer: full
    $t ??
      ( $raw ?? $t !! ICal::GLib::Time.new($t, :!ref) )
      !!
      Nil;
  }

  method get_relcalid
    is also<
      get-relcalid
      relcalid
    >
  {
    i_cal_component_get_relcalid($!icc);
  }

  method get_sequence
    is also<
      get-sequence
      sequence
    >
  {
    i_cal_component_get_sequence($!icc);
  }

  method get_span ( :$raw = False )
    is also<
      get-span
      span
    >
  {
    my $span = i_cal_component_get_span($!icc);

    # Transfer: full
    $span ??
      ( $raw ?? $span !! ICal::GLib::TimeSpan.new($span, :!ref) )
      !!
      Nil;
  }

  method get_status
    is also<
      get-status
      status
    >
  {
    ICalPropertyStatusEnum( i_cal_component_get_status($!icc) );
  }

  method get_summary
    is also<
      get-summary
      summary
    >
  {
    i_cal_component_get_summary($!icc);
  }

  method get_timezone (Str() $tzid, :$raw = False) is also<get-timezone> {
    my $tz = i_cal_component_get_timezone($!icc, $tzid);

    # Transfer: full
    $tz ??
      ( $raw ?? $tz !! ICal::GLib::Timezone.new($tz, :!ref) )
      !!
      Nil
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_component_get_type, $n, $t );
  }

  method get_uid
    is also<
      get-uid
      uid
    >
  {
    i_cal_component_get_uid($!icc);
  }

  method is_valid is also<is-valid> {
    so i_cal_component_is_valid($!icc);
  }

  method isa {
    ICalComponentKindEnum( i_cal_component_isa($!icc) )
  }

  method isa_component is also<isa-component> {
    so i_cal_component_isa_component($!icc);
  }

  method merge_component (ICalComponent() $comp_to_merge)
    is also<merge-component>
  {
    i_cal_component_merge_component($!icc, $comp_to_merge);
  }

  method property_recurrence_is_excluded (
    ICalTime() $dtstart,
    ICalTime() $recurtime
  )
    is also<property-recurrence-is-excluded>
  {
    so i_cal_property_recurrence_is_excluded($!icc, $dtstart, $recurtime);
  }

  method remove_component (ICalComponent() $child) is also<remove-component> {
    i_cal_component_remove_component($!icc, $child);
  }

  method remove_property (ICalProperty() $property) is also<remove-property> {
    i_cal_component_remove_property($!icc, $property);
  }

  method set_comment (Str() $v) is also<set-comment> {
    i_cal_component_set_comment($!icc, $v);
  }

  method set_description (Str() $v) is also<set-description> {
    i_cal_component_set_description($!icc, $v);
  }

  method set_dtend (ICalTime() $v) is also<set-dtend> {
    i_cal_component_set_dtend($!icc, $v);
  }

  method set_dtstamp (ICalTime() $v) is also<set-dtstamp> {
    i_cal_component_set_dtstamp($!icc, $v);
  }

  method set_dtstart (ICalTime() $v) is also<set-dtstart> {
    i_cal_component_set_dtstart($!icc, $v);
  }

  method set_due (ICalTime() $v) is also<set-due> {
    i_cal_component_set_due($!icc, $v);
  }

  method set_duration (ICalDuration() $v) is also<set-duration> {
    i_cal_component_set_duration($!icc, $v);
  }

  method set_location (Str() $v) is also<set-location> {
    i_cal_component_set_location($!icc, $v);
  }

  method set_method (Int() $method) is also<set-method> {
    my ICalPropertyMethod $m = $method;

    i_cal_component_set_method($!icc, $m);
  }

  method set_parent (ICalComponent() $parent) is also<set-parent> {
    i_cal_component_set_parent($!icc, $parent);
  }

  method set_recurrenceid (ICalTime() $v) is also<set-recurrenceid> {
    i_cal_component_set_recurrenceid($!icc, $v);
  }

  method set_relcalid (Str() $v) is also<set-relcalid> {
    i_cal_component_set_relcalid($!icc, $v);
  }

  method set_sequence (Int() $v) is also<set-sequence> {
    my gint $vv = $v;

    i_cal_component_set_sequence($!icc, $vv);
  }

  method set_status (Int() $status) is also<set-status> {
    my ICalPropertyStatus $s = $status;

    i_cal_component_set_status($!icc, $status);
  }

  method set_summary (Str() $v) is also<set-summary> {
    i_cal_component_set_summary($!icc, $v);
  }

  method set_uid (Str() $v) is also<set-uid> {
    i_cal_component_set_uid($!icc, $v);
  }

  method strip_errors is also<strip-errors> {
    i_cal_component_strip_errors($!icc);
  }

  method take_component (ICalComponent() $child) is also<take-component> {
    i_cal_component_take_component($!icc, $child);
  }

  method take_property (ICalProperty() $property) is also<take-property> {
    i_cal_component_take_property($!icc, $property);
  }

}

our subset ICalCompIterAncestry is export of Mu
  where ICalCompIter | ICalObjectAncestry;

class ICal::GLib::Component::Iter is ICal::GLib::Object {
  has ICalCompIter $!icci;

  submethod BUILD (:$comp-iter) {
    self.setICalCompIter($comp-iter) if $comp-iter;
  }

  method setICalCompIter(ICalCompIterAncestry $_) {
    my $to-parent;

    $!icci = do {
      when ICalCompIter {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalCompIter, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalCompIter
    is also<ICalCompIter>
  { $!icci }

  method new (ICalCompIterAncestry $comp-iter, :$ref = True) {
    return Nil unless $comp-iter;

    my $o = self.bless( :$comp-iter );
    $o.ref if $ref;
    $o;
  }

  method deref {
    i_cal_comp_iter_deref($!icci);
  }

  method next (:$raw = False) {
    my $c = i_cal_comp_iter_next($!icci);

    # Transfer: full (?)
    $c ??
      ( $raw ?? $c !! ICal::GLib::Component.new($c, :!ref) )
      !!
      Nil
  }

  method prior (:$raw = False) {
    my $c = i_cal_comp_iter_prior($!icci);

    # Transfer: full (?)
    $c ??
      ( $raw ?? $c !! ICal::GLib::Component.new($c, :!ref) )
      !!
      Nil
  }
}


class ICal::GLib::Component::Kind {
  also does GLib::Roles::StaticClass;

  method from_string (Str() $string) is also<from-string> {
    i_cal_component_kind_from_string($string);
  }

  method is_valid (Int() $kind) is also<is-valid> {
    my ICalComponentKind $k = $kind;

    so i_cal_component_kind_is_valid($k);
  }

  method to_string (Int() $kind) is also<to-string> {
    my ICalComponentKind $k = $kind;

    i_cal_component_kind_to_string($k);
  }
}
