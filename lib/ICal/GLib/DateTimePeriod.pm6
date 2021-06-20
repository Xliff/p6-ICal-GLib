use v6.c;

use Method::Also;

use ICal::Raw::Structs;
use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::DateTimePeriod;

use ICal::GLib::Object;

our subset ICalDatetimeperiodAncestry is export of Mu
  where ICalDatetimeperiod | ICalObjectAncestry;

class ICal::GLib::DateTimePeriod is ICal::GLib::Object {
  has ICalDatetimeperiod $!icd;

  submethod BUILD (:$datetime-period) {
    self.setICalDatetimeperiod($datetime-period) if $datetime-period;
  }

  method setICalDatetimeperiod(ICalDatetimeperiodAncestry $_) {
    my $to-parent;

    $!icd = do {
      when ICalDatetimeperiod {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalDatetimeperiod, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalDatetimeperiod
    is also<
      ICalDatetimeperiod
      ICalDateTimePeriod
    >
  { $!icd }

  method ICal::Raw::Definitions::icaldatetimeperiodtype
    is also<icaldatetimeperiodtype>
  { cast(icaldatetimeperiodtype, self.get_native) }

  multi method new (icaldatetimeperiodtype $native-datetime-period, :$raw = False) {
    use NativeCall;

    sub i_cal_datetimeperiod_free (ICalDatetimeperiod $d) {
      free($d.&p);
    }

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      icaldatetimeperiodtype,
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-datetime-period,
      &i_cal_datetimeperiod_free,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalDatetimeperiodAncestry $datetime-period, :$ref = True) {
    return Nil unless $datetime-period;

    my $o = self.bless( :$datetime-period );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $datetime-period = i_cal_datetimeperiod_new();

    $datetime-period ?? self.bless( :$datetime-period ) !! Nil;
  }

  method get_period is also<get-period> {
    i_cal_datetimeperiod_get_period($!icd);
  }

  method get_time is also<get-time> {
    i_cal_datetimeperiod_get_time($!icd);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_datetimeperiod_get_type, $n, $t );
  }

  method set_period (ICalPeriod() $period) is also<set-period> {
    i_cal_datetimeperiod_set_period($!icd, $period);
  }

  method set_time (ICalTime() $time) is also<set-time> {
    i_cal_datetimeperiod_set_time($!icd, $time);
  }

}
