use v6.c;

use Method::Also;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Trigger;

use ICal::GLib::Object;

our subset ICalTriggerAncestry is export of Mu
  where ICalTrigger | ICalObjectAncestry;

class ICal::GLib::Trigger is ICal::GLib::Object {
  has ICalTrigger $!ict;

  submethod BUILD (:$trigger) {
    self.setICalTrigger($trigger) if $trigger;
  }

  method setICalTrigger(ICalTriggerAncestry $_) {
    my $to-parent;

    $!ict = do {
      when ICalTrigger {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalTrigger, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalTrigger
    is also<ICalTrigger>
  { $!ict }

  method ICal::Raw::Definitions::icaltriggertype
    is also<icaltriggertype>
  { cast(icaltriggertype, self.get_native) }

  multi method new (icaltriggertype $native-trigger, :$raw = False) {
    use NativeCall;

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      icaltriggertype,
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    sub icaltrigger_free (icaltriggertype $d) {
      free($d.&p);
    }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-trigger,
      &icaltrigger_free,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalTriggerAncestry $trigger, :$ref = True) {
    return Nil unless $trigger;

    my $o = self.bless( :$trigger );
    $o.ref if $ref;
    $o;
  }

  method new_from_int (Int() $reltime) is also<new-from-int> {
    my gint $r = $reltime;

    my $trigger = i_cal_trigger_new_from_int($!ict, $reltime);

    $trigger ?? self.bless( :$trigger ) !! Nil;
  }

  method duration is rw {
    Proxy.new:
      FETCH => -> $     { self.get_duration    },
      STORE => -> $, \v { self.set_duration(v) }
  }

  method time is rw {
    Proxy.new:
      FETCH => -> $     { self.get_time    },
      STORE => -> $, \v { self.set_time(v) }
  }

  method new_from_string (Str() $str) is also<new-from-string> {
    my $trigger = i_cal_trigger_new_from_string($str);

    $trigger ?? self.bless( :$trigger ) !! Nil;
  }

  method get_duration (:$raw = False) is also<get-duration> {
    my $o = i_cal_trigger_get_duration($!ict);

    $o ??
      ( $raw ?? $o !! ICal::GLib::Duration.new($o, :!ref) )
      !!
      Nil
  }

  method get_time (:$raw = False) is also<get-time> {
    my $o = i_cal_trigger_get_time($!ict);

    $o ??
      ( $raw ?? $o !! ICal::GLib::Time.new($o, :!ref) )
      !!
      Nil
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_trigger_get_type, $n, $t );
  }

  method is_bad_trigger is also<is-bad-trigger> {
    so i_cal_trigger_is_bad_trigger($!ict);
  }

  method is_null_trigger is also<is-null-trigger> {
    so i_cal_trigger_is_null_trigger($!ict);
  }

  method set_duration (ICalDuration() $duration) is also<set-duration> {
    i_cal_trigger_set_duration($!ict, $duration);
  }

  method set_time (ICalTime() $time) is also<set-time> {
    i_cal_trigger_set_time($!ict, $time);
  }

}
