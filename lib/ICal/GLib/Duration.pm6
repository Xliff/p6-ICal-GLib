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

    $!icd = do {
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
  { $!icd }

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
    my $duration = i_cal_duration_new_bad_duration();

    $duration ?? self.bless( :$duration ) !! Nil;
  }

  method new_from_int (gint $t) is also<new-from-int> {
    my gint $tt       = $t;
    my      $duration = i_cal_duration_new_from_int($t);

    $duration ?? self.bless( :$duration ) !! Nil;
  }

  method new_from_string (Str() $str) is also<new-from-string> {
    my $duration = i_cal_duration_new_from_string($str);

    $duration ?? self.bless( :$duration ) !! Nil;
  }

  method new_null_duration is also<new-null-duration> {
    my $duration = i_cal_duration_new_null_duration();

    $duration ?? self.bless( :$duration ) !! Nil;
  }

  method as_ical_string is also<as-ical-string> {
    i_cal_duration_as_ical_string($!icd);
  }

  method as_int is also<as-int> {
    i_cal_duration_as_int($!icd);
  }

  method get_days is also<get-days> {
    i_cal_duration_get_days($!icd);
  }

  method get_hours is also<get-hours> {
    i_cal_duration_get_hours($!icd);
  }

  method get_minutes is also<get-minutes> {
    i_cal_duration_get_minutes($!icd);
  }

  method get_seconds is also<get-seconds> {
    i_cal_duration_get_seconds($!icd);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_duration_get_type, $n, $t );
  }

  method get_weeks is also<get-weeks> {
    i_cal_duration_get_weeks($!icd);
  }

  method is_bad_duration is also<is-bad-duration> {
    so i_cal_duration_is_bad_duration($!icd);
  }

  method is_neg is also<is-neg> {
    so i_cal_duration_is_neg($!icd);
  }

  method is_null_duration is also<is-null-duration> {
    so i_cal_duration_is_null_duration($!icd);
  }

  method set_days (Int() $days) is also<set-days> {
    my guint $d = $days;

    i_cal_duration_set_days($!icd, $d);
  }

  method set_hours (Int() $hours) is also<set-hours> {
    my guint $h = $hours;

    i_cal_duration_set_hours($!icd, $h);
  }

  method set_is_neg (Int() $is_neg) is also<set-is-neg> {
    my gboolean $i = $is_neg.so.Int;

    i_cal_duration_set_is_neg($!icd, $i);
  }

  method set_minutes (Int() $minutes) is also<set-minutes> {
    my guint $m = $minutes;

    i_cal_duration_set_minutes($!icd, $m);
  }

  method set_seconds (Int() $seconds) is also<set-seconds> {
    my guint $s = $seconds;

    i_cal_duration_set_seconds($!icd, $s);
  }

  method set_weeks (Int() $weeks) is also<set-weeks> {
    my guint $w = $weeks;

    i_cal_duration_set_weeks($!icd, $w);
  }

}
