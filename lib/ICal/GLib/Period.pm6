use v6.c;

use Method::Also;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Period;

use ICal::GLib::Object;

our subset ICalPeriodAncestry is export of Mu
  where ICalPeriod | ICalObjectAncestry;

class ICal::GLib::Period is ICal::GLib::Object {
  has ICalPeriod $!icp;

  submethod BUILD (:$period) {
    self.setICalPeriod($period) if $period;
  }

  method setICalPeriod(ICalPeriodAncestry $_) {
    my $to-parent;

    $!icp = do {
      when ICalPeriod {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalPeriod, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalPeriod
    is also<ICalPeriod>
  { $!icp }

  method ICal::Raw::Definitions::ICalPeriod
    is also<ICalPeriod>
  { cast(ICalPeriod, self.get_native) }

  multi method new (ICalPeriod $native-period, :$raw = False) {
    use NativeCall;
    use ICal::Raw::Component;

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      ICalPeriod,
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-period,
      &icalperiod_free,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalPeriodAncestry $period, :$ref = True) {
    return Nil unless $period;

    my $o = self.bless( :$period );
    $o.ref if $ref;
    $o;
  }

  method new_from_string (Str() $str) is also<new-from-string> {
    my $period = i_cal_period_new_from_string($str);

    $period ?? self.bless( :$period ) !! Nil;
  }

  method new_null_period is also<new-null-period> {
    my $period = i_cal_period_new_null_period();

    $period ?? self.bless( :$period ) !! Nil;
  }

  method duration is rw {
    Proxy.new:
      FETCH => -> $     { self.get_duration    },
      STORE => -> $, \v { self.set_duration(v) }
  }

  method end is rw {
    Proxy.new:
      FETCH => -> $     { self.get_end    },
      STORE => -> $, \v { self.set_end(v) }
  }

  method start is rw {
    Proxy.new:
      FETCH => -> $     { self.get_start    },
      STORE => -> $, \v { self.set_start(v) }
  }

  method as_ical_string is also<as-ical-string> {
    i_cal_period_as_ical_string($!icp);
  }

  method get_duration (:$raw = False) is also<get-duration> {
    my $d = i_cal_period_get_duration($!icp);

    # Transfer: full
    $d ??
      ( $raw ?? $d !! ICal::GLib::Duration.new($d, :!ref) )
      !!
      Nil;
  }

  method get_end ( :$raw = False ) is also<get-end> {
    my $t = i_cal_period_get_end($!icp);

    # Transfer: full
    $t
      ( $raw ?? $t !! ICal::GLib::Time.new($t, :!ref) )
      !!
      Nil;
  }

  method get_start ( :$raw = False ) is also<get-start> {
    my $t = i_cal_period_get_start($!icp);

    # Transfer: full
    $t
      ( $raw ?? $t !! ICal::GLib::Time.new($t, :!ref) )
      !!
      Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_period_get_type, $n, $t );
  }

  method is_null_period is also<is-null-period> {
    so i_cal_period_is_null_period($!icp);
  }

  method is_valid_period is also<is-valid-period> {
    so i_cal_period_is_valid_period($!icp);
  }

  method set_duration (ICalDuration() $duration) is also<set-duration> {
    i_cal_period_set_duration($!icp, $duration);
  }

  method set_end (ICalTime() $end) is also<set-end> {
    i_cal_period_set_end($!icp, $end);
  }

  method set_start (ICalTime() $start) is also<set-start> {
    i_cal_period_set_start($!icp, $start);
  }
}
