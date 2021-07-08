use v6.c;

use Method::Also;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Reqstat;

use ICal::GLib::Object;

our subset ICalReqstatAncestry is export of Mu
  where ICalReqstat | ICalObjectAncestry;

class ICal::GLib::ReqStat is ICal::GLib::Object {
  has ICalReqstat $!icr;

  submethod BUILD (:$reqstat) {
    self.setICalReqstat($reqstat) if $reqstat;
  }

  method setICalReqstat(ICalReqstatAncestry $_) {
    my $to-parent;

    $!icr = do {
      when ICalReqstat {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalReqstat, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalReqstat
    is also<ICalReqstat>
  { $!icr }

  method ICal::Raw::Definitions::icalreqstattype
    is also<icalreqstattype>
  { cast(icalreqstattype, self.get_native) }

  multi method new (icalreqstattype $native-reqstat, :$raw = False) {
    use NativeCall;

    sub icalreqstattype_free (icalreqstattype $d) {
      free($d.&p)
    }

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      icalreqstattype,
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-reqstat,
      &icalreqstattype_free,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalReqstatAncestry $reqstat, :$ref = True) {
    return Nil unless $reqstat;

    my $o = self.bless( :$reqstat );
    $o.ref if $ref;
    $o;
  }

  method new_from_string (Str() $str) is also<new-from-string> {
    my $reqstat = i_cal_reqstat_new_from_string($!icr, $str);

    $reqstat ?? self.bless( :$reqstat ) !! Nil;
  }

  method code is rw {
    Proxy.new:
      FETCH => -> $     { self.get_code    },
      STORE => -> $, \v { self.set_code(v) }
  }

  method get_code is also<get-code> {
    ICalRequestStatusEnum( i_cal_reqstat_get_code($!icr) );
  }

  method get_debug
    is also<
      get-debug
      debug
    >
  {
    i_cal_reqstat_get_debug($!icr);
  }

  method get_desc
    is also<
      get-desc
      desc
    >
  {
    i_cal_reqstat_get_desc($!icr);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_reqstat_get_type, $n, $t );
  }

  method set_code (ICalRequestStatus $code) is also<set-code> {
    my ICalRequestStatus $c = $code;

    i_cal_reqstat_set_code($!icr, $c);
  }

  method to_string
    is also<
      to-string
      Str
    >
  {
    i_cal_reqstat_to_string($!icr);
  }

}
