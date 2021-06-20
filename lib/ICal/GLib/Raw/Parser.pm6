use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;
use ICal::GLib::Raw::Enums;

unit package ICal::GLib::Raw::Parser;

### /usr/include/libical-glib/i-cal-parser.h

sub i_cal_parser_add_line (ICalParser $parser, Str $str)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_parser_clean (ICalParser $parser)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_parser_free (ICalParser $parser)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parser_get_line (
  ICalParser $parser,
             &func (CArray[uint8], size_t, gpointer --> Str),
  gpointer   $user_data
)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parser_get_state (ICalParser $parser)
  returns ICalParserState
  is native(ical-glib)
  is export
{ * }

sub i_cal_parser_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_parser_new ()
  returns ICalParser
  is native(ical-glib)
  is export
{ * }

sub i_cal_parser_parse (
  ICalParser $parser,
             &func (CArray[uint8], size_t, gpointer --> Str),
  gpointer   $user_data
)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_parser_parse_string (Str $str)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }
