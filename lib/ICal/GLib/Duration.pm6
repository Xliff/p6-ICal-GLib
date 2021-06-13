use v6.c;

use Method::Also;

use NativeCall;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Duration;

use ICal::GLib::Object;

our subset ICalDurationAncestry is export of Mu
  where ICalDuration | ICalObjectAncestry;

class ICal::GLib::Duration is ICal::GLib::Object {
  has ICalDuration $!icd;

  submethod BUILD (:$ical-duration) {
    self.setICalDuration($ical-duration) if $ical-duration;
  }

  method setICalDuration(ICalDurationAncestry $_) {
    my $to-parent;

    $!icc = do {
      when ICalDuration {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalDuration, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalDuration
    is also<ICalDuration>
  { $!icc }

  method ICal::Raw::Definitions::icaldurationtype
    is also<icaldurationtype>
  { cast(icaldurationtype, self.get_native) }

  multi method new (icaldurationtype $native-duration, :$raw = False) {
    use NativeCall;
    use ICal::Raw::Component;

    sub icaldurationtype_free (icaldurationtype $d) {
      free($d.&p);
    }

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      icaldurationtype,
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-duration,
      &icaldurationtype_free,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalDurationAncestry $ical-duration, :$ref = True) {
    return Nil unless $ical-duration;

    my $o = self.bless( :$ical-duration );
    $o.ref if $ref;
    $o;
  }

  method new_bad_duration is also<new-bad-duration> {
    my $duration = i_cal_duration_new_bad_duration($!icr);

    $duration ?? self.bless( :$duration ) !! Nil;
  }

  method new_from_int (gint $t) is also<new-from-int> {
    my $duration = i_cal_duration_new_from_int($!icr, $t);

    $duration ?? self.bless( :$duration ) !! Nil;
  }

  method new_from_string (Str $str) is also<new-from-string> {
    my $duration = i_cal_duration_new_from_string($!icr, $str);

    $duration ?? self.bless( :$duration ) !! Nil;
  }

  method new_null_duration is also<new-null-duration> {
    my $duration = i_cal_duration_new_null_duration($!icr);

    $duration ?? self.bless( :$duration ) !! Nil;
  }

  method as_ical_string is also<as-ical-string> {
    i_cal_duration_as_ical_string($!icr);
  }

  method as_int is also<as-int> {
    i_cal_duration_as_int($!icr);
  }

  method get_days is also<get-days> {
    i_cal_duration_get_days($!icr);
  }

  method get_hours is also<get-hours> {
    i_cal_duration_get_hours($!icr);
  }

  method get_minutes is also<get-minutes> {
    i_cal_duration_get_minutes($!icr);
  }

  method get_seconds is also<get-seconds> {
    i_cal_duration_get_seconds($!icr);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_duration_get_type, $n, $t );
  }

  method get_weeks is also<get-weeks> {
    i_cal_duration_get_weeks($!icr);
  }

  method is_bad_duration is also<is-bad-duration> {
    so i_cal_duration_is_bad_duration($!icr);
  }

  method is_neg is also<is-neg> {
    so i_cal_duration_is_neg($!icr);
  }

  method is_null_duration is also<is-null-duration> {
    so i_cal_duration_is_null_duration($!icr);
  }

  method set_days (Int() $days) is also<set-days> {
    my guint $d = $days;

    i_cal_duration_set_days($!icr, $days);
  }

  method set_hours (Int() $hours) is also<set-hours> {
    my guint $h = $hours;

    i_cal_duration_set_hours($!icr, $hours);
  }

  method set_is_neg (Int() $is_neg) is also<set-is-neg> {
    my gboolean = $is_neg.so.Int;

    i_cal_duration_set_is_neg($!icr, $is_neg);
  }

  method set_minutes (Int() $minutes) is also<set-minutes> {
    my guint $m = $minutes;

    i_cal_duration_set_minutes($!icr, $minutes);
  }

  method set_seconds (Int() $seconds) is also<set-seconds> {
    my guint $s = $seconds;

    i_cal_duration_set_seconds($!icr, $seconds);
  }

  method set_weeks (Int() $weeks) is also<set-weeks> {
    my guint $w = $weeks;

    i_cal_duration_set_weeks($!icr, $weeks);
  }

}
