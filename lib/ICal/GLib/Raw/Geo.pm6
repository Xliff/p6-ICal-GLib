use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;

unit package ICal::GLib::Raw::Geo;

### /usr/include/libical-glib/i-cal-geo.h

sub i_cal_geo_clone (ICalGeo $geo)
  returns ICalGeo
  is native(ical-glib)
  is export
{ * }

sub i_cal_geo_get_lat (ICalGeo $geo)
  returns gdouble
  is native(ical-glib)
  is export
{ * }

sub i_cal_geo_get_lon (ICalGeo $geo)
  returns gdouble
  is native(ical-glib)
  is export
{ * }

sub i_cal_geo_get_type ()
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_geo_new (gdouble $lat, gdouble $lon)
  returns ICalGeo
  is native(ical-glib)
  is export
{ * }

sub i_cal_geo_set_lat (ICalGeo $geo, gdouble $lat)
  is native(ical-glib)
  is export
{ * }

sub i_cal_geo_set_lon (ICalGeo $geo, gdouble $lon)
  is native(ical-glib)
  is export
{ * }
