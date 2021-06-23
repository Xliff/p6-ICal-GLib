use v6.c;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::DerivedParameters;

use ICal::GLib::Parameter;

class ICal::GLib::DerivedParameter::ActionParam is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_actionparam($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method actionparam is rw {
    Proxy.new:
      FETCH => -> $     { self.get_actionparam    },
      STORE => -> $, \v { self.set_actionparam(v) };
  }

  method get_actionparam {
    ICalParameterActionEnum(
      i_cal_parameter_get_actionparam(self.ICalParameter)
    );
  }

  method set_actionparam (uint32 $v) {
    i_cal_parameter_set_actionparam(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::AltRep is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_altrep($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method altrep is rw {
    Proxy.new:
      FETCH => -> $     { self.get_altrep    },
      STORE => -> $, \v { self.set_altrep(v) };
  }

  method get_altrep {
    i_cal_parameter_get_altrep(self.ICalParameter);
  }

  method set_altrep (Str $v) {
    i_cal_parameter_set_altrep(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::CharSet is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_charset($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method charset is rw {
    Proxy.new:
      FETCH => -> $     { self.get_charset    },
      STORE => -> $, \v { self.set_charset(v) };
  }

  method get_charset {
    i_cal_parameter_get_charset(self.ICalParameter);
  }

  method set_charset (Str $v) {
    i_cal_parameter_set_charset(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::CN is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_cn($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method cn is rw {
    Proxy.new:
      FETCH => -> $     { self.get_cn    },
      STORE => -> $, \v { self.set_cn(v) };
  }

  method get_cn {
    i_cal_parameter_get_cn(self.ICalParameter);
  }

  method set_cn (Str $v) {
    i_cal_parameter_set_cn(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::CUType is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_cutype($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method cutype is rw {
    Proxy.new:
      FETCH => -> $     { self.get_cutype    },
      STORE => -> $, \v { self.set_cutype(v) };
  }

  method get_cutype {
    i_cal_parameter_get_cutype(self.ICalParameter);
  }

  method set_cutype (uint32 $v) {
    i_cal_parameter_set_cutype(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::DelegatedFrom is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_delegatedfrom($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method delegatedfrom is rw {
    Proxy.new:
      FETCH => -> $     { self.get_delegatedfrom    },
      STORE => -> $, \v { self.set_delegatedfrom(v) };
  }

  method get_delegatedfrom {
    i_cal_parameter_get_delegatedfrom(self.ICalParameter);
  }

  method set_delegatedfrom (Str $v) {
    i_cal_parameter_set_delegatedfrom(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::DelegatedTo is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_delegatedto($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method delegatedto is rw {
    Proxy.new:
      FETCH => -> $     { self.get_delegatedto    },
      STORE => -> $, \v { self.set_delegatedto(v) };
  }

  method get_delegatedto {
    i_cal_parameter_get_delegatedto(self.ICalParameter);
  }

  method set_delegatedto (Str $v) {
    i_cal_parameter_set_delegatedto(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Dir is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_dir($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method dir is rw {
    Proxy.new:
      FETCH => -> $     { self.get_dir    },
      STORE => -> $, \v { self.set_dir(v) };
  }

  method get_dir {
    i_cal_parameter_get_dir(self.ICalParameter);
  }

  method set_dir (Str $v) {
    i_cal_parameter_set_dir(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Enable is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_enable($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method enable is rw {
    Proxy.new:
      FETCH => -> $     { self.get_enable    },
      STORE => -> $, \v { self.set_enable(v) };
  }

  method get_enable {
    i_cal_parameter_get_enable(self.ICalParameter);
  }

  method set_enable (uint32 $v) {
    i_cal_parameter_set_enable(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Encoding is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_encoding($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method encoding is rw {
    Proxy.new:
      FETCH => -> $     { self.get_encoding    },
      STORE => -> $, \v { self.set_encoding(v) };
  }

  method get_encoding {
    i_cal_parameter_get_encoding(self.ICalParameter);
  }

  method set_encoding (uint32 $v) {
    i_cal_parameter_set_encoding(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::FBType is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_fbtype($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method fbtype is rw {
    Proxy.new:
      FETCH => -> $     { self.get_fbtype    },
      STORE => -> $, \v { self.set_fbtype(v) };
  }

  method get_fbtype {
    i_cal_parameter_get_fbtype(self.ICalParameter);
  }

  method set_fbtype (uint32 $v) {
    i_cal_parameter_set_fbtype(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Filename is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_filename($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method filename is rw {
    Proxy.new:
      FETCH => -> $     { self.get_filename    },
      STORE => -> $, \v { self.set_filename(v) };
  }

  method get_filename {
    i_cal_parameter_get_filename(self.ICalParameter);
  }

  method set_filename (Str $v) {
    i_cal_parameter_set_filename(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::FmtType is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_fmttype($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method fmttype is rw {
    Proxy.new:
      FETCH => -> $     { self.get_fmttype    },
      STORE => -> $, \v { self.set_fmttype(v) };
  }

  method get_fmttype {
    i_cal_parameter_get_fmttype(self.ICalParameter);
  }

  method set_fmttype (Str $v) {
    i_cal_parameter_set_fmttype(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Iana is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_iana($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method iana is rw {
    Proxy.new:
      FETCH => -> $     { self.get_iana    },
      STORE => -> $, \v { self.set_iana(v) };
  }

  method get_iana {
    i_cal_parameter_get_iana(self.ICalParameter);
  }

  method set_iana (Str $v) {
    i_cal_parameter_set_iana(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::ID is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_id($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method id is rw {
    Proxy.new:
      FETCH => -> $     { self.get_id    },
      STORE => -> $, \v { self.set_id(v) };
  }

  method get_id {
    i_cal_parameter_get_id(self.ICalParameter);
  }

  method set_id (Str $v) {
    i_cal_parameter_set_id(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Language is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_language($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method language is rw {
    Proxy.new:
      FETCH => -> $     { self.get_language    },
      STORE => -> $, \v { self.set_language(v) };
  }

  method get_language {
    i_cal_parameter_get_language(self.ICalParameter);
  }

  method set_language (Str $v) {
    i_cal_parameter_set_language(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Latency is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_latency($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method latency is rw {
    Proxy.new:
      FETCH => -> $     { self.get_latency    },
      STORE => -> $, \v { self.set_latency(v) };
  }

  method get_latency {
    i_cal_parameter_get_latency(self.ICalParameter);
  }

  method set_latency (Str $v) {
    i_cal_parameter_set_latency(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Local is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_local($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method local is rw {
    Proxy.new:
      FETCH => -> $     { self.get_local    },
      STORE => -> $, \v { self.set_local(v) };
  }

  method get_local {
    i_cal_parameter_get_local(self.ICalParameter);
  }

  method set_local (uint32 $v) {
    i_cal_parameter_set_local(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Localize is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_localize($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method localize is rw {
    Proxy.new:
      FETCH => -> $     { self.get_localize    },
      STORE => -> $, \v { self.set_localize(v) };
  }

  method get_localize {
    i_cal_parameter_get_localize(self.ICalParameter);
  }

  method set_localize (Str $v) {
    i_cal_parameter_set_localize(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::ManagedID is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_managedid($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method managedid is rw {
    Proxy.new:
      FETCH => -> $     { self.get_managedid    },
      STORE => -> $, \v { self.set_managedid(v) };
  }

  method get_managedid {
    i_cal_parameter_get_managedid(self.ICalParameter);
  }

  method set_managedid (Str $v) {
    i_cal_parameter_set_managedid(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Member is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_member($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method member is rw {
    Proxy.new:
      FETCH => -> $     { self.get_member    },
      STORE => -> $, \v { self.set_member(v) };
  }

  method get_member {
    i_cal_parameter_get_member(self.ICalParameter);
  }

  method set_member (Str $v) {
    i_cal_parameter_set_member(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Modified is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_modified($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method modified is rw {
    Proxy.new:
      FETCH => -> $     { self.get_modified    },
      STORE => -> $, \v { self.set_modified(v) };
  }

  method get_modified {
    i_cal_parameter_get_modified(self.ICalParameter);
  }

  method set_modified (Str $v) {
    i_cal_parameter_set_modified(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Options is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_options($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method options is rw {
    Proxy.new:
      FETCH => -> $     { self.get_options    },
      STORE => -> $, \v { self.set_options(v) };
  }

  method get_options {
    i_cal_parameter_get_options(self.ICalParameter);
  }

  method set_options (Str $v) {
    i_cal_parameter_set_options(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::PartStat is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_partstat($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method partstat is rw {
    Proxy.new:
      FETCH => -> $     { self.get_partstat    },
      STORE => -> $, \v { self.set_partstat(v) };
  }

  method get_partstat {
    i_cal_parameter_get_partstat(self.ICalParameter);
  }

  method set_partstat (uint32 $v) {
    i_cal_parameter_set_partstat(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::PublicComment is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_publiccomment($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method publiccomment is rw {
    Proxy.new:
      FETCH => -> $     { self.get_publiccomment    },
      STORE => -> $, \v { self.set_publiccomment(v) };
  }

  method get_publiccomment {
    i_cal_parameter_get_publiccomment(self.ICalParameter);
  }

  method set_publiccomment (Str $v) {
    i_cal_parameter_set_publiccomment(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Range is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_range($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method range is rw {
    Proxy.new:
      FETCH => -> $     { self.get_range    },
      STORE => -> $, \v { self.set_range(v) };
  }

  method get_range {
    i_cal_parameter_get_range(self.ICalParameter);
  }

  method set_range (uint32 $v) {
    i_cal_parameter_set_range(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Reason is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_reason($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method reason is rw {
    Proxy.new:
      FETCH => -> $     { self.get_reason    },
      STORE => -> $, \v { self.set_reason(v) };
  }

  method get_reason {
    i_cal_parameter_get_reason(self.ICalParameter);
  }

  method set_reason (Str $v) {
    i_cal_parameter_set_reason(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Related is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_related($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method related is rw {
    Proxy.new:
      FETCH => -> $     { self.get_related    },
      STORE => -> $, \v { self.set_related(v) };
  }

  method get_related {
    i_cal_parameter_get_related(self.ICalParameter);
  }

  method set_related (uint32 $v) {
    i_cal_parameter_set_related(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::RelType is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_reltype($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method reltype is rw {
    Proxy.new:
      FETCH => -> $     { self.get_reltype    },
      STORE => -> $, \v { self.set_reltype(v) };
  }

  method get_reltype {
    i_cal_parameter_get_reltype(self.ICalParameter);
  }

  method set_reltype (uint32 $v) {
    i_cal_parameter_set_reltype(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Required is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_required($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method required is rw {
    Proxy.new:
      FETCH => -> $     { self.get_required    },
      STORE => -> $, \v { self.set_required(v) };
  }

  method get_required {
    i_cal_parameter_get_required(self.ICalParameter);
  }

  method set_required (uint32 $v) {
    i_cal_parameter_set_required(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Response is ICal::GLib::Parameter {
  method new (int32 $v) {
    my $ical-parameter = i_cal_parameter_new_response($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method response is rw {
    Proxy.new:
      FETCH => -> $     { self.get_response    },
      STORE => -> $, \v { self.set_response(v) };
  }

  method get_response {
    i_cal_parameter_get_response(self.ICalParameter);
  }

  method set_response (int32 $v) {
    i_cal_parameter_set_response(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Role is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_role($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method role is rw {
    Proxy.new:
      FETCH => -> $     { self.get_role    },
      STORE => -> $, \v { self.set_role(v) };
  }

  method get_role {
    i_cal_parameter_get_role(self.ICalParameter);
  }

  method set_role (uint32 $v) {
    i_cal_parameter_set_role(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::RSVP is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_rsvp($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method rsvp is rw {
    Proxy.new:
      FETCH => -> $     { self.get_rsvp    },
      STORE => -> $, \v { self.set_rsvp(v) };
  }

  method get_rsvp {
    i_cal_parameter_get_rsvp(self.ICalParameter);
  }

  method set_rsvp (uint32 $v) {
    i_cal_parameter_set_rsvp(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::ScheduleAgent is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_scheduleagent($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method scheduleagent is rw {
    Proxy.new:
      FETCH => -> $     { self.get_scheduleagent    },
      STORE => -> $, \v { self.set_scheduleagent(v) };
  }

  method get_scheduleagent {
    i_cal_parameter_get_scheduleagent(self.ICalParameter);
  }

  method set_scheduleagent (uint32 $v) {
    i_cal_parameter_set_scheduleagent(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::ScheduleForceSend is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_scheduleforcesend($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method scheduleforcesend is rw {
    Proxy.new:
      FETCH => -> $     { self.get_scheduleforcesend    },
      STORE => -> $, \v { self.set_scheduleforcesend(v) };
  }

  method get_scheduleforcesend {
    i_cal_parameter_get_scheduleforcesend(self.ICalParameter);
  }

  method set_scheduleforcesend (uint32 $v) {
    i_cal_parameter_set_scheduleforcesend(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::ScheduleStatus is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_schedulestatus($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method schedulestatus is rw {
    Proxy.new:
      FETCH => -> $     { self.get_schedulestatus    },
      STORE => -> $, \v { self.set_schedulestatus(v) };
  }

  method get_schedulestatus {
    i_cal_parameter_get_schedulestatus(self.ICalParameter);
  }

  method set_schedulestatus (Str $v) {
    i_cal_parameter_set_schedulestatus(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::SentBy is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_sentby($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method sentby is rw {
    Proxy.new:
      FETCH => -> $     { self.get_sentby    },
      STORE => -> $, \v { self.set_sentby(v) };
  }

  method get_sentby {
    i_cal_parameter_get_sentby(self.ICalParameter);
  }

  method set_sentby (Str $v) {
    i_cal_parameter_set_sentby(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Size is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_size($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method size is rw {
    Proxy.new:
      FETCH => -> $     { self.get_size    },
      STORE => -> $, \v { self.set_size(v) };
  }

  method get_size {
    i_cal_parameter_get_size(self.ICalParameter);
  }

  method set_size (Str $v) {
    i_cal_parameter_set_size(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::StayInformed is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_stayinformed($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method stayinformed is rw {
    Proxy.new:
      FETCH => -> $     { self.get_stayinformed    },
      STORE => -> $, \v { self.set_stayinformed(v) };
  }

  method get_stayinformed {
    i_cal_parameter_get_stayinformed(self.ICalParameter);
  }

  method set_stayinformed (uint32 $v) {
    i_cal_parameter_set_stayinformed(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::SubState is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_substate($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method substate is rw {
    Proxy.new:
      FETCH => -> $     { self.get_substate    },
      STORE => -> $, \v { self.set_substate(v) };
  }

  method get_substate {
    i_cal_parameter_get_substate(self.ICalParameter);
  }

  method set_substate (uint32 $v) {
    i_cal_parameter_set_substate(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::TZID is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_tzid($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method tzid is rw {
    Proxy.new:
      FETCH => -> $     { self.get_tzid    },
      STORE => -> $, \v { self.set_tzid(v) };
  }

  method get_tzid {
    i_cal_parameter_get_tzid(self.ICalParameter);
  }

  method set_tzid (Str $v) {
    i_cal_parameter_set_tzid(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::Value is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_value($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method value is rw {
    Proxy.new:
      FETCH => -> $     { self.get_value    },
      STORE => -> $, \v { self.set_value(v) };
  }

  method get_value {
    i_cal_parameter_get_value(self.ICalParameter);
  }

  method set_value (uint32 $v) {
    i_cal_parameter_set_value(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::X is ICal::GLib::Parameter {
  method new (Str $v) {
    my $ical-parameter = i_cal_parameter_new_x($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method x is rw {
    Proxy.new:
      FETCH => -> $     { self.get_x    },
      STORE => -> $, \v { self.set_x(v) };
  }

  method get_x {
    i_cal_parameter_get_x(self.ICalParameter);
  }

  method set_x (Str $v) {
    i_cal_parameter_set_x(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::XLicCompareType is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_xliccomparetype($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method xliccomparetype is rw {
    Proxy.new:
      FETCH => -> $     { self.get_xliccomparetype    },
      STORE => -> $, \v { self.set_xliccomparetype(v) };
  }

  method get_xliccomparetype {
    i_cal_parameter_get_xliccomparetype(self.ICalParameter);
  }

  method set_xliccomparetype (uint32 $v) {
    i_cal_parameter_set_xliccomparetype(self.ICalParameter, $v);
  }
}

class ICal::GLib::DerivedParameter::XLicErrorType is ICal::GLib::Parameter {
  method new (uint32 $v) {
    my $ical-parameter = i_cal_parameter_new_xlicerrortype($v);

    $ical-parameter ?? self.bless( :$ical-parameter ) !! Nil;
  }

  method xlicerrortype is rw {
    Proxy.new:
      FETCH => -> $     { self.get_xlicerrortype    },
      STORE => -> $, \v { self.set_xlicerrortype(v) };
  }

  method get_xlicerrortype {
    i_cal_parameter_get_xlicerrortype(self.ICalParameter);
  }

  method set_xlicerrortype (uint32 $v) {
    i_cal_parameter_set_xlicerrortype(self.ICalParameter, $v);
  }
}
