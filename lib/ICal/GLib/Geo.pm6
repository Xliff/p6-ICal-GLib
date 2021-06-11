use v6.c;

use Method::Also;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Geo;

use ICal::GLib::Object;

our subset ICalGeoAncestry is export of Mu
  where ICalGeo | ICalObjectAncestry;

class ICal::GLib::Geo is ICal::GLib::Object {
  has ICalGeo $!icg;

  submethod BUILD (:$ical-geo) {
    self.setICalGeo($ical-geo) if $ical-geo;
  }

  method setICalGeo(ICalGeoAncestry $_) {
    my $to-parent;

    $!icg = do {
      when ICalGeo {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalGeo, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalGeo
    is also<ICalGeo>
  { $!icg }

  method ICal::Raw::Definitions::icalgeotype
    is also<icalgeotype>
  { cast(icalgeotype, self.get_native) }

  multi method new (icalgeotype $native-ical-geo, :$raw = False) {
    use NativeCall;

    sub icalgeotype_free (icalgeotype $d) {
      free($d.&p);
    }

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      icalgeotype,
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-ical-geo,
      &icalgeotype_free,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalGeoAncestry $ical-geo, :$ref = True) {
    return Nil unless $ical-geo;

    my $o = self.bless( :$ical-geo );
    $o.ref if $ref;
    $o;
  }
  multi method new (Num() $lat, Num() $lon) {
    my gdouble $l = $lon;

    my $geo = i_cal_geo_new($lat, $lon);

    $geo ?? self.bless( :$geo ) !! Nil
  }

  method lat is rw {
    Proxy.new:
      FETCH => -> $     { self.get_lat    },
      STORE => -> $, \v { self.set_lat(v) }
  }

  method lon is rw {
    Proxy.new:
      FETCH => -> $     { self.get_lon    },
      STORE => -> $, \v { self.set_lon(v) }
  }

  method clone ( :$raw = False ) {
    my $g = i_cal_geo_clone($!icg);

    # Transfer: full
    $g ??
      ( $raw ?? $g !! ICal::GLib::Geo.new($g, :!ref) )
      !!
      Nil;
  }

  method get_lat is also<get-lat> {
    i_cal_geo_get_lat($!icg);
  }

  method get_lon is also<get-lon> {
    i_cal_geo_get_lon($!icg);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_geo_get_type, $n, $t );
  }

  method set_lat (Num() $lat) is also<set-lat> {
    my gdouble $l = $lat;

    i_cal_geo_set_lat($!icg, $lat);
  }

  method set_lon (Num() $lon) is also<set-lon> {
    my gdouble $l = $lon;

    i_cal_geo_set_lon($!icg, $lon);
  }

}
