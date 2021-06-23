use v6.c;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::DerivedParameters;

use ICal::GLib::Parameter;

# Redo to emit with get/set's grouped.

class ICal::GLib::DerivedParameters::Master {
  has $!icp;

  method get_actionparam {
    i_cal_parameter_get_actionparam($!icp);
  }

  method get_altrep {
    i_cal_parameter_get_altrep($!icp);
  }

  method get_charset {
    i_cal_parameter_get_charset($!icp);
  }

  method get_cn {
    i_cal_parameter_get_cn($!icp);
  }

  method get_cutype {
    i_cal_parameter_get_cutype($!icp);
  }

  method get_delegatedfrom {
    i_cal_parameter_get_delegatedfrom($!icp);
  }

  method get_delegatedto {
    i_cal_parameter_get_delegatedto($!icp);
  }

  method get_dir {
    i_cal_parameter_get_dir($!icp);
  }

  method get_enable {
    i_cal_parameter_get_enable($!icp);
  }

  method get_encoding {
    i_cal_parameter_get_encoding($!icp);
  }

  method get_fbtype {
    i_cal_parameter_get_fbtype($!icp);
  }

  method get_filename {
    i_cal_parameter_get_filename($!icp);
  }

  method get_fmttype {
    i_cal_parameter_get_fmttype($!icp);
  }

  method get_iana {
    i_cal_parameter_get_iana($!icp);
  }

  method get_id {
    i_cal_parameter_get_id($!icp);
  }

  method get_language {
    i_cal_parameter_get_language($!icp);
  }

  method get_latency {
    i_cal_parameter_get_latency($!icp);
  }

  method get_local {
    i_cal_parameter_get_local($!icp);
  }

  method get_localize {
    i_cal_parameter_get_localize($!icp);
  }

  method get_managedid {
    i_cal_parameter_get_managedid($!icp);
  }

  method get_member {
    i_cal_parameter_get_member($!icp);
  }

  method get_modified {
    i_cal_parameter_get_modified($!icp);
  }

  method get_options {
    i_cal_parameter_get_options($!icp);
  }

  method get_partstat {
    i_cal_parameter_get_partstat($!icp);
  }

  method get_publiccomment {
    i_cal_parameter_get_publiccomment($!icp);
  }

  method get_range {
    i_cal_parameter_get_range($!icp);
  }

  method get_reason {
    i_cal_parameter_get_reason($!icp);
  }

  method get_related {
    i_cal_parameter_get_related($!icp);
  }

  method get_reltype {
    i_cal_parameter_get_reltype($!icp);
  }

  method get_required {
    i_cal_parameter_get_required($!icp);
  }

  method get_response {
    i_cal_parameter_get_response($!icp);
  }

  method get_role {
    i_cal_parameter_get_role($!icp);
  }

  method get_rsvp {
    i_cal_parameter_get_rsvp($!icp);
  }

  method get_scheduleagent {
    i_cal_parameter_get_scheduleagent($!icp);
  }

  method get_scheduleforcesend {
    i_cal_parameter_get_scheduleforcesend($!icp);
  }

  method get_schedulestatus {
    i_cal_parameter_get_schedulestatus($!icp);
  }

  method get_sentby {
    i_cal_parameter_get_sentby($!icp);
  }

  method get_size {
    i_cal_parameter_get_size($!icp);
  }

  method get_stayinformed {
    i_cal_parameter_get_stayinformed($!icp);
  }

  method get_substate {
    i_cal_parameter_get_substate($!icp);
  }

  method get_tzid {
    i_cal_parameter_get_tzid($!icp);
  }

  method get_value {
    i_cal_parameter_get_value($!icp);
  }

  method get_x {
    i_cal_parameter_get_x($!icp);
  }

  method get_xliccomparetype {
    i_cal_parameter_get_xliccomparetype($!icp);
  }

  method get_xlicerrortype {
    i_cal_parameter_get_xlicerrortype($!icp);
  }

  method new_actionparam (ICalParameterAction $v) {
    i_cal_parameter_new_actionparam($!icp, $v);
  }

  method new_altrep (Str $v) {
    i_cal_parameter_new_altrep($!icp, $v);
  }

  method new_charset (Str $v) {
    i_cal_parameter_new_charset($!icp, $v);
  }

  method new_cn (Str $v) {
    i_cal_parameter_new_cn($!icp, $v);
  }

