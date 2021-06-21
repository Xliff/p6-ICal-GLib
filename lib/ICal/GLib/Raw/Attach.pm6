use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;

unit package ICal::GLib::Raw::Attach;

### /usr/include/libical-glib/i-cal-attach.h

sub i_cal_attach_get_data (ICalAttach $attach)
  returns CArray[uint8]
  is native(ical-glib)
  is export
{ * }

sub i_cal_attach_get_is_url (ICalAttach $attach)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_attach_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_attach_get_url (ICalAttach $attach)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_attach_new_from_bytes (GBytes $bytes)
  returns ICalAttach
  is native(ical-glib)
  is export
{ * }

sub i_cal_attach_new_from_data (
  Pointer $data,
  GFunc $free_fn,
  Pointer $free_fn_data
)
  returns ICalAttach
  is native(ical-glib)
  is export
{ * }

sub i_cal_attach_new_from_url (Str $url)
  returns ICalAttach
  is native(ical-glib)
  is export
{ * }

sub i_cal_attach_ref (ICalAttach $attach)
  is native(ical-glib)
  is export
{ * }

sub i_cal_attach_unref (ICalAttach $attach)
  is native(ical-glib)
  is export
{ * }
