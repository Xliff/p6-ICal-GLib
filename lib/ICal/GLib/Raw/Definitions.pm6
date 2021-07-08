use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Object;

use GLib::Roles::Pointers;

# Forced compile count
constant forced = 1;

unit package ICal::GLib::Raw::Definitions;

constant ical-glib is export = 'ical-glib',v3;

class ICalArray          is repr<CPointer> does GLib::Roles::Pointers is export { }
class ICalAttach         is repr<CPointer> does GLib::Roles::Pointers is export { }
class ICalCompIter       is repr<CPointer> does GLib::Roles::Pointers is export { }
class ICalDatetimeperiod is repr<CPointer> does GLib::Roles::Pointers is export { }
class ICalGeo            is repr<CPointer> does GLib::Roles::Pointers is export { }
class ICalParameter      is repr<CPointer> does GLib::Roles::Pointers is export { }
class ICalParser         is repr<CPointer> does GLib::Roles::Pointers is export { }
class ICalProperty       is repr<CPointer> does GLib::Roles::Pointers is export { }
class ICalRecurrence     is repr<CPointer> does GLib::Roles::Pointers is export { }
class ICalRecurIterator  is repr<CPointer> does GLib::Roles::Pointers is export { }
class ICalReqstat        is repr<CPointer> does GLib::Roles::Pointers is export { }
class ICalTime           is repr<CPointer> does GLib::Roles::Pointers is export { }
class ICalTimeSpan       is repr<CPointer> does GLib::Roles::Pointers is export { }
class ICalTimezone       is repr<CPointer> does GLib::Roles::Pointers is export { }
class ICalTrigger        is repr<CPointer> does GLib::Roles::Pointers is export { }
class ICalValue          is repr<CPointer> does GLib::Roles::Pointers is export { }

class ICalObject is repr<CStruct> does GLib::Roles::Pointers is export {
  HAS GObject    $.parent;
  has gpointer   $!priv;
}

class ICalComponent is repr<CStruct> does GLib::Roles::Pointers is export {
  HAS ICalObject $.parent;
}

class ICalPeriod is repr<CStruct> does GLib::Roles::Pointers is export {
  HAS ICalObject $.parent;
}

class ICalDuration is repr<CStruct> does GLib::Roles::Pointers is export {
  HAS ICalObject $.parent;
}