  method new_cutype (ICalParameterCutype $v) {
    i_cal_parameter_new_cutype($!icp, $v);
  }

  method new_delegatedfrom (Str $v) {
    i_cal_parameter_new_delegatedfrom($!icp, $v);
  }

  method new_delegatedto (Str $v) {
    i_cal_parameter_new_delegatedto($!icp, $v);
  }

  method new_dir (Str $v) {
    i_cal_parameter_new_dir($!icp, $v);
  }

  method new_enable (ICalParameterEnable $v) {
    i_cal_parameter_new_enable($!icp, $v);
  }

  method new_encoding (ICalParameterEncoding $v) {
    i_cal_parameter_new_encoding($!icp, $v);
  }

  method new_fbtype (ICalParameterFbtype $v) {
    i_cal_parameter_new_fbtype($!icp, $v);
  }

  method new_filename (Str $v) {
    i_cal_parameter_new_filename($!icp, $v);
  }

  method new_fmttype (Str $v) {
    i_cal_parameter_new_fmttype($!icp, $v);
  }

  method new_iana (Str $v) {
    i_cal_parameter_new_iana($!icp, $v);
  }

  method new_id (Str $v) {
    i_cal_parameter_new_id($!icp, $v);
  }

  method new_language (Str $v) {
    i_cal_parameter_new_language($!icp, $v);
  }

  method new_latency (Str $v) {
    i_cal_parameter_new_latency($!icp, $v);
  }

  method new_local (ICalParameterLocal $v) {
    i_cal_parameter_new_local($!icp, $v);
  }

  method new_localize (Str $v) {
    i_cal_parameter_new_localize($!icp, $v);
  }

  method new_managedid (Str $v) {
    i_cal_parameter_new_managedid($!icp, $v);
  }

  method new_member (Str $v) {
    i_cal_parameter_new_member($!icp, $v);
  }

  method new_modified (Str $v) {
    i_cal_parameter_new_modified($!icp, $v);
  }

  method new_options (Str $v) {
    i_cal_parameter_new_options($!icp, $v);
  }

  method new_partstat (ICalParameterPartstat $v) {
    i_cal_parameter_new_partstat($!icp, $v);
  }

  method new_publiccomment (Str $v) {
    i_cal_parameter_new_publiccomment($!icp, $v);
  }

  method new_range (ICalParameterRange $v) {
    i_cal_parameter_new_range($!icp, $v);
  }

  method new_reason (Str $v) {
    i_cal_parameter_new_reason($!icp, $v);
  }

  method new_related (ICalParameterRelated $v) {
    i_cal_parameter_new_related($!icp, $v);
  }

  method new_reltype (ICalParameterReltype $v) {
    i_cal_parameter_new_reltype($!icp, $v);
  }

  method new_required (ICalParameterRequired $v) {
    i_cal_parameter_new_required($!icp, $v);
  }

  method new_response (gint $v) {
    i_cal_parameter_new_response($!icp, $v);
  }

  method new_role (ICalParameterRole $v) {
    i_cal_parameter_new_role($!icp, $v);
  }

  method new_rsvp (ICalParameterRsvp $v) {
    i_cal_parameter_new_rsvp($!icp, $v);
  }

  method new_scheduleagent (ICalParameterScheduleagent $v) {
    i_cal_parameter_new_scheduleagent($!icp, $v);
  }

  method new_scheduleforcesend (ICalParameterScheduleforcesend $v) {
    i_cal_parameter_new_scheduleforcesend($!icp, $v);
  }

  method new_schedulestatus (Str $v) {
    i_cal_parameter_new_schedulestatus($!icp, $v);
  }

  method new_sentby (Str $v) {
    i_cal_parameter_new_sentby($!icp, $v);
  }

  method new_size (Str $v) {
    i_cal_parameter_new_size($!icp, $v);
  }

  method new_stayinformed (ICalParameterStayinformed $v) {
    i_cal_parameter_new_stayinformed($!icp, $v);
  }

  method new_substate (ICalParameterSubstate $v) {
    i_cal_parameter_new_substate($!icp, $v);
  }

  method new_tzid (Str $v) {
    i_cal_parameter_new_tzid($!icp, $v);
  }

  method new_value (ICalParameterValue $v) {
    i_cal_parameter_new_value($!icp, $v);
  }

  method new_x (Str $v) {
    i_cal_parameter_new_x($!icp, $v);
  }

