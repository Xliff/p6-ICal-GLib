use v6.c;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::DerivedValues;

use ICal::GLib::Value;

class ICal::GLib::DerivedValues::Master {
  has $!idv;

  method get_action {
    i_cal_value_get_action($!idv);
  }

  method get_attach {
    i_cal_value_get_attach($!idv);
  }

  method get_binary {
    i_cal_value_get_binary($!idv);
  }

  method get_boolean {
    i_cal_value_get_boolean($!idv);
  }

  method get_busytype {
    i_cal_value_get_busytype($!idv);
  }

  method get_caladdress {
    i_cal_value_get_caladdress($!idv);
  }

  method get_carlevel {
    i_cal_value_get_carlevel($!idv);
  }

  method get_class {
    i_cal_value_get_class($!idv);
  }

  method get_cmd {
    i_cal_value_get_cmd($!idv);
  }

  method get_date {
    i_cal_value_get_date($!idv);
  }

  method get_datetime {
    i_cal_value_get_datetime($!idv);
  }

  method get_datetimedate {
    i_cal_value_get_datetimedate($!idv);
  }

  method get_datetimeperiod {
    i_cal_value_get_datetimeperiod($!idv);
  }

  method get_duration {
    i_cal_value_get_duration($!idv);
  }

  method get_float {
    i_cal_value_get_float($!idv);
  }

  method get_geo {
    i_cal_value_get_geo($!idv);
  }

  method get_integer {
    i_cal_value_get_integer($!idv);
  }

  method get_method {
    i_cal_value_get_method($!idv);
  }

  method get_period {
    i_cal_value_get_period($!idv);
  }

  method get_pollcompletion {
    i_cal_value_get_pollcompletion($!idv);
  }

  method get_pollmode {
    i_cal_value_get_pollmode($!idv);
  }

  method get_query {
    i_cal_value_get_query($!idv);
  }

  method get_querylevel {
    i_cal_value_get_querylevel($!idv);
  }

  method get_recur {
    i_cal_value_get_recur($!idv);
  }

  method get_requeststatus {
    i_cal_value_get_requeststatus($!idv);
  }

  method get_status {
    i_cal_value_get_status($!idv);
  }

  method get_string {
    i_cal_value_get_string($!idv);
  }

  method get_taskmode {
    i_cal_value_get_taskmode($!idv);
  }

  method get_text {
    i_cal_value_get_text($!idv);
  }

  method get_transp {
    i_cal_value_get_transp($!idv);
  }

  method get_trigger {
    i_cal_value_get_trigger($!idv);
  }

  method get_uri {
    i_cal_value_get_uri($!idv);
  }

  method get_utcoffset {
    i_cal_value_get_utcoffset($!idv);
  }

  method get_x {
    i_cal_value_get_x($!idv);
  }

  method get_xlicclass {
    i_cal_value_get_xlicclass($!idv);
  }

  method new_action (ICalPropertyAction $v) {
    i_cal_value_new_action($!idv, $v);
  }

  method new_attach (ICalAttach $v) {
    i_cal_value_new_attach($!idv, $v);
  }

  method new_binary (Str $v) {
    i_cal_value_new_binary($!idv, $v);
  }

  method new_boolean (gint $v) {
    i_cal_value_new_boolean($!idv, $v);
  }

  method new_busytype (ICalPropertyBusytype $v) {
    i_cal_value_new_busytype($!idv, $v);
  }

  method new_caladdress (Str $v) {
    i_cal_value_new_caladdress($!idv, $v);
  }

  method new_carlevel (ICalPropertyCarlevel $v) {
    i_cal_value_new_carlevel($!idv, $v);
  }

  method new_class (ICalProperty_Class $v) {
    i_cal_value_new_class($!idv, $v);
  }

  method new_cmd (ICalPropertyCmd $v) {
    i_cal_value_new_cmd($!idv, $v);
  }

  method new_date (ICalTime $v) {
    i_cal_value_new_date($!idv, $v);
  }

