use v6;

use GLib::Raw::Exports;
use ICal::Raw::Exports;
use ICal::GLib::Raw::Exports;

unit package ICal::GLib::Raw::Types;

need GLib::Raw::Debug;
need GLib::Raw::Definitions;
need GLib::Raw::Enums;
need GLib::Raw::Exceptions;
need GLib::Raw::Object;
need GLib::Raw::Structs;
need GLib::Raw::Subs;
need GLib::Raw::Struct_Subs;
need GLib::Roles::Pointers;
need GLib::Roles::Implementor;
need ICal::Raw::Definitions;
need ICal::Raw::Enums;
need ICal::Raw::Structs;
need ICal::GLib::Raw::Definitions;
need ICal::GLib::Raw::Enums;

BEGIN {
  glib-re-export($_) for |@glib-exports,
                         |@ical-exports.grep(
                            * ne <ICal::Raw::Subs ICal::Roles::Pointers>.any
                          ),
                         |@ical-glib-exports;
}
