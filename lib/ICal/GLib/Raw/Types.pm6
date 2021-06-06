use v6;

use GLib::Raw::Exports;
use ICal::GLib::Raw::Exports;

unit package GLib::Raw::Types;

need GLib::Raw::Definitions;
need GLib::Raw::Enums;
need GLib::Raw::Exceptions;
need GLib::Raw::Object;
need GLib::Raw::Structs;
need GLib::Raw::Subs;
need GLib::Raw::Struct_Subs;
need GLib::Roles::Pointers;
need ICal::GLib::Raw::Definitions;
need ICal::GLib::Raw::Enums;

BEGIN {
  glib-re-export($_) for |@glib-exports,
                         |@ical-glib-exports;
}