  method new_datetime (ICalTime $v) {
    i_cal_value_new_datetime($!idv, $v);
  }

  method new_datetimedate (ICalTime $v) {
    i_cal_value_new_datetimedate($!idv, $v);
  }

  method new_datetimeperiod (ICalDatetimeperiod $v) {
    i_cal_value_new_datetimeperiod($!idv, $v);
  }

  method new_duration (ICalDuration $v) {
    i_cal_value_new_duration($!idv, $v);
  }

  method new_float (gdouble $v) {
    i_cal_value_new_float($!idv, $v);
  }

  method new_geo (ICalGeo $v) {
    i_cal_value_new_geo($!idv, $v);
  }

  method new_integer (gint $v) {
    i_cal_value_new_integer($!idv, $v);
  }

  method new_method (ICalPropertyMethod $v) {
    i_cal_value_new_method($!idv, $v);
  }

  method new_period (ICalPeriod $v) {
    i_cal_value_new_period($!idv, $v);
  }

  method new_pollcompletion (ICalPropertyPollcompletion $v) {
    i_cal_value_new_pollcompletion($!idv, $v);
  }

  method new_pollmode (ICalPropertyPollmode $v) {
    i_cal_value_new_pollmode($!idv, $v);
  }

  method new_query (Str $v) {
    i_cal_value_new_query($!idv, $v);
  }

  method new_querylevel (ICalPropertyQuerylevel $v) {
    i_cal_value_new_querylevel($!idv, $v);
  }

  method new_recur (ICalRecurrence $v) {
    i_cal_value_new_recur($!idv, $v);
  }

  method new_requeststatus (ICalReqstat $v) {
    i_cal_value_new_requeststatus($!idv, $v);
  }

  method new_status (ICalPropertyStatus $v) {
    i_cal_value_new_status($!idv, $v);
  }

  method new_string (Str $v) {
    i_cal_value_new_string($!idv, $v);
  }

  method new_taskmode (ICalPropertyTaskmode $v) {
    i_cal_value_new_taskmode($!idv, $v);
  }

  method new_text (Str $v) {
    i_cal_value_new_text($!idv, $v);
  }

  method new_transp (ICalPropertyTransp $v) {
    i_cal_value_new_transp($!idv, $v);
  }

  method new_trigger (ICalTrigger $v) {
    i_cal_value_new_trigger($!idv, $v);
  }

  method new_uri (Str $v) {
    i_cal_value_new_uri($!idv, $v);
  }

  method new_utcoffset (gint $v) {
    i_cal_value_new_utcoffset($!idv, $v);
  }

  method new_x (Str $v) {
    i_cal_value_new_x($!idv, $v);
  }

  method new_xlicclass (ICalPropertyXlicclass $v) {
    i_cal_value_new_xlicclass($!idv, $v);
  }

  method reset_kind {
    i_cal_value_reset_kind($!idv);
  }

  method set_action (ICalPropertyAction $v) {
    i_cal_value_set_action($!idv, $v);
  }

  method set_attach (ICalAttach $v) {
    i_cal_value_set_attach($!idv, $v);
  }

  method set_binary (Str $v) {
    i_cal_value_set_binary($!idv, $v);
  }

  method set_boolean (gint $v) {
    i_cal_value_set_boolean($!idv, $v);
  }

  method set_busytype (ICalPropertyBusytype $v) {
    i_cal_value_set_busytype($!idv, $v);
  }

  method set_caladdress (Str $v) {
    i_cal_value_set_caladdress($!idv, $v);
  }

  method set_carlevel (ICalPropertyCarlevel $v) {
    i_cal_value_set_carlevel($!idv, $v);
  }

  method set_class (ICalProperty_Class $v) {
    i_cal_value_set_class($!idv, $v);
  }

  method set_cmd (ICalPropertyCmd $v) {
    i_cal_value_set_cmd($!idv, $v);
  }

  method set_date (ICalTime $v) {
    i_cal_value_set_date($!idv, $v);
  }