  method new_xliccomparetype (ICalParameterXliccomparetype $v) {
    i_cal_parameter_new_xliccomparetype($!icp, $v);
  }

  method new_xlicerrortype (ICalParameterXlicerrortype $v) {
    i_cal_parameter_new_xlicerrortype($!icp, $v);
  }

  method set_actionparam (ICalParameterAction $v) {
    i_cal_parameter_set_actionparam($!icp, $v);
  }

  method set_altrep (Str $v) {
    i_cal_parameter_set_altrep($!icp, $v);
  }

  method set_charset (Str $v) {
    i_cal_parameter_set_charset($!icp, $v);
  }

  method set_cn (Str $v) {
    i_cal_parameter_set_cn($!icp, $v);
  }

  method set_cutype (ICalParameterCutype $v) {
    i_cal_parameter_set_cutype($!icp, $v);
  }

  method set_delegatedfrom (Str $v) {
    i_cal_parameter_set_delegatedfrom($!icp, $v);
  }

  method set_delegatedto (Str $v) {
    i_cal_parameter_set_delegatedto($!icp, $v);
  }

  method set_dir (Str $v) {
    i_cal_parameter_set_dir($!icp, $v);
  }

  method set_enable (ICalParameterEnable $v) {
    i_cal_parameter_set_enable($!icp, $v);
  }

  method set_encoding (ICalParameterEncoding $v) {
    i_cal_parameter_set_encoding($!icp, $v);
  }

  method set_fbtype (ICalParameterFbtype $v) {
    i_cal_parameter_set_fbtype($!icp, $v);
  }

  method set_filename (Str $v) {
    i_cal_parameter_set_filename($!icp, $v);
  }

  method set_fmttype (Str $v) {
    i_cal_parameter_set_fmttype($!icp, $v);
  }

  method set_iana (Str $v) {
    i_cal_parameter_set_iana($!icp, $v);
  }

  method set_id (Str $v) {
    i_cal_parameter_set_id($!icp, $v);
  }

  method set_language (Str $v) {
    i_cal_parameter_set_language($!icp, $v);
  }

  method set_latency (Str $v) {
    i_cal_parameter_set_latency($!icp, $v);
  }

  method set_local (ICalParameterLocal $v) {
    i_cal_parameter_set_local($!icp, $v);
  }

  method set_localize (Str $v) {
    i_cal_parameter_set_localize($!icp, $v);
  }

  method set_managedid (Str $v) {
    i_cal_parameter_set_managedid($!icp, $v);
  }

  method set_member (Str $v) {
    i_cal_parameter_set_member($!icp, $v);
  }

  method set_modified (Str $v) {
    i_cal_parameter_set_modified($!icp, $v);
  }

  method set_options (Str $v) {
    i_cal_parameter_set_options($!icp, $v);
  }

  method set_partstat (ICalParameterPartstat $v) {
    i_cal_parameter_set_partstat($!icp, $v);
  }

  method set_publiccomment (Str $v) {
    i_cal_parameter_set_publiccomment($!icp, $v);
  }

  method set_range (ICalParameterRange $v) {
    i_cal_parameter_set_range($!icp, $v);
  }

  method set_reason (Str $v) {
    i_cal_parameter_set_reason($!icp, $v);
  }

  method set_related (ICalParameterRelated $v) {
    i_cal_parameter_set_related($!icp, $v);
  }

  method set_reltype (ICalParameterReltype $v) {
    i_cal_parameter_set_reltype($!icp, $v);
  }

  method set_required (ICalParameterRequired $v) {
    i_cal_parameter_set_required($!icp, $v);
  }

  method set_response (gint $v) {
    i_cal_parameter_set_response($!icp, $v);
  }

  method set_role (ICalParameterRole $v) {
    i_cal_parameter_set_role($!icp, $v);
  }

  method set_rsvp (ICalParameterRsvp $v) {
    i_cal_parameter_set_rsvp($!icp, $v);
  }

  method set_scheduleagent (ICalParameterScheduleagent $v) {
    i_cal_parameter_set_scheduleagent($!icp, $v);
  }

  method set_scheduleforcesend (ICalParameterScheduleforcesend $v) {
    i_cal_parameter_set_scheduleforcesend($!icp, $v);
  }

  method set_schedulestatus (Str $v) {
    i_cal_parameter_set_schedulestatus($!icp, $v);
  }

