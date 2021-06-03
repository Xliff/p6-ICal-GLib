use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;
use ICal::GLib::Raw::Structs;

unit package ICal::GLib::Raw::Object;

### /usr/include/libical-glib/i-cal-object.h

sub i_cal_object_add_depender (ICalObject $iobject, GObject $depender)
  is native(ical-glib)
  is export
{ * }

sub i_cal_object_construct (
  GType          $object_type,
  gpointer       $native,
  GDestroyNotify $native_destroy_func,
  gboolean       $is_global_memory,
  GObject        $owner
)
  returns Pointer
  is native(ical-glib)
  is export
{ * }

sub i_cal_object_free_global_objects ()
  is native(ical-glib)
  is export
{ * }

sub i_cal_object_get_is_global_memory (ICalObject $iobject)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_object_get_native (ICalObject $iobject)
  returns Pointer
  is native(ical-glib)
  is export
{ * }

sub i_cal_object_get_native_destroy_func (ICalObject $iobject)
  returns GDestroyNotify
  is native(ical-glib)
  is export
{ * }

sub i_cal_object_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_object_ref_owner (ICalObject $iobject)
  returns GObject
  is native(ical-glib)
  is export
{ * }

sub i_cal_object_remove_depender (ICalObject $iobject, GObject $depender)
  is native(ical-glib)
  is export
{ * }

sub i_cal_object_remove_owner (ICalObject $iobject)
  is native(ical-glib)
  is export
{ * }

sub i_cal_object_set_native_destroy_func (
  ICalObject     $iobject,
  GDestroyNotify $native_destroy_func
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_object_set_owner (ICalObject $iobject, GObject $owner)
  is native(ical-glib)
  is export
{ * }

sub i_cal_object_steal_native (ICalObject $iobject)
  returns Pointer
  is native(ical-glib)
  is export
{ * }