  method set_datetime (ICalTime $v) {
    i_cal_value_set_datetime($!idv, $v);
  }

  method set_datetimedate (ICalTime $v) {
    i_cal_value_set_datetimedate($!idv, $v);
  }

  method set_datetimeperiod (ICalDatetimeperiod $v) {
    i_cal_value_set_datetimeperiod($!idv, $v);
  }

  method set_duration (ICalDuration $v) {
    i_cal_value_set_duration($!idv, $v);
  }

  method set_float (gdouble $v) {
    i_cal_value_set_float($!idv, $v);
  }

  method set_geo (ICalGeo $v) {
    i_cal_value_set_geo($!idv, $v);
  }

  method set_integer (gint $v) {
    i_cal_value_set_integer($!idv, $v);
  }

  method set_method (ICalPropertyMethod $v) {
    i_cal_value_set_method($!idv, $v);
  }

  method set_period (ICalPeriod $v) {
    i_cal_value_set_period($!idv, $v);
  }

  method set_pollcompletion (ICalPropertyPollcompletion $v) {
    i_cal_value_set_pollcompletion($!idv, $v);
  }

  method set_pollmode (ICalPropertyPollmode $v) {
    i_cal_value_set_pollmode($!idv, $v);
  }

  method set_query (Str $v) {
    i_cal_value_set_query($!idv, $v);
  }

  method set_querylevel (ICalPropertyQuerylevel $v) {
    i_cal_value_set_querylevel($!idv, $v);
  }

  method set_recur (ICalRecurrence $v) {
    i_cal_value_set_recur($!idv, $v);
  }

  method set_requeststatus (ICalReqstat $v) {
    i_cal_value_set_requeststatus($!idv, $v);
  }

  method set_status (ICalPropertyStatus $v) {
    i_cal_value_set_status($!idv, $v);
  }

  method set_string (Str $v) {
    i_cal_value_set_string($!idv, $v);
  }

  method set_taskmode (ICalPropertyTaskmode $v) {
    i_cal_value_set_taskmode($!idv, $v);
  }

  method set_text (Str $v) {
    i_cal_value_set_text($!idv, $v);
  }

  method set_transp (ICalPropertyTransp $v) {
    i_cal_value_set_transp($!idv, $v);
  }

  method set_trigger (ICalTrigger $v) {
    i_cal_value_set_trigger($!idv, $v);
  }

  method set_uri (Str $v) {
    i_cal_value_set_uri($!idv, $v);
  }

  method set_utcoffset (gint $v) {
    i_cal_value_set_utcoffset($!idv, $v);
  }

  method set_x (Str $v) {
    i_cal_value_set_x($!idv, $v);
  }

  method set_xlicclass (ICalPropertyXlicclass $v) {
    i_cal_value_set_xlicclass($!idv, $v);
  }

}

class ICal::GLib::DerivedValues::action is ICal::GLib::Value {

