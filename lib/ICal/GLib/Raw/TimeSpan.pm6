use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;

unit package ICal::GLib::Raw::TimeSpan;

sub i_cal_time_span_clone (ICalTimeSpan $src)
  returns ICalTimeSpan
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_span_get_end (ICalTimeSpan $timespan)
  returns time_t
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_span_get_is_busy (ICalTimeSpan $timespan)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_span_get_start (ICalTimeSpan $timespan)
  returns time_t
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_span_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_span_new_timet (time_t $start, time_t $end, gboolean $is_busy)
  returns ICalTimeSpan
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_span_set_end (ICalTimeSpan $timespan, time_t $end)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_span_set_is_busy (ICalTimeSpan $timespan, gboolean $is_busy)
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_span_set_start (ICalTimeSpan $timespan, time_t $start)
  is native(ical-glib)
  is export
{ * }

### /usr/include/libical-glib/i-cal-time-span.h

sub i_cal_time_span_contains (
  ICalTimeSpan $s,
  ICalTimeSpan $container
)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_span_new (
  ICalTime $dtstart,
  ICalTime $dtend,
  gint     $is_busy
)
  returns ICalTimeSpan
  is native(ical-glib)
  is export
{ * }

sub i_cal_time_span_overlaps (ICalTimeSpan $s1, ICalTimeSpan $s2)
  returns gint
  is native(ical-glib)
  is export
{ * }
