use v6.c;

use Method::Also;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::TimeSpan;

use ICal::GLib::Object;

our subset ICalTimeSpanAncestry is export of Mu
  where ICalTimeSpan | ICalObjectAncestry;

class ICal::GLib::TimeSpan is ICal::GLib::Object {
  has ICalTimeSpan $!icts;

  submethod BUILD (:$ical-property) {
    self.setICalTimeSpan($ical-property) if $ical-property;
  }

  method setICalTimeSpan(ICalTimeSpanAncestry $_) {
    my $to-parent;

    $!icts = do {
      when ICalTimeSpan {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalTimeSpan, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::ICalTimeSpan
    is also<ICalTimeSpan>
  { $!icts }

  method ICal::Raw::Structs::icaltime_span
    is also<icaltime_span>
  { cast(icaltime_span, self.get_native) }

  multi method new (icaltime_span $native-ical-ts, :$raw = False) {
    use NativeCall;
    use ICal::Raw::Time;

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      icaltime_span,
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-ical-ts,
      &free,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalTimeSpanAncestry $timespan, :$ref = True) {
    return Nil unless $timespan;

    my $o = self.bless( :$timespan );
    $o.ref if $ref;
    $o;
  }

  method new_timet (Int() $start, Int() $end, Int() $is_busy) is also<new-timet> {
    my time_t   ($s, $e) = ($start, $end);
    my gboolean $i       = $is_busy.so.Int;

    my $timespan = i_cal_time_span_new_timet($!icts, $s, $e, $i);

    $timespan ?? self.bless( :$timespan ) !! Nil;
  }

  method end is rw {
    Proxy.new:
      FETCH => -> $     { self.get_end    },
      STORE => -> $, \v { self.set_end(v) }
  }

  method is_busy is rw is also<is-busy> {
    Proxy.new:
      FETCH => -> $     { self.get_is_busy    },
      STORE => -> $, \v { self.set_is_busy(v) }
  }

  method start is rw {
    Proxy.new:
      FETCH => -> $     { self.get_start    },
      STORE => -> $, \v { self.set_start(v) }
  }


  method clone (:$raw = False) {
    my $ts = i_cal_time_span_clone($!icts);

    # Transfer: full
    $ts ??
      ( $raw ?? $ts !! ICal::GLib::TimeSpan.new($ts, :!ref) )
      !!
      Nil;
  }

  multi method contains (
    ICal::GLib::TimeSpan:D:

    ICalTimeSpan() $s2
  ) {
    so i_cal_time_span_contains($!icts, $s2);
  }

  multi method overlaps (
    ICal::GLib::TimeSpan:U:

    ICalTimeSpan() $s1,
    ICalTimeSpan() $s2
  ) {
    so i_cal_time_span_overlaps($s1, $s2);
  }

  multi method overlaps (
    ICal::GLib::TimeSpan:D:

    ICalTimeSpan() $s2
  ) {
    so i_cal_time_span_overlaps($!icts, $s2);
  }

  multi method overlaps (
    ICal::GLib::TimeSpan:U:

    ICalTimeSpan() $s1,
    ICalTimeSpan() $s2
  ) {
    so i_cal_time_span_overlaps($s1, $s2);
  }

  method get_end is also<get-end> {
    i_cal_time_span_get_end($!icts);
  }

  method get_is_busy is also<get-is-busy> {
    i_cal_time_span_get_is_busy($!icts);
  }

  method get_start is also<get-start> {
    i_cal_time_span_get_start($!icts);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_time_span_get_type, $n, $t );
  }

  method set_end (Int() $end) is also<set-end> {
    my time_t $e = $end;

    i_cal_time_span_set_end($!icts, $e);
  }

  method set_is_busy (Int() $is_busy) is also<set-is-busy> {
    my gboolean $i = $is_busy.so.Int;

    i_cal_time_span_set_is_busy($!icts, $i);
  }

  method set_start (Int() $start) is also<set-start> {
    my time_t $s = $start;

    i_cal_time_span_set_start($!icts, $s);
  }

}
