use v6.c;

use Method::Also;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Recurrence;

use GLib::Array;
use ICal::GLib::Object;
use ICal::GLib::Time;

our subset ICalRecurrenceAncestry is export of Mu
  where ICalRecurrence | ICalObjectAncestry;

class ICal::GLib::Recurrence is ICal::GLib::Object {
  has ICalRecurrence $!icr;

  submethod BUILD (:$recurrence) {
    self.setICalRecurrence($recurrence) if $recurrence;
  }

  method setICalRecurrence(ICalRecurrenceAncestry $_) {
    my $to-parent;

    $!icr = do {
      when ICalRecurrence {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalRecurrence, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalRecurrence
    is also<ICalRecurrence>
  { $!icr }

  method ICal::Raw::Definitions::icalrecurrencetype
    is also<icalrecurrencetype>
  { cast(icalrecurrencetype, self.get_native) }

  multi method new (icalrecurrencetype $native-recurrence, :$raw = False) {
    use NativeCall;

    sub icalrecurrence_free (icalrecurrencetype $d) {
      free($d.&p);
    }

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      ICalRecurrence,
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-recurrence,
      &icalrecurrence_free,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalRecurrenceAncestry $recurrence, :$ref = True) {
    return Nil unless $recurrence;

    my $o = self.bless( :$recurrence );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $recurrence = i_cal_recurrence_new();

    $recurrence ?? self.bless( :$recurrence ) !! Nil;
  }

  method new_from_string (Str() $str) is also<new-from-string> {
    my $recurrence = i_cal_recurrence_new_from_string($str);

    $recurrence ?? self.bless( :$recurrence ) !! Nil;
  }

  method clear {
    i_cal_recurrence_clear($!icr);
  }

  method day_day_of_week (ICal::GLib::Recurrence:U: Int() $day)
    is also<day-day-of-week>
  {
    my gshort $d = $day;

    ICalRecurrenceWeekdayEnum( i_cal_recurrence_day_day_of_week($d) );
  }

  method day_position (ICal::GLib::Recurrence:U: Int() $day)
    is also<day-position>
  {
    my gshort $d = $day;

    i_cal_recurrence_day_position($d);
  }

  method get_by_day (Int() $index) is also<get-by-day> {
    my guint $i = $index;

    i_cal_recurrence_get_by_day($!icr, $i);
  }

  method get_by_day_array (:$raw = False) is also<get-by-day-array> {
    return i_cal_recurrence_get_by_day_array($!icr) if $raw;

    my $ns = cast(icalrecurrencetype, self.get_native);
    $ns.by_day;
  }

  method get_by_hour (Int() $index) is also<get-by-hour> {
    my guint $i = $index;

    i_cal_recurrence_get_by_hour($!icr, $i);
  }

  method get_by_hour_array (:$raw = False) is also<get-by-hour-array> {
    return i_cal_recurrence_get_by_hour_array($!icr) if $raw;

    my $ns = cast(icalrecurrencetype, self.get_native);
    $ns.by_hour;
  }

  method get_by_minute (Int() $index) is also<get-by-minute> {
    my guint $i = $index;

    i_cal_recurrence_get_by_minute($!icr, $i);
  }

  method get_by_minute_array (:$raw = False) is also<get-by-minute-array> {
    my $a = i_cal_recurrence_get_by_minute_array($!icr) if $raw;

    my $ns = cast(icalrecurrencetype, self.get_native);
    $ns.by_minute;
  }

  method get_by_month (Int() $index) is also<get-by-month> {
    my guint $i = $index;

    i_cal_recurrence_get_by_month($!icr, $i);
  }

  method get_by_month_array (:$raw = False) is also<get-by-month-array> {
    return i_cal_recurrence_get_by_month_array($!icr) if $raw;

    my $ns = cast(icalrecurrencetype, self.get_native);
    $ns.by_month;
  }

  method get_by_month_day (Int() $index) is also<get-by-month-day> {
    my guint $i = $index;

    i_cal_recurrence_get_by_month_day($!icr, $i);
  }

  method get_by_month_day_array (:$raw = False) is also<get-by-month-day-array> {
    return i_cal_recurrence_get_by_month_day_array($!icr) if $raw;

    my $ns = cast(icalrecurrencetype, self.get_native);
    $ns.by_month_day;
  }

  method get_by_second (Int() $index) is also<get-by-second> {
    my guint $i = $index;

    i_cal_recurrence_get_by_second($!icr, $i);
  }

  method get_by_second_array (:$raw = False) is also<get-by-second-array> {
    # cw: i_cal_recurrence_get_by_second_arary is BOGUS, man!
    #     So we return it only to the rubes that ask for it, direct.
    #
    return i_cal_recurrence_get_by_second_array($!icr) if $raw;

    # $a ??
    #   ( $raw ?? $a !! GLib::Array.new($a, type => gshort, :!ref) )
    #   !!
    #   Nil;
    my $ns = cast(icalrecurrencetype, self.get_native);
    $ns.by_second;
  }

  method get_by_set_pos (Int() $index) is also<get-by-set-pos> {
    my guint $i = $index;

    i_cal_recurrence_get_by_set_pos($!icr, $i);
  }

  method get_by_set_pos_array (:$raw = False) is also<get-by-set-pos-array> {
    return i_cal_recurrence_get_by_set_pos_array($!icr) if $raw;

    my $ns = cast(icalrecurrencetype, self.get_native);
    $ns.by_set_pos;
  }

  method get_by_week_no (Int() $index) is also<get-by-week-no> {
    my guint $i = $index;

    i_cal_recurrence_get_by_week_no($!icr, $i);
  }

  method get_by_week_no_array (:$raw = False) is also<get-by-week-no-array> {
    return i_cal_recurrence_get_by_week_no_array($!icr) if $raw;

    my $ns = cast(icalrecurrencetype, self.get_native);
    $ns.by_week_no;
  }

  method get_by_year_day (Int() $index) is also<get-by-year-day> {
    my guint $i = $index;

    i_cal_recurrence_get_by_year_day($!icr, $i);
  }

  method get_by_year_day_array (:$raw = False) is also<get-by-year-day-array> {
    return i_cal_recurrence_get_by_year_day_array($!icr) if $raw;

    my $ns = cast(icalrecurrencetype, self.get_native);
    $ns.by_year_day;
  }

  method get_count is also<get-count> {
    i_cal_recurrence_get_count($!icr);
  }

  method get_freq is also<get-freq> {
    ICalRecurrenceFrequencyEnum( i_cal_recurrence_get_freq($!icr) );
  }

  method get_interval is also<get-interval> {
    i_cal_recurrence_get_interval($!icr);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_recurrence_get_type, $n, $t );
  }

  method get_until (:$raw = False) is also<get-until> {
    my $t = i_cal_recurrence_get_until($!icr);

    $t ??
      ( $raw ?? $t !! ICal::GLib::Time.new($t, :!ref) )
      !!
      Nil;
  }

  method get_week_start is also<get-week-start> {
    ICalRecurrenceWeekdayEnum( i_cal_recurrence_get_week_start($!icr) );
  }

  method month_is_leap (ICal::GLib::Recurrence:U: Int() $month)
    is also<month-is-leap>
  {
    my gshort $m = $month;

    so i_cal_recurrence_month_is_leap($m);
  }

  method month_month (ICal::GLib::Recurrence:U: Int() $month)
    is also<month-month>
  {
    my gshort $m = $month;

    i_cal_recurrence_month_month($m);
  }

  method rscale_is_supported (ICal::GLib::Recurrence:U: )
    is also<rscale-is-supported>
  {
    so i_cal_recurrence_rscale_is_supported();
  }

  method rscale_supported_calendars (ICal::GLib::Recurrence:U: :$raw = False)
    is also<rscale-supported-calendars>
  {
    my $a = i_cal_recurrence_rscale_supported_calendars();

    $a ??
      ( $raw ?? $a !! GLib::Array.new($a, :!ref) )
      !!
      Nil;
  }

  method !positionalToGArray ($values is copy) {
    if $values ~~ Positional && $values !~~ GLib::Array {
      $values = GLib::Array.new(
        # Values are shorts, written into 16bit elements stored as pointer
        # addresses.
        $values.map( *.&clamp( intRange( bits => 16 ) ) ),
        typed => gshort,
      );

      # cw: Coercion to Array still may not work.
      # $values.Array.gist.say;
    }
    if $values.^lookup('GArray') -> $m {
      $values = $m($values);
    }
    die "$values must be GArray-compatible! { $values.^name } is not."
      unless $values ~~ GArray;

    $values;
  }

  method set_by_day (Int() $index, Int() $value) is also<set-by-day> {
    my guint  $i = $index;
    my gshort $v = $value;

    i_cal_recurrence_set_by_day($!icr, $i, $v);
  }

  method set_by_day_array ($values) is also<set-by-day-array> {
    i_cal_recurrence_set_by_day_array(
      $!icr,
      self!positionalToGArray($values)
    );
  }

  multi method set_by_hour (Int() $index, Int() $value) is also<set-by-hour> {
    my guint  $i = $index;
    my gshort $v = $value;

    i_cal_recurrence_set_by_hour($!icr, $i, $v);
  }

  method set_by_hour_array ($values) is also<set-by-hour-array> {
    i_cal_recurrence_set_by_hour_array(
      $!icr,
      self!positionalToGArray($values)
    );
  }

  method set_by_minute (Int() $index, Int() $value) is also<set-by-minute> {
    my guint  $i = $index;
    my gshort $v = $value;

    i_cal_recurrence_set_by_minute($!icr, $i, $v);
  }

  method set_by_minute_array ($values) is also<set-by-minute-array> {
    i_cal_recurrence_set_by_minute_array(
      $!icr,
      self!positionalToGArray($values)
    );
  }

  method set_by_month (Int() $index, Int() $value) is also<set-by-month> {
    my guint  $i = $index;
    my gshort $v = $value;

    i_cal_recurrence_set_by_month($!icr, $i, $v);
  }

  method set_by_month_array ($values) is also<set-by-month-array> {
    i_cal_recurrence_set_by_month_array(
      $!icr,
      self!positionalToGArray($values)
    );
  }

  method set_by_month_day (Int() $index, Int() $value)
    is also<set-by-month-day>
  {
    my guint  $i = $index;
    my gshort $v = $value;

    i_cal_recurrence_set_by_month_day($!icr, $i, $v);
  }

  method set_by_month_day_array ($values) is also<set-by-month-day-array> {
    i_cal_recurrence_set_by_month_day_array(
      $!icr,
      self!positionalToGArray($values)
    );
  }

  method set_by_second (Int() $index, Int() $value) is also<set-by-second> {
    my guint  $i = $index;
    my gshort $v = $value;

    say "set_by_second position $i value { $value } / { $v }";

    i_cal_recurrence_set_by_second($!icr, $i, $v);
  }

  proto method set_by_second_array (|)
    is also<set-by-second-array>
  { * }

  multi method set_by_second_array ($values) {
    i_cal_recurrence_set_by_second_array(
      $!icr,
      self!positionalToGArray($values)
    )
  }

  method set_by_set_pos (Int() $index, Int() $value) is also<set-by-set-pos> {
    my guint  $i = $index;
    my gshort $v = $value;

    i_cal_recurrence_set_by_set_pos($!icr, $i, $v);
  }

  multi method set_by_set_pos_array ($values) is also<set-by-set-pos-array> {
    i_cal_recurrence_set_by_set_pos_array(
      $!icr,
      self!positionalToGArray($values)
    );
  }

  method set_by_week_no (Int() $index, Int() $value) is also<set-by-week-no> {
    my guint  $i = $index;
    my gshort $v = $value;

    i_cal_recurrence_set_by_week_no($!icr, $i, $v);
  }

  method set_by_week_no_array ($values)  is also<set-by-week-no-array > {
    i_cal_recurrence_set_by_week_no_array(
      $!icr,
      self!positionalToGArray($values)
    );
  }

  method set_by_year_day (Int() $index, Int() $value) is also<set-by-year-day> {
    my guint  $i = $index;
    my gshort $v = $value;

    i_cal_recurrence_set_by_year_day($!icr, $i, $v);
  }

  method set_by_year_day_array ($values) is also<set-by-year-day-array> {
    i_cal_recurrence_set_by_year_day_array(
      $!icr,
      self!positionalToGArray($values)
    );
  }

  method set_count (Int() $count) is also<set-count> {
    my gint $c = $count;

    i_cal_recurrence_set_count($!icr, $c);
  }

  method set_freq (Int() $freq) is also<set-freq> {
    my ICalRecurrenceFrequency $f = $freq;

    i_cal_recurrence_set_freq($!icr, $f);
  }

  method set_interval (Int() $interval) is also<set-interval> {
    my gshort $i = $interval;

    i_cal_recurrence_set_interval($!icr, $i);
  }

  method set_until (ICalTime() $until) is also<set-until> {
    i_cal_recurrence_set_until($!icr, $until);
  }

  method set_week_start (Int() $week_start) is also<set-week-start> {
    my ICalRecurrenceWeekday $w = $week_start;

    i_cal_recurrence_set_week_start($!icr, $w);
  }

  method to_string
    is also<
      to-string
      Str
    >
  {
    i_cal_recurrence_to_string($!icr);
  }

  method frequency_from_string (ICal::GLib::Recurrence:U: Str() $str)
    is also<frequency-from-string>
  {
    ICalRecurrenceFrequencyEnum( i_cal_recurrence_frequency_from_string($str) );
  }

  method frequency_to_string (ICal::GLib::Recurrence:U: Int() $kind)
    is also<frequency-to-string>
  {
    my ICalRecurrenceFrequency $k = $kind;

    i_cal_recurrence_frequency_to_string($k);
  }

  method skip_from_string (ICal::GLib::Recurrence:U:  Str() $skip)
    is also<skip-from-string>
  {
    ICalRecurrenceSkipEnum( i_cal_recurrence_skip_from_string($skip) );
  }

  method skip_to_string (ICal::GLib::Recurrence:U: Int() $skip)
    is also<skip-to-string>
  {
    my ICalRecurrenceSkip $s = $skip;

    i_cal_recurrence_skip_to_string($s);
  }

  method weekday_from_string (ICal::GLib::Recurrence:U: Str() $str)
    is also<weekday-from-string>
  {
    ICalRecurrenceWeekdayEnum( i_cal_recurrence_weekday_from_string($str) );
  }

  method weekday_to_string (ICal::GLib::Recurrence:U: Int() $kind)
    is also<weekday-to-string>
  {
    my ICalRecurrenceWeekday $k = $kind;

    i_cal_recurrence_weekday_to_string($k);
  }

}

class ICal::GLib::Recur {
  also does GLib::Roles::StaticClass;

  method expand_recurrence (
    Str() $rule,
    Int() $start,
    Int() $count,
          :$raw   = False
  )
    is also<expand-recurrence>
  {
    my time_t $s  = $start;
    my gint   $c  = $count;
    my        $ex = i_cal_recur_expand_recurrence($rule, $s, $c);

    $ex ??
      ( $raw ?? $ex !! GLib::Array.new($ex, typed => gulong) )
      !!
      Nil;
  }

}
