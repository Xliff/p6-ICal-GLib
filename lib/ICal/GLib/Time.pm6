use v6.c;

use Method::Also;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Time;

use ICal::GLib::Object;
use ICal::GLib::Timezone;

our subset ICalTimeAncestry is export of Mu
  where ICalTime | ICalObjectAncestry;

class ICal::GLib::Time is ICal::GLib::Object {
  has ICalTime $!ict is implementor;

  submethod BUILD (:$time) {
    self.setICalTime($time) if $time;
  }

  method setICalTime (ICalTimeAncestry $_) {
    my $to-parent;

    $!ict = do {
      when ICalTime {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalTime, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalTime
    is also<ICalTime>
  { $!ict }

  multi method new (ICalTimeAncestry $time, :$ref = True) {
    return Nil unless $time,

    my $o = self.bless( :$time );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $time = i_cal_time_new();

    $time ?? self.bless( :$time ) !! Nil
  }

  method new_current_with_zone (ICalTimezone() $zone)
    is also<new-current-with-zone>
  {
    my $time = i_cal_time_new_current_with_zone($zone);

    $time ?? self.bless( :$time ) !! Nil
  }

  method new_from_day_of_year (Int() $day, Int() $year)
    is also<new-from-day-of-year>
  {
    my gint ($d, $y) = ($day, $year);

    my $time = i_cal_time_new_from_day_of_year($d, $y);

    $time ?? self.bless( :$time ) !! Nil
  }

  method new_from_string (Str() $str) is also<new-from-string> {
    my $time = i_cal_time_new_from_string($str);

    $time ?? self.bless( :$time ) !! Nil
  }

  method new_from_timet_with_zone (
    time_t         $v,
    Int()          $is_date,
    ICalTimezone() $zone
  )
    is also<new-from-timet-with-zone>
  {
    my gboolean $i = $is_date.so.Int;

    my $time = i_cal_time_new_from_timet_with_zone($v, $i, $zone);

    $time ?? self.bless( :$time ) !! Nil
  }

  method new_null_date is also<new-null-date> {
    my $time = i_cal_time_new_null_date();

    $time ?? self.bless( :$time ) !! Nil
  }

  method new_null_time is also<new-null-time> {
    my $time = i_cal_time_new_null_time();

    $time ?? self.bless( :$time ) !! Nil
  }

  method new_today is also<new-today> {
    my $time = i_cal_time_new_today();

    $time ?? self.bless( :$time ) !! Nil
  }

  method date is rw {
    Proxy.new:
      FETCH => -> $     { self.get_date    },
      STORE => -> $, \v { self.set_date(v) }
  }

  method time is rw {
    Proxy.new:
      FETCH => -> $     { self.get_time    },
      STORE => -> $, \v { self.set_time(v) }
  }

  method timezone is rw {
    Proxy.new:
      FETCH => -> $     { self.get_timezone    },
      STORE => -> $, \v { self.set_timezone(v) }
  }

  method add (ICalDuration() $d) {
    i_cal_time_add($!ict, $d);
  }

  method adjust (
    Int() $days,
    Int() $hours,
    Int() $minutes,
    Int() $seconds
  ) {
    my gint ($d, $h, $m, $s) = ( $days, $hours, $minutes, $seconds );

    i_cal_time_adjust($!ict, $d, $h, $m, $s);
  }

  method as_ical_string is also<as-ical-string> {
    i_cal_time_as_ical_string($!ict);
  }

  method as_timet is also<as-timet> {
    i_cal_time_as_timet($!ict);
  }

  method as_timet_with_zone (ICalTimezone() $zone)
    is also<as-timet-with-zone>
  {
    i_cal_time_as_timet_with_zone($!ict, $zone);
  }

  method clone ( :$raw = False ){
    my $c = i_cal_time_clone($!ict);

    # Transfer: full
    $c ??
      ( $raw ?? $c !! ICal::GLib::Time.new($c, :!ref) )
      !!
      Nil;
  }

  multi method compare (ICal::GLib::Time:U: ICalTime() $b) {
    ICal::GLib::Time.compare($!ict, $b);
  }
  multi method compare (
    ICal::GLib::Time:U:

    ICalTime() $a,
    ICalTime() $b
  ) {
    i_cal_time_compare($a, $b);
  }

  proto method compare_date_only (|)
    is also<compare-date-only>
  { * }

  multi method compare_date_only (ICal::GLib::Time:D: ICalTime() $b) {
    ICal::GLib::Time.compare_date_only($!ict, $b);
  }
  multi method compare_date_only (
    ICal::GLib::Time:U:
    ICalTime() $a,
    ICalTime() $b
  ) {
    i_cal_time_compare_date_only($a, $b);
  }


  proto method compare_date_only_tz (|)
    is also<compare-date-only-tz>
  { * }

  multi method compare_date_only_tz (
    ICal::GLib::Time:U:

    ICalTime()     $b,
    ICalTimezone() $zone
  ) {
    ICal::GLib::Time.compare_date_only_tz($!ict, $b, $zone);
  }
  multi method compare_date_only_tz (
    ICal::GLib::Time:U:

    ICalTime()     $a,
    ICalTime()     $b,
    ICalTimezone() $zone
  ) {
    i_cal_time_compare_date_only_tz($!ict, $b, $zone);
  }

  method convert_to_zone (ICalTimezone() $zone, :$raw = False)
    is also<convert-to-zone>
  {
    my $t-tz = i_cal_time_convert_to_zone($!ict, $zone);

    # Transfer: full
    $t-tz ??
      ( $raw ?? $t-tz !! ICal::GLib::Time.new($t-tz, :!ref) )
      !!
      Nil;
  }

  method convert_to_zone_inplace (ICalTimezone() $zone)
    is also<convert-to-zone-inplace>
  {
    i_cal_time_convert_to_zone_inplace($!ict, $zone);
  }

  method day_of_week is also<day-of-week> {
    i_cal_time_day_of_week($!ict);
  }

  method day_of_year is also<day-of-year> {
    i_cal_time_day_of_year($!ict);
  }

  method days_in_month (Int() $year) is also<days-in-month> {
    my gint $y = $year;

    i_cal_time_days_in_month($!ict, $y);
  }

  method days_in_year is also<days-in-year> {
    i_cal_time_days_in_year($!ict);
  }

  method days_is_leap_year is also<days-is-leap-year> {
    so i_cal_time_days_is_leap_year($!ict);
  }

  proto method get_date (|)
      is also<get-date>
  { * }

  multi method get_date {
    samewith($, $, $);
  }
  multi method get_date (
    $year  is rw,
    $month is rw,
    $day   is rw
  ) {
    my gint ($y, $m, $d) = 0 xx 3;

    i_cal_time_get_date($!ict, $y, $m, $d);
    ($year = $y, $month = $m, $day = $d);
  }

  method get_day is also<get-day> {
    i_cal_time_get_day($!ict);
  }

  method get_hour is also<get-hour> {
    i_cal_time_get_hour($!ict);
  }

  method get_minute is also<get-minute> {
    i_cal_time_get_minute($!ict);
  }

  method get_month is also<get-month> {
    i_cal_time_get_month($!ict);
  }

  method get_second is also<get-second> {
    i_cal_time_get_second($!ict);
  }

  proto method get_time (|)
      is also<get-time>
  { * }

  multi method get_time {
    samewith($, $, $);
  }
  multi method get_time (
    $hour   is rw,
    $minute is rw,
    $second is rw
  ) {
    my gint ($h, $m, $s) = 0 xx 3;

    i_cal_time_get_time($!ict, $h, $m, $s);
    ($hour = $h, $minute = $m, $second = $s);
  }

  method get_timezone (:$raw = False) is also<get-timezone> {
    my $tz = i_cal_time_get_timezone($!ict);

    # Transfer: none
    $tz ??
      ( $raw ?? $tz !! ICal::Timezone.new($tz) )
      !!
      Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_time_get_type, $n, $t );
  }

  method get_tzid is also<get-tzid> {
    i_cal_time_get_tzid($!ict);
  }

  method get_year is also<get-year> {
    i_cal_time_get_year($!ict);
  }

  method is_date is also<is-date> {
    so i_cal_time_is_date($!ict);
  }

  method is_daylight is also<is-daylight> {
    so i_cal_time_is_daylight($!ict);
  }

  method is_null_time is also<is-null-time> {
    so i_cal_time_is_null_time($!ict);
  }

  method is_utc is also<is-utc> {
    so i_cal_time_is_utc($!ict);
  }

  method is_valid_time is also<is-valid-time> {
    so i_cal_time_is_valid_time($!ict);
  }

  method normalize (:$raw = False) {
    my $n = i_cal_time_normalize($!ict);

    # Transfer: full
    $n ??
      ( $raw ?? $n !! ICal::GLib::Time.new($n, :!ref) )
      !!
      Nil
  }

  method normalize_inplace is also<normalize-inplace> {
    i_cal_time_normalize_inplace($!ict);
  }

  method set_date (Int() $year, Int() $month, Int() $day) is also<set-date> {
    my gint ($y, $m, $d) = ($year, $month, $day);

    i_cal_time_set_date($!ict, $y, $m, $d);
  }

  method set_day (Int() $day) is also<set-day> {
    my gint $d = $day;

    i_cal_time_set_day($!ict, $d);
  }

  method set_hour (Int() $hour) is also<set-hour> {
    my gint $h = $hour;

    i_cal_time_set_hour($!ict, $h);
  }

  method set_is_date (Int() $is_date) is also<set-is-date> {
    my gboolean $i = $is_date.so.Int;

    i_cal_time_set_is_date($!ict, $i);
  }

  method set_is_daylight (Int() $is_daylight) is also<set-is-daylight> {
    my gboolean $i = $is_daylight.so.Int;

    i_cal_time_set_is_daylight($!ict, $i);
  }

  method set_minute (Int() $minute) is also<set-minute> {
    my gint $m = $minute;

    i_cal_time_set_minute($!ict, $m);
  }

  method set_month (Int() $month) is also<set-month> {
    my gint $m = $month;

    i_cal_time_set_month($!ict, $m);
  }

  method set_second (Int() $second) is also<set-second> {
    my gint $s = $second;

    i_cal_time_set_second($!ict, $s);
  }

  method set_time (Int() $hour, Int() $minute, Int() $second) is also<set-time> {
    my gint ($h, $m, $s) = ($hour, $minute, $second);

    i_cal_time_set_time($!ict, $h, $m, $s);
  }

  method set_timezone (ICalTimezone() $zone) is also<set-timezone> {
    i_cal_time_set_timezone($!ict, $zone);
  }

  method set_year (Int() $year) is also<set-year> {
    my gint $y = $year;

    i_cal_time_set_year($!ict, $y);
  }

  method start_doy_week (Int() $fdow) is also<start-doy-week> {
    i_cal_time_start_doy_week($!ict, $fdow);
  }

  multi method subtract (ICal::GLib::Time:D: ICalTime $t2) {
    ICal::GLib::Time.substract($!ict, $t2)
  }
  multi method subtract (
    ICal::GLib::Time:U:

    ICalTime() $t1,
    ICalTime() $t2
  ) {
    i_cal_time_subtract($t1, $t2);
  }

  method week_number is also<week-number> {
    i_cal_time_week_number($!ict);
  }

}

class ICal::GLib::Time::Span {
  has ICalTimeSpan $!icts;

  method new (ICalTime() $dtend, gint $is_busy) {
    i_cal_time_span_new($!icts, $dtend, $is_busy);
  }

  multi method contains (ICal::GLib::Time::Span:D: ICalTimeSpan() $container) {
    ICal::GLib::Time::Span.contains($!icts, $container);
  }
  multi method contains (
    ICal::GLib::Time::Span:U:

    ICalTimeSpan() $a,
    ICalTimeSpan() $b
  ) {
    so i_cal_time_span_contains($a, $b);
  }

  multi method overlaps (ICal::GLib::Time::Span:D: ICalTimeSpan() $s2) {
    ICal::GLib::Time::Span.overlaps($!icts, $s2);
  }
  multi method overlaps (
    ICal::GLib::Time::Span:U:

    ICalTimeSpan() $s1,
    ICalTimeSpan() $s2
  ) {
    i_cal_time_span_overlaps($s2, $s2);
  }

  # From i-cal-timezone.h
  method convert_timezone (ICalTimezone() $from_zone, ICalTimezone() $to_zone)
    is also<convert-timezone>
  {
    ICal::GLib::Timezone.convert($!icts, $from_zone, $to_zone);
  }

}
