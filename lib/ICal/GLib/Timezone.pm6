use v6.c;

use Method::Also;

use ICal::Raw::Definitions;
use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Timezone;

use ICal::GLib::Array;
use ICal::GLib::Object;

our subset ICalTimezoneAncestry is export of Mu
  where ICalTimezone | ICalObjectAncestry;

class ICal::GLib::Timezone::Array is ICal::GLib::Array does Positional { ... }

class ICal::GLib::Timezone is ICal::GLib::Object {
  has ICalTimezone $!ictz;

  submethod BUILD (:$timezone) {
    self.setICalTimezone($$timezone) if $$timezone;
  }

  method setICalTimezone(ICalTimezoneAncestry $_) {
    my $to-parent;

    $!ictz = do {
      when ICalTimezone {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalTimezone, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalTimezone
    is also<ICalTimezone>
  { $!ictz }

  method ICal::Raw::icaltimezone
    is also<icaltimezone>
  { cast(icaltimezone, self.get_native) }

  multi method new (icaltimezone $native-ical-tz, :$raw = False) {
    use NativeCall;
    use ICal::Raw::Timezone;

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      icaltimezone,
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-ical-tz,
      &icaltimezone_free,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalTimezoneAncestry $timezone, :$ref = True) {
    return Nil unless $timezone;

    my $o = self.bless( :$timezone );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $timezone = i_cal_timezone_new();

    $timezone ?? self.bless( :$timezone ) !! Nil;
  }

  method builtin_tzdata (ICal::GLib::Timezone:U: )
    is also<builtin-tzdata>
    is rw
  {
    Proxy.new:
      FETCH => -> $     { ICal::GLib::Timezone.get_builtin_tzdata    },
      STORE => -> $, \v { ICal::GLib::Timezone.set_builtin_tzdata(v) }
  }

  method component (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_component(:$raw) },
      STORE => -> $, \v { self.set_component(v)     }
  }

  method copy (:$raw = False) is also<clone> {
    my $c = i_cal_timezone_copy($!ictz);

    $c ??
      ( $raw ?? $c !! ICal::GLib::Timezone.new($c, :!ref) )
      !!
      Nil;
  }

  # cw: In this case, $fp is FILE* and is NOT optional
  method dump_changes (Int() $max_year, gpointer $fp) is also<dump-changes> {
    my gint $m = $max_year;

    i_cal_timezone_dump_changes($!ictz, $m, $fp);
  }

  method free (Int() $free_struct) {
    my gboolean $f = $free_struct.so.Int;

    i_cal_timezone_free($!ictz, $f);
  }

  method free_builtin_timezones (ICal::GLib::Timezone:U: )
    is also<free-builtin-timezones>
  {
    i_cal_timezone_free_builtin_timezones();
  }

  method free_zone_directory (ICal::GLib::Timezone:U: )
    is also<free-zone-directory>
  {
    i_cal_timezone_free_zone_directory();
  }

  method get_builtin_timezone (
    ICal::GLib::Timezone:U:

    Str() $location,
         :$raw      = False
  )
    is also<get-builtin-timezone>
  {
    my $t = i_cal_timezone_get_builtin_timezone($location);

    # Transfer: none
    $t ??
      ( $raw ?? $t !! ICal::GLib::Timezone.new($t) )
      !!
      Nil;
  }

  method get_builtin_timezone_from_offset (
    ICal::GLib::Timezone:U:

    Int() $offset,
    Str() $tzname,
          :$raw    = False
  )
    is also<get-builtin-timezone-from-offset>
  {
    my gint $o = $offset;

    my $t = i_cal_timezone_get_builtin_timezone_from_offset($o, $tzname);

    # Transfer: none
    $t ??
      ( $raw ?? $t !! ICal::GLib::Timezone.new($t) )
      !!
      Nil;
  }

  method get_builtin_timezone_from_tzid (
    ICal::GLib::Timezone:U:

    Str() $tzid,
          :$raw  = False
  )
    is also<get-builtin-timezone-from-tzid>
  {
    my $t = i_cal_timezone_get_builtin_timezone_from_tzid($tzid);

    # Transfer: none
    $t ??
      ( $raw ?? $t !! ICal::GLib::Timezone.new($t) )
      !!
      Nil;
  }

  method get_builtin_timezones (ICal::GLib::Timezone:U: :$raw = False)
    is also<get-builtin-timezones>
  {
    my $a = i_cal_timezone_get_builtin_timezones();

    # Transfer: none
    $a ??
      ( $raw ?? $a !! ICal::GLib::Timezone::Array.new($a) )
      !!
      Nil;
  }

  method get_builtin_tzdata (ICal::GLib::Timezone:U: )
    is also<get-builtin-tzdata>
  {
    so i_cal_timezone_get_builtin_tzdata();
  }

  method get_component (:$raw = False) is also<get-component> {
    my $c = i_cal_timezone_get_component($!ictz);

    # cw: Note use of late binding to prevent circularity.
    # Transfer: full
    $c ??
      ( $raw ?? $c !! ::('ICal::GLib::Component').new($c, :!ref) )
      !!
      Nil;
  }

  method get_display_name
    is also<
      get-display-name
      display_name
      display-name
    >
  {
    i_cal_timezone_get_display_name($!ictz);
  }

  method get_latitude
    is also<
      get-latitude
      latitude
    >
  {
    i_cal_timezone_get_latitude($!ictz);
  }

  method get_location
    is also<
      get-location
      location
    >
  {
    i_cal_timezone_get_location($!ictz);
  }

  method get_location_from_vtimezone (
    ICal::GLib::Timezone:U:

    ICalComponent() $component
  )
    is also<get-location-from-vtimezone>
  {
    i_cal_timezone_get_location_from_vtimezone($component);
  }

  method get_longitude
    is also<
      get-longitude
      longitude
    >
  {
    i_cal_timezone_get_longitude($!ictz);
  }

  method get_tzid
    is also<
      get-tzid
      tzid
    >
  {
    i_cal_timezone_get_tzid($!ictz);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_timezone_get_type, $n, $t );
  }

  method get_tznames
    is also<
      get-tznames
      tznames
    >
  {
    i_cal_timezone_get_tznames($!ictz);
  }

  method get_tznames_from_vtimezone (
    ICal::GLib::Timezone:U:

    ICalComponent() $component
  )
    is also<get-tznames-from-vtimezone>
  {
    i_cal_timezone_get_tznames_from_vtimezone($component);
  }

  proto method get_utc_offset (|)
      is also<get-utc-offset>
  { * }

  multi method get_utc_offset ($tt)
    is also<
      utc_offset
      utc-offset
    >
  {
    samewith($tt, $, :all);
  }
  multi method get_utc_offset (ICalTime() $tt, $is_daylight is rw, :$all = False) {
    my gint $i = 0;

    my $o = i_cal_timezone_get_utc_offset($!ictz, $tt, $i);

    return $o unless $all;

    ($o, $is_daylight = $o.so);
  }

  proto method get_utc_offset_of_utc_time (|)
      is also<get-utc-offset-of-utc-time>
  { * }

  multi method get_utc_offset_of_utc_time ($tt)
    is also<
      utc_offset_of_utc_time
      utc-offset-of-utc-time
    >
  {
    samewith($tt, $, :all)
  }
  multi method get_utc_offset_of_utc_time (
    ICalTime() $tt,
               $is_daylight is rw,
               :$all        =  False
  ) {
    my gint $i = 0;

    my $o = i_cal_timezone_get_utc_offset_of_utc_time($!ictz, $tt, $i);

    return $o unless $all;

    ($o, $is_daylight = $o.so);
  }

  method get_utc_timezone (
    ICal::GLib::Timezone:U:

    :$raw = False
  )
    is also<
      get-utc-timezone
      utc_timezone
      utc-timezone
    >
  {
    my $utc = i_cal_timezone_get_utc_timezone();

    # Transfer: none
    $utc ??
      ( $raw ?? $utc !! ICal::GLib::Timezone.new($utc) )
      !!
      Nil
  }

  method convert_timezone (
    ICal::GLib::Timezone:U:

    ICalTime()     $time,
    ICalTimezone() $from_zone,
    ICalTimezone() $to_zone
  )
    is also<convert-timezone>
  {
    i_cal_time_convert_timezone($time, $from_zone, $to_zone);
  }

  proto method expand_vtimezone (|)
      is also<expand-vtimezone>
  { * }

  multi method expand_vtimezone (
    ICal::GLib::Timezone:U:

    @components,
    $end_year,
    $changes
  ) {
    samewith(
      GLib::Roles::TypedBuffer[ICalComponent].new(@components).p,
      $end_year,
      $changes
    );
  }
  multi method expand_vtimezone (
    ICal::GLib::Timezone:U:

    gpointer    $components, # ICalComponent[]
    Int()       $end_year,
    ICalArray() $changes
  ) {
    my gboolean $ey = $end_year.so.Int;

    i_cal_time_timezone_expand_vtimezone($components, $ey, $changes);
  }

  method release_zone_tab (ICal::GLib::Timezone:U: )
    is also<release-zone-tab>
  {
    i_cal_timezone_release_zone_tab();
  }

  method set_builtin_tzdata (ICal::GLib::Timezone:U: Int() $use)
    is also<set-builtin-tzdata>
  {
    my gboolean $u = $use.so.Int;

    i_cal_timezone_set_builtin_tzdata($u);
  }

  method set_component (ICalComponent() $comp) is also<set-component> {
    i_cal_timezone_set_component($!ictz, $comp);
  }

  method set_tzid_prefix (ICal::GLib::Timezone:U: Str() $prefix)
    is also<set-tzid-prefix>
  {
    i_cal_timezone_set_tzid_prefix($prefix);
  }

  method set_zone_directory (Str() $dir) is also<set-zone-directory> {
    i_cal_timezone_set_zone_directory($dir);
  }

}

class ICal::GLib::Timezone::Array does Positional {

  multi method new {
    my $array = i_cal_timezone_array_new();

    $array ?? self.bless( :$array ) !! Nil;
  }

  method append_from_vtimezone (ICalComponent() $child)
    is also<append-from-vtimezone>
  {
    i_cal_timezone_array_append_from_vtimezone(self.ICalArray, $child);
  }

  method element_at (Int() $index, :$raw = False) is also<element-at> {
    my $tz = i_cal_timezone_array_element_at(self.ICalArray, $index);

    $tz ??
      ( $raw ?? $tz !! ICal::GLib::Timezone.new($tz, :!ref) )
      !!
      Nil
  }

  # Positional
  method AT-POS (\k) {
    self.element_at(k);
  }

  method free {
    i_cal_timezone_array_free(self.ICalArray);
  }

}
