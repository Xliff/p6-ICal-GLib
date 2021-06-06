use v6.c;

use NativeCall;

use GLib::Raw::Definitions;

use GLib::Roles::Pointers

unit package ICal::GLib::Raw::Definitions;

constant ical-glib = 'ical-glib',v3;

class ICalComponent  is repr<CPointer> is export does GLib::Roles::Pointers { }
class ICalCompIter   is repr<CPointer> is export does GLib::Roles::Pointers { }
class ICalObject     is repr<CPointer> is export does GLib::Roles::Pointers { }
class ICalProperty   is repr<CPointer> is export does GLib::Roles::Pointers { }
class ICalTime       is repr<CPointer> is export does GLib::Roles::Pointers { }
class ICalTimeSpan   is repr<CPointer> is export does GLib::Roles::Pointers { }
