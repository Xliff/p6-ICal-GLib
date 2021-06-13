use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;

unit package ICal::GLib::Raw::RecurIterator;

### /usr/include/libical-glib/i-cal-recur-iterator.h

sub i_cal_recur_iterator_free (ICalRecurIterator $iterator)
  is native(ical-glib)
  is export
{ * }

sub i_cal_recur_iterator_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_recur_iterator_new (ICalRecurrence $rule, ICalTime $dtstart)
  returns ICalRecurIterator
  is native(ical-glib)
  is export
{ * }

sub i_cal_recur_iterator_next (ICalRecurIterator $iterator)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_recur_iterator_set_start (ICalRecurIterator $iterator, ICalTime $start)
  returns gint
  is native(ical-glib)
  is export
{ * }