  method new (uint32 $v) {
    my $value = i_cal_value_new_action($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method action is rw {
    Proxy.new:
      FETCH => -> $     { self.get_action    },
      STORE => -> $, \v { self.set_action(v) };
  }

  method get_action {
    i_cal_value_get_action(self.ICalValue);
  }

  method set_action (uint32 $v) {
    i_cal_value_set_action(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::attach is ICal::GLib::Value {

  method new (ICal::GLib::Raw::Definitions::ICalAttach $v) {
    my $value = i_cal_value_new_attach($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method attach is rw {
    Proxy.new:
      FETCH => -> $     { self.get_attach    },
      STORE => -> $, \v { self.set_attach(v) };
  }

  method get_attach {
    i_cal_value_get_attach(self.ICalValue);
  }

  method set_attach (ICal::GLib::Raw::Definitions::ICalAttach $v) {
    i_cal_value_set_attach(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::binary is ICal::GLib::Value {

  method new (Str $v) {
    my $value = i_cal_value_new_binary($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method binary is rw {
    Proxy.new:
      FETCH => -> $     { self.get_binary    },
      STORE => -> $, \v { self.set_binary(v) };
  }

  method get_binary {
    i_cal_value_get_binary(self.ICalValue);
  }

  method set_binary (Str $v) {
    i_cal_value_set_binary(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::boolean is ICal::GLib::Value {

  method new (int32 $v) {
    my $value = i_cal_value_new_boolean($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method boolean is rw {
    Proxy.new:
      FETCH => -> $     { self.get_boolean    },
      STORE => -> $, \v { self.set_boolean(v) };
  }

  method get_boolean {
    i_cal_value_get_boolean(self.ICalValue);
  }

  method set_boolean (int32 $v) {
    i_cal_value_set_boolean(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::busytype is ICal::GLib::Value {

  method new (uint32 $v) {
    my $value = i_cal_value_new_busytype($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method busytype is rw {
    Proxy.new:
      FETCH => -> $     { self.get_busytype    },
      STORE => -> $, \v { self.set_busytype(v) };
  }

  method get_busytype {
    i_cal_value_get_busytype(self.ICalValue);
  }

  method set_busytype (uint32 $v) {
    i_cal_value_set_busytype(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::caladdress is ICal::GLib::Value {

  method new (Str $v) {
    my $value = i_cal_value_new_caladdress($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method caladdress is rw {
    Proxy.new:
      FETCH => -> $     { self.get_caladdress    },
      STORE => -> $, \v { self.set_caladdress(v) };
  }

  method get_caladdress {
    i_cal_value_get_caladdress(self.ICalValue);
  }

  method set_caladdress (Str $v) {
    i_cal_value_set_caladdress(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::carlevel is ICal::GLib::Value {

  method new (uint32 $v) {
    my $value = i_cal_value_new_carlevel($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method carlevel is rw {
    Proxy.new:
      FETCH => -> $     { self.get_carlevel    },
      STORE => -> $, \v { self.set_carlevel(v) };
  }

  method get_carlevel {
    i_cal_value_get_carlevel(self.ICalValue);
  }

  method set_carlevel (uint32 $v) {
    i_cal_value_set_carlevel(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::class is ICal::GLib::Value {

  method new (uint32 $v) {
    my $value = i_cal_value_new_class($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method class is rw {
    Proxy.new:
      FETCH => -> $     { self.get_class    },
      STORE => -> $, \v { self.set_class(v) };
  }

  method get_class {
    i_cal_value_get_class(self.ICalValue);
  }

  method set_class (uint32 $v) {
    i_cal_value_set_class(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::cmd is ICal::GLib::Value {

  method new (uint32 $v) {
    my $value = i_cal_value_new_cmd($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method cmd is rw {
    Proxy.new:
      FETCH => -> $     { self.get_cmd    },
      STORE => -> $, \v { self.set_cmd(v) };
  }

  method get_cmd {
    i_cal_value_get_cmd(self.ICalValue);
  }

  method set_cmd (uint32 $v) {
    i_cal_value_set_cmd(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::date is ICal::GLib::Value {

  method new (ICal::GLib::Raw::Definitions::ICalTime $v) {
    my $value = i_cal_value_new_date($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method date is rw {
    Proxy.new:
      FETCH => -> $     { self.get_date    },
      STORE => -> $, \v { self.set_date(v) };
  }

  method get_date {
    i_cal_value_get_date(self.ICalValue);
  }

  method set_date (ICal::GLib::Raw::Definitions::ICalTime $v) {
    i_cal_value_set_date(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::datetime is ICal::GLib::Value {

  method new (ICal::GLib::Raw::Definitions::ICalTime $v) {
    my $value = i_cal_value_new_datetime($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method datetime is rw {
    Proxy.new:
      FETCH => -> $     { self.get_datetime    },
      STORE => -> $, \v { self.set_datetime(v) };
  }

  method get_datetime {
    i_cal_value_get_datetime(self.ICalValue);
  }

  method set_datetime (ICal::GLib::Raw::Definitions::ICalTime $v) {
    i_cal_value_set_datetime(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::datetimedate is ICal::GLib::Value {

  method new (ICal::GLib::Raw::Definitions::ICalTime $v) {
    my $value = i_cal_value_new_datetimedate($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method datetimedate is rw {
    Proxy.new:
      FETCH => -> $     { self.get_datetimedate    },
      STORE => -> $, \v { self.set_datetimedate(v) };
  }

  method get_datetimedate {
    i_cal_value_get_datetimedate(self.ICalValue);
  }

  method set_datetimedate (ICal::GLib::Raw::Definitions::ICalTime $v) {
    i_cal_value_set_datetimedate(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::datetimeperiod is ICal::GLib::Value {

  method new (ICal::GLib::Raw::Definitions::ICalDatetimeperiod $v) {
    my $value = i_cal_value_new_datetimeperiod($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method datetimeperiod is rw {
    Proxy.new:
      FETCH => -> $     { self.get_datetimeperiod    },
      STORE => -> $, \v { self.set_datetimeperiod(v) };
  }

  method get_datetimeperiod {
    i_cal_value_get_datetimeperiod(self.ICalValue);
  }

  method set_datetimeperiod (ICal::GLib::Raw::Definitions::ICalDatetimeperiod $v) {
    i_cal_value_set_datetimeperiod(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::duration is ICal::GLib::Value {

  method new (ICal::GLib::Raw::Definitions::ICalDuration $v) {
    my $value = i_cal_value_new_duration($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method duration is rw {
    Proxy.new:
      FETCH => -> $     { self.get_duration    },
      STORE => -> $, \v { self.set_duration(v) };
  }

  method get_duration {
    i_cal_value_get_duration(self.ICalValue);
  }

  method set_duration (ICal::GLib::Raw::Definitions::ICalDuration $v) {
    i_cal_value_set_duration(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::float is ICal::GLib::Value {

  method new (num64 $v) {
    my $value = i_cal_value_new_float($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method float is rw {
    Proxy.new:
      FETCH => -> $     { self.get_float    },
      STORE => -> $, \v { self.set_float(v) };
  }

  method get_float {
    i_cal_value_get_float(self.ICalValue);
  }

  method set_float (num64 $v) {
    i_cal_value_set_float(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::geo is ICal::GLib::Value {

  method new (ICal::GLib::Raw::Definitions::ICalGeo $v) {
    my $value = i_cal_value_new_geo($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method geo is rw {
    Proxy.new:
      FETCH => -> $     { self.get_geo    },
      STORE => -> $, \v { self.set_geo(v) };
  }

  method get_geo {
    i_cal_value_get_geo(self.ICalValue);
  }

  method set_geo (ICal::GLib::Raw::Definitions::ICalGeo $v) {
    i_cal_value_set_geo(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::integer is ICal::GLib::Value {

  method new (int32 $v) {
    my $value = i_cal_value_new_integer($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method integer is rw {
    Proxy.new:
      FETCH => -> $     { self.get_integer    },
      STORE => -> $, \v { self.set_integer(v) };
  }

  method get_integer {
    i_cal_value_get_integer(self.ICalValue);
  }

  method set_integer (int32 $v) {
    i_cal_value_set_integer(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::method is ICal::GLib::Value {

  method new (uint32 $v) {
    my $value = i_cal_value_new_method($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method method is rw {
    Proxy.new:
      FETCH => -> $     { self.get_method    },
      STORE => -> $, \v { self.set_method(v) };
  }

  method get_method {
    i_cal_value_get_method(self.ICalValue);
  }

  method set_method (uint32 $v) {
    i_cal_value_set_method(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::period is ICal::GLib::Value {

  method new (ICal::GLib::Raw::Definitions::ICalPeriod $v) {
    my $value = i_cal_value_new_period($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method period is rw {
    Proxy.new:
      FETCH => -> $     { self.get_period    },
      STORE => -> $, \v { self.set_period(v) };
  }

  method get_period {
    i_cal_value_get_period(self.ICalValue);
  }

  method set_period (ICal::GLib::Raw::Definitions::ICalPeriod $v) {
    i_cal_value_set_period(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::pollcompletion is ICal::GLib::Value {

  method new (uint32 $v) {
    my $value = i_cal_value_new_pollcompletion($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method pollcompletion is rw {
    Proxy.new:
      FETCH => -> $     { self.get_pollcompletion    },
      STORE => -> $, \v { self.set_pollcompletion(v) };
  }

  method get_pollcompletion {
    i_cal_value_get_pollcompletion(self.ICalValue);
  }

  method set_pollcompletion (uint32 $v) {
    i_cal_value_set_pollcompletion(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::pollmode is ICal::GLib::Value {

  method new (uint32 $v) {
    my $value = i_cal_value_new_pollmode($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method pollmode is rw {
    Proxy.new:
      FETCH => -> $     { self.get_pollmode    },
      STORE => -> $, \v { self.set_pollmode(v) };
  }

  method get_pollmode {
    i_cal_value_get_pollmode(self.ICalValue);
  }

  method set_pollmode (uint32 $v) {
    i_cal_value_set_pollmode(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::query is ICal::GLib::Value {

  method new (Str $v) {
    my $value = i_cal_value_new_query($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method query is rw {
    Proxy.new:
      FETCH => -> $     { self.get_query    },
      STORE => -> $, \v { self.set_query(v) };
  }

  method get_query {
    i_cal_value_get_query(self.ICalValue);
  }

  method set_query (Str $v) {
    i_cal_value_set_query(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::querylevel is ICal::GLib::Value {

  method new (uint32 $v) {
    my $value = i_cal_value_new_querylevel($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method querylevel is rw {
    Proxy.new:
      FETCH => -> $     { self.get_querylevel    },
      STORE => -> $, \v { self.set_querylevel(v) };
  }

  method get_querylevel {
    i_cal_value_get_querylevel(self.ICalValue);
  }

  method set_querylevel (uint32 $v) {
    i_cal_value_set_querylevel(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::recur is ICal::GLib::Value {

  method new (ICal::GLib::Raw::Definitions::ICalRecurrence $v) {
    my $value = i_cal_value_new_recur($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method recur is rw {
    Proxy.new:
      FETCH => -> $     { self.get_recur    },
      STORE => -> $, \v { self.set_recur(v) };
  }

  method get_recur {
    i_cal_value_get_recur(self.ICalValue);
  }

  method set_recur (ICal::GLib::Raw::Definitions::ICalRecurrence $v) {
    i_cal_value_set_recur(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::requeststatus is ICal::GLib::Value {

  method new (ICal::GLib::Raw::Definitions::ICalReqstat $v) {
    my $value = i_cal_value_new_requeststatus($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method requeststatus is rw {
    Proxy.new:
      FETCH => -> $     { self.get_requeststatus    },
      STORE => -> $, \v { self.set_requeststatus(v) };
  }

  method get_requeststatus {
    i_cal_value_get_requeststatus(self.ICalValue);
  }

  method set_requeststatus (ICal::GLib::Raw::Definitions::ICalReqstat $v) {
    i_cal_value_set_requeststatus(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::status is ICal::GLib::Value {

  method new (uint32 $v) {
    my $value = i_cal_value_new_status($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method status is rw {
    Proxy.new:
      FETCH => -> $     { self.get_status    },
      STORE => -> $, \v { self.set_status(v) };
  }

  method get_status {
    i_cal_value_get_status(self.ICalValue);
  }

  method set_status (uint32 $v) {
    i_cal_value_set_status(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::string is ICal::GLib::Value {

  method new (Str $v) {
    my $value = i_cal_value_new_string($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method string is rw {
    Proxy.new:
      FETCH => -> $     { self.get_string    },
      STORE => -> $, \v { self.set_string(v) };
  }

  method get_string {
    i_cal_value_get_string(self.ICalValue);
  }

  method set_string (Str $v) {
    i_cal_value_set_string(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::taskmode is ICal::GLib::Value {

  method new (uint32 $v) {
    my $value = i_cal_value_new_taskmode($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method taskmode is rw {
    Proxy.new:
      FETCH => -> $     { self.get_taskmode    },
      STORE => -> $, \v { self.set_taskmode(v) };
  }

  method get_taskmode {
    i_cal_value_get_taskmode(self.ICalValue);
  }

  method set_taskmode (uint32 $v) {
    i_cal_value_set_taskmode(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::text is ICal::GLib::Value {

  method new (Str $v) {
    my $value = i_cal_value_new_text($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method text is rw {
    Proxy.new:
      FETCH => -> $     { self.get_text    },
      STORE => -> $, \v { self.set_text(v) };
  }

  method get_text {
    i_cal_value_get_text(self.ICalValue);
  }

  method set_text (Str $v) {
    i_cal_value_set_text(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::transp is ICal::GLib::Value {

  method new (uint32 $v) {
    my $value = i_cal_value_new_transp($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method transp is rw {
    Proxy.new:
      FETCH => -> $     { self.get_transp    },
      STORE => -> $, \v { self.set_transp(v) };
  }

  method get_transp {
    i_cal_value_get_transp(self.ICalValue);
  }

  method set_transp (uint32 $v) {
    i_cal_value_set_transp(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::trigger is ICal::GLib::Value {

  method new (ICal::GLib::Raw::Definitions::ICalTrigger $v) {
    my $value = i_cal_value_new_trigger($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method trigger is rw {
    Proxy.new:
      FETCH => -> $     { self.get_trigger    },
      STORE => -> $, \v { self.set_trigger(v) };
  }

  method get_trigger {
    i_cal_value_get_trigger(self.ICalValue);
  }

  method set_trigger (ICal::GLib::Raw::Definitions::ICalTrigger $v) {
    i_cal_value_set_trigger(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::uri is ICal::GLib::Value {

  method new (Str $v) {
    my $value = i_cal_value_new_uri($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method uri is rw {
    Proxy.new:
      FETCH => -> $     { self.get_uri    },
      STORE => -> $, \v { self.set_uri(v) };
  }

  method get_uri {
    i_cal_value_get_uri(self.ICalValue);
  }

  method set_uri (Str $v) {
    i_cal_value_set_uri(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::utcoffset is ICal::GLib::Value {

  method new (int32 $v) {
    my $value = i_cal_value_new_utcoffset($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method utcoffset is rw {
    Proxy.new:
      FETCH => -> $     { self.get_utcoffset    },
      STORE => -> $, \v { self.set_utcoffset(v) };
  }

  method get_utcoffset {
    i_cal_value_get_utcoffset(self.ICalValue);
  }

  method set_utcoffset (int32 $v) {
    i_cal_value_set_utcoffset(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::x is ICal::GLib::Value {

  method new (Str $v) {
    my $value = i_cal_value_new_x($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method x is rw {
    Proxy.new:
      FETCH => -> $     { self.get_x    },
      STORE => -> $, \v { self.set_x(v) };
  }

  method get_x {
    i_cal_value_get_x(self.ICalValue);
  }

  method set_x (Str $v) {
    i_cal_value_set_x(self.ICalValue, $v);
  }

}

class ICal::GLib::DerivedValues::xlicclass is ICal::GLib::Value {

  method new (uint32 $v) {
    my $value = i_cal_value_new_xlicclass($v);

    $value ?? self.bless( :$value ) !! Nil;
  }

  method xlicclass is rw {
    Proxy.new:
      FETCH => -> $     { self.get_xlicclass    },
      STORE => -> $, \v { self.set_xlicclass(v) };
  }

  method get_xlicclass {
    i_cal_value_get_xlicclass(self.ICalValue);
  }

  method set_xlicclass (uint32 $v) {
    i_cal_value_set_xlicclass(self.ICalValue, $v);
  }

}
