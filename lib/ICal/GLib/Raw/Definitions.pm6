use v6.c;

use NativeCall;

use GLib::Raw::Definitions;

use GLib::Roles::Pointers;

unit package ICal::GLib::Raw::Definitions;

constant ical-glib is export = 'ical-glib',v3;

class ICalComponent  is repr<CPointer> does GLib::Roles::Pointers is export  { }
class ICalCompIter   is repr<CPointer> does GLib::Roles::Pointers is export  { }
class ICalObject     is repr<CPointer> does GLib::Roles::Pointers is export  { }
class ICalParameter  is repr<CPointer> does GLib::Roles::Pointers is export  { }
class ICalProperty   is repr<CPointer> does GLib::Roles::Pointers is export  { }
class ICalTime       is repr<CPointer> does GLib::Roles::Pointers is export  { }
class ICalTimeSpan   is repr<CPointer> does GLib::Roles::Pointers is export  { }
class ICalValue      is repr<CPointer> does GLib::Roles::Pointers is export  { }
