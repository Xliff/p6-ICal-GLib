use v6.c;

unit package ICal::GLib::Raw::Exports;

our @ical-glib-exports is export;

BEGIN {
  @ical-glib-exports = <
    ICal::GLib::Raw::Definitions;
    ICal::GLib::Raw::Enums;
  >;
}