  method set_sentby (Str $v) {
    i_cal_parameter_set_sentby($!icp, $v);
  }

  method set_size (Str $v) {
    i_cal_parameter_set_size($!icp, $v);
  }

  method set_stayinformed (ICalParameterStayinformed $v) {
    i_cal_parameter_set_stayinformed($!icp, $v);
  }

  method set_substate (ICalParameterSubstate $v) {
    i_cal_parameter_set_substate($!icp, $v);
  }

  method set_tzid (Str $v) {
    i_cal_parameter_set_tzid($!icp, $v);
  }

  method set_value (ICalParameterValue $v) {
    i_cal_parameter_set_value($!icp, $v);
  }

  method set_x (Str $v) {
    i_cal_parameter_set_x($!icp, $v);
  }

  method set_xliccomparetype (ICalParameterXliccomparetype $v) {
    i_cal_parameter_set_xliccomparetype($!icp, $v);
  }

  method set_xlicerrortype (ICalParameterXlicerrortype $v) {
    i_cal_parameter_set_xlicerrortype($!icp, $v);
  }

}

class ICal::GLib::DerivedParameter::actionparam is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_actionparam)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method actionparam is rw {
    Proxy.new:
      FETCH => $     { self.get_actionparam    },
      STORE => $, \v { self.set_actionparam(v) };
  }

  method get_actionparam {
    i_cal_parameter_get_actionparam(self.ICalParameter);
  }

  method set_actionparam (uint32 $v) {
    i_cal_parameter_set_actionparam(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::altrep is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_altrep)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method altrep is rw {
    Proxy.new:
      FETCH => $     { self.get_altrep    },
      STORE => $, \v { self.set_altrep(v) };
  }

  method get_altrep {
    i_cal_parameter_get_altrep(self.ICalParameter);
  }

  method set_altrep (Str $v) {
    i_cal_parameter_set_altrep(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::charset is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_charset)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method charset is rw {
    Proxy.new:
      FETCH => $     { self.get_charset    },
      STORE => $, \v { self.set_charset(v) };
  }

  method get_charset {
    i_cal_parameter_get_charset(self.ICalParameter);
  }

  method set_charset (Str $v) {
    i_cal_parameter_set_charset(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::cn is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_cn)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method cn is rw {
    Proxy.new:
      FETCH => $     { self.get_cn    },
      STORE => $, \v { self.set_cn(v) };
  }

  method get_cn {
    i_cal_parameter_get_cn(self.ICalParameter);
  }

  method set_cn (Str $v) {
    i_cal_parameter_set_cn(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::cutype is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_cutype)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method cutype is rw {
    Proxy.new:
      FETCH => $     { self.get_cutype    },
      STORE => $, \v { self.set_cutype(v) };
  }

  method get_cutype {
    i_cal_parameter_get_cutype(self.ICalParameter);
  }

  method set_cutype (uint32 $v) {
    i_cal_parameter_set_cutype(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::delegatedfrom is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_delegatedfrom)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method delegatedfrom is rw {
    Proxy.new:
      FETCH => $     { self.get_delegatedfrom    },
      STORE => $, \v { self.set_delegatedfrom(v) };
  }

  method get_delegatedfrom {
    i_cal_parameter_get_delegatedfrom(self.ICalParameter);
  }

  method set_delegatedfrom (Str $v) {
    i_cal_parameter_set_delegatedfrom(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::delegatedto is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_delegatedto)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method delegatedto is rw {
    Proxy.new:
      FETCH => $     { self.get_delegatedto    },
      STORE => $, \v { self.set_delegatedto(v) };
  }

  method get_delegatedto {
    i_cal_parameter_get_delegatedto(self.ICalParameter);
  }

  method set_delegatedto (Str $v) {
    i_cal_parameter_set_delegatedto(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::dir is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_dir)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method dir is rw {
    Proxy.new:
      FETCH => $     { self.get_dir    },
      STORE => $, \v { self.set_dir(v) };
  }

  method get_dir {
    i_cal_parameter_get_dir(self.ICalParameter);
  }

  method set_dir (Str $v) {
    i_cal_parameter_set_dir(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::enable is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_enable)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method enable is rw {
    Proxy.new:
      FETCH => $     { self.get_enable    },
      STORE => $, \v { self.set_enable(v) };
  }

  method get_enable {
    i_cal_parameter_get_enable(self.ICalParameter);
  }

  method set_enable (uint32 $v) {
    i_cal_parameter_set_enable(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::encoding is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_encoding)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method encoding is rw {
    Proxy.new:
      FETCH => $     { self.get_encoding    },
      STORE => $, \v { self.set_encoding(v) };
  }

  method get_encoding {
    i_cal_parameter_get_encoding(self.ICalParameter);
  }

  method set_encoding (uint32 $v) {
    i_cal_parameter_set_encoding(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::fbtype is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_fbtype)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method fbtype is rw {
    Proxy.new:
      FETCH => $     { self.get_fbtype    },
      STORE => $, \v { self.set_fbtype(v) };
  }

  method get_fbtype {
    i_cal_parameter_get_fbtype(self.ICalParameter);
  }

  method set_fbtype (uint32 $v) {
    i_cal_parameter_set_fbtype(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::filename is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_filename)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method filename is rw {
    Proxy.new:
      FETCH => $     { self.get_filename    },
      STORE => $, \v { self.set_filename(v) };
  }

  method get_filename {
    i_cal_parameter_get_filename(self.ICalParameter);
  }

  method set_filename (Str $v) {
    i_cal_parameter_set_filename(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::fmttype is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_fmttype)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method fmttype is rw {
    Proxy.new:
      FETCH => $     { self.get_fmttype    },
      STORE => $, \v { self.set_fmttype(v) };
  }

  method get_fmttype {
    i_cal_parameter_get_fmttype(self.ICalParameter);
  }

  method set_fmttype (Str $v) {
    i_cal_parameter_set_fmttype(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::iana is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_iana)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method iana is rw {
    Proxy.new:
      FETCH => $     { self.get_iana    },
      STORE => $, \v { self.set_iana(v) };
  }

  method get_iana {
    i_cal_parameter_get_iana(self.ICalParameter);
  }

  method set_iana (Str $v) {
    i_cal_parameter_set_iana(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::id is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_id)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method id is rw {
    Proxy.new:
      FETCH => $     { self.get_id    },
      STORE => $, \v { self.set_id(v) };
  }

  method get_id {
    i_cal_parameter_get_id(self.ICalParameter);
  }

  method set_id (Str $v) {
    i_cal_parameter_set_id(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::language is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_language)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method language is rw {
    Proxy.new:
      FETCH => $     { self.get_language    },
      STORE => $, \v { self.set_language(v) };
  }

  method get_language {
    i_cal_parameter_get_language(self.ICalParameter);
  }

  method set_language (Str $v) {
    i_cal_parameter_set_language(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::latency is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_latency)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method latency is rw {
    Proxy.new:
      FETCH => $     { self.get_latency    },
      STORE => $, \v { self.set_latency(v) };
  }

  method get_latency {
    i_cal_parameter_get_latency(self.ICalParameter);
  }

  method set_latency (Str $v) {
    i_cal_parameter_set_latency(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::local is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_local)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method local is rw {
    Proxy.new:
      FETCH => $     { self.get_local    },
      STORE => $, \v { self.set_local(v) };
  }

  method get_local {
    i_cal_parameter_get_local(self.ICalParameter);
  }

  method set_local (uint32 $v) {
    i_cal_parameter_set_local(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::localize is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_localize)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method localize is rw {
    Proxy.new:
      FETCH => $     { self.get_localize    },
      STORE => $, \v { self.set_localize(v) };
  }

  method get_localize {
    i_cal_parameter_get_localize(self.ICalParameter);
  }

  method set_localize (Str $v) {
    i_cal_parameter_set_localize(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::managedid is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_managedid)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method managedid is rw {
    Proxy.new:
      FETCH => $     { self.get_managedid    },
      STORE => $, \v { self.set_managedid(v) };
  }

  method get_managedid {
    i_cal_parameter_get_managedid(self.ICalParameter);
  }

  method set_managedid (Str $v) {
    i_cal_parameter_set_managedid(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::member is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_member)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method member is rw {
    Proxy.new:
      FETCH => $     { self.get_member    },
      STORE => $, \v { self.set_member(v) };
  }

  method get_member {
    i_cal_parameter_get_member(self.ICalParameter);
  }

  method set_member (Str $v) {
    i_cal_parameter_set_member(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::modified is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_modified)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method modified is rw {
    Proxy.new:
      FETCH => $     { self.get_modified    },
      STORE => $, \v { self.set_modified(v) };
  }

  method get_modified {
    i_cal_parameter_get_modified(self.ICalParameter);
  }

  method set_modified (Str $v) {
    i_cal_parameter_set_modified(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::options is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_options)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method options is rw {
    Proxy.new:
      FETCH => $     { self.get_options    },
      STORE => $, \v { self.set_options(v) };
  }

  method get_options {
    i_cal_parameter_get_options(self.ICalParameter);
  }

  method set_options (Str $v) {
    i_cal_parameter_set_options(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::partstat is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_partstat)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method partstat is rw {
    Proxy.new:
      FETCH => $     { self.get_partstat    },
      STORE => $, \v { self.set_partstat(v) };
  }

  method get_partstat {
    i_cal_parameter_get_partstat(self.ICalParameter);
  }

  method set_partstat (uint32 $v) {
    i_cal_parameter_set_partstat(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::publiccomment is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_publiccomment)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method publiccomment is rw {
    Proxy.new:
      FETCH => $     { self.get_publiccomment    },
      STORE => $, \v { self.set_publiccomment(v) };
  }

  method get_publiccomment {
    i_cal_parameter_get_publiccomment(self.ICalParameter);
  }

  method set_publiccomment (Str $v) {
    i_cal_parameter_set_publiccomment(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::range is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_range)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method range is rw {
    Proxy.new:
      FETCH => $     { self.get_range    },
      STORE => $, \v { self.set_range(v) };
  }

  method get_range {
    i_cal_parameter_get_range(self.ICalParameter);
  }

  method set_range (uint32 $v) {
    i_cal_parameter_set_range(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::reason is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_reason)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method reason is rw {
    Proxy.new:
      FETCH => $     { self.get_reason    },
      STORE => $, \v { self.set_reason(v) };
  }

  method get_reason {
    i_cal_parameter_get_reason(self.ICalParameter);
  }

  method set_reason (Str $v) {
    i_cal_parameter_set_reason(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::related is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_related)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method related is rw {
    Proxy.new:
      FETCH => $     { self.get_related    },
      STORE => $, \v { self.set_related(v) };
  }

  method get_related {
    i_cal_parameter_get_related(self.ICalParameter);
  }

  method set_related (uint32 $v) {
    i_cal_parameter_set_related(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::reltype is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_reltype)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method reltype is rw {
    Proxy.new:
      FETCH => $     { self.get_reltype    },
      STORE => $, \v { self.set_reltype(v) };
  }

  method get_reltype {
    i_cal_parameter_get_reltype(self.ICalParameter);
  }

  method set_reltype (uint32 $v) {
    i_cal_parameter_set_reltype(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::required is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_required)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method required is rw {
    Proxy.new:
      FETCH => $     { self.get_required    },
      STORE => $, \v { self.set_required(v) };
  }

  method get_required {
    i_cal_parameter_get_required(self.ICalParameter);
  }

  method set_required (uint32 $v) {
    i_cal_parameter_set_required(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::response is ICal::GLib::Parameter {
  method new (int32 $v) {
    my $ical-parameter = i_cal_parameter_new_response)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method response is rw {
    Proxy.new:
      FETCH => $     { self.get_response    },
      STORE => $, \v { self.set_response(v) };
  }

  method get_response {
    i_cal_parameter_get_response(self.ICalParameter);
  }

  method set_response (int32 $v) {
    i_cal_parameter_set_response(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::role is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_role)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method role is rw {
    Proxy.new:
      FETCH => $     { self.get_role    },
      STORE => $, \v { self.set_role(v) };
  }

  method get_role {
    i_cal_parameter_get_role(self.ICalParameter);
  }

  method set_role (uint32 $v) {
    i_cal_parameter_set_role(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::rsvp is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_rsvp)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method rsvp is rw {
    Proxy.new:
      FETCH => $     { self.get_rsvp    },
      STORE => $, \v { self.set_rsvp(v) };
  }

  method get_rsvp {
    i_cal_parameter_get_rsvp(self.ICalParameter);
  }

  method set_rsvp (uint32 $v) {
    i_cal_parameter_set_rsvp(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::scheduleagent is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_scheduleagent)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method scheduleagent is rw {
    Proxy.new:
      FETCH => $     { self.get_scheduleagent    },
      STORE => $, \v { self.set_scheduleagent(v) };
  }

  method get_scheduleagent {
    i_cal_parameter_get_scheduleagent(self.ICalParameter);
  }

  method set_scheduleagent (uint32 $v) {
    i_cal_parameter_set_scheduleagent(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::scheduleforcesend is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_scheduleforcesend)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method scheduleforcesend is rw {
    Proxy.new:
      FETCH => $     { self.get_scheduleforcesend    },
      STORE => $, \v { self.set_scheduleforcesend(v) };
  }

  method get_scheduleforcesend {
    i_cal_parameter_get_scheduleforcesend(self.ICalParameter);
  }

  method set_scheduleforcesend (uint32 $v) {
    i_cal_parameter_set_scheduleforcesend(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::schedulestatus is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_schedulestatus)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method schedulestatus is rw {
    Proxy.new:
      FETCH => $     { self.get_schedulestatus    },
      STORE => $, \v { self.set_schedulestatus(v) };
  }

  method get_schedulestatus {
    i_cal_parameter_get_schedulestatus(self.ICalParameter);
  }

  method set_schedulestatus (Str $v) {
    i_cal_parameter_set_schedulestatus(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::sentby is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_sentby)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method sentby is rw {
    Proxy.new:
      FETCH => $     { self.get_sentby    },
      STORE => $, \v { self.set_sentby(v) };
  }

  method get_sentby {
    i_cal_parameter_get_sentby(self.ICalParameter);
  }

  method set_sentby (Str $v) {
    i_cal_parameter_set_sentby(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::size is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_size)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method size is rw {
    Proxy.new:
      FETCH => $     { self.get_size    },
      STORE => $, \v { self.set_size(v) };
  }

  method get_size {
    i_cal_parameter_get_size(self.ICalParameter);
  }

  method set_size (Str $v) {
    i_cal_parameter_set_size(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::stayinformed is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_stayinformed)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method stayinformed is rw {
    Proxy.new:
      FETCH => $     { self.get_stayinformed    },
      STORE => $, \v { self.set_stayinformed(v) };
  }

  method get_stayinformed {
    i_cal_parameter_get_stayinformed(self.ICalParameter);
  }

  method set_stayinformed (uint32 $v) {
    i_cal_parameter_set_stayinformed(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::substate is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_substate)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method substate is rw {
    Proxy.new:
      FETCH => $     { self.get_substate    },
      STORE => $, \v { self.set_substate(v) };
  }

  method get_substate {
    i_cal_parameter_get_substate(self.ICalParameter);
  }

  method set_substate (uint32 $v) {
    i_cal_parameter_set_substate(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::tzid is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_tzid)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method tzid is rw {
    Proxy.new:
      FETCH => $     { self.get_tzid    },
      STORE => $, \v { self.set_tzid(v) };
  }

  method get_tzid {
    i_cal_parameter_get_tzid(self.ICalParameter);
  }

  method set_tzid (Str $v) {
    i_cal_parameter_set_tzid(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::value is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_value)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method value is rw {
    Proxy.new:
      FETCH => $     { self.get_value    },
      STORE => $, \v { self.set_value(v) };
  }

  method get_value {
    i_cal_parameter_get_value(self.ICalParameter);
  }

  method set_value (uint32 $v) {
    i_cal_parameter_set_value(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::x is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_x)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method x is rw {
    Proxy.new:
      FETCH => $     { self.get_x    },
      STORE => $, \v { self.set_x(v) };
  }

  method get_x {
    i_cal_parameter_get_x(self.ICalParameter);
  }

  method set_x (Str $v) {
    i_cal_parameter_set_x(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::xliccomparetype is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_xliccomparetype)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method xliccomparetype is rw {
    Proxy.new:
      FETCH => $     { self.get_xliccomparetype    },
      STORE => $, \v { self.set_xliccomparetype(v) };
  }

  method get_xliccomparetype {
    i_cal_parameter_get_xliccomparetype(self.ICalParameter);
  }

  method set_xliccomparetype (uint32 $v) {
    i_cal_parameter_set_xliccomparetype(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::xlicerrortype is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_xlicerrortype)($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method xlicerrortype is rw {
    Proxy.new:
      FETCH => $     { self.get_xlicerrortype    },
      STORE => $, \v { self.set_xlicerrortype(v) };
  }

  method get_xlicerrortype {
    i_cal_parameter_get_xlicerrortype(self.ICalParameter);
  }

  method set_xlicerrortype (uint32 $v) {
    i_cal_parameter_set_xlicerrortype(self.ICalParameter, $v);
  }
}
