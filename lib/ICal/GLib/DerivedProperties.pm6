use v6.c;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::DerivedProperties;

use ICal::GLib::Property;

sub resolveICalTime ($v) {
  do given $v {
    when Str               {  $_ = ICal::GLib::Time.new-from-string($_);
                              proceed   }
    when .^can('ICalTime') { .ICalTime  }
    when ICalTime          { $_         }

    default {
      die "Value of type { $v.^name } passed to {
           &?ROUTINE.^name } must be ICalTime-compatible and isn't!"
    }
  }
}

sub resolveICalPeriod ($v) {
  do given $v {
    when Str                 {  $_ = ICal::GLib::Period.new-from-string($_);
                                proceed    }
    when .^can('ICalPeriod') { .ICalPeriod }
    when ICalPeriod          { $_          }

    default {
      die "Value of type { $v.^name } passed to {
           &?ROUTINE.^name } must be ICalPeriod-compatible and isn't!"
    }
  }
}

sub resolveICalReqstat ($v) {
  do given $v {
    when Str                  { $_ = ICal::GLib::ReqStat.new-from-string($_);
                                proceed      }
    when .^can('ICalReqstat') { .ICalReqstat }
    when ICalReqstat          { $_           }

    default {
      die "Value of type { $v.^name } passed to {
           &?ROUTINE.^name } must be ICalReqstat-compatible and isn't!"
    }
  }
}

sub resolveICalRecurrence ($v) {
  do given $v {
    when Str                     {  $_ = ICal::GLib::Recurrence.new-from-string($_);
                                    proceed        }
    when .^can('ICalRecurrence') { .ICalRecurrence }
    when ICalRecurrence          { $_              }

    default {
      die "Value of type { $v.^name } passed to {
           &?ROUTINE.^name } must be ICalRecurrence-compatible and isn't!"
    }
  }
}

sub resolveICalDuration ($v) {
  do given $v {
    when Str                   { $_ = ICal::GLib::Duration.new-from-string($_);
                                  proceed }
    when Int                   { $_ = ICal::GLib::Duration.new-from-int($_);
                                  proceed   }
    when .^can('ICalDuration') { .ICalDuration }
    when ICalDuration          { $_            }

    default {
      die "Value of type { $v.^name } passed to {
           &?ROUTINE.^name } must be ICalDuiration-compatible and isn't!"
    }
  }
}

sub resolveICalGeo ($v) {
  do given $v {

    when Positional {
      die 'Argument in Positional form must only contain 2 elements!'
        unless +$_ == 2;

      die 'Elements of Positional form must be Num-compatible!' unless [||](
        .[0].^can('Num') && .[1].^can('Num')
        .all ~~ Num
      );

      $_ = ICal::GLib::Geo.new( |$_ );
      proceed;
    }

    when .^can('ICalGeo') { .ICalGeo }
    when ICalGeo          { $_       }

    default {
      die "Value of type { $v.^name } passed to {
           &?ROUTINE.^name } must be ICalGeo-compatible and isn't!"
    }

  }
}

sub resolveICalTrigger ($v) {
  do given $v {
    when Str                   { $_ = ICal::GLib::Trigger.new_from_string($_);
                                  proceed    }
    when Int                   { $_ = ICal::GLib::Trigger.new_from_int($_);
                                  proceed    }
    when .^can('ICalTrigger') { .ICalTrigger }
    when ICalTrigger          { $_           }

    default {
      # This should go back to the caller. Need a routine for it. &APICallee?
      die "Value of type { $v.^name } passed to {
           &?ROUTINE.^name } must be ICalTrigger-compatible and isn't!"
    }
  }
}


class ICal::GLib::DerivedProperty::AcceptResponse is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_acceptresponse($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method acceptresponse is rw {
    Proxy.new:
      FETCH => -> $     { self.get_acceptresponse    },
      STORE => -> $, \v { self.set_acceptresponse(v) };
  }

  method get_acceptresponse {
    i_cal_property_get_acceptresponse(self.ICalProperty);
  }

  method set_acceptresponse (Str() $v) {
    i_cal_property_set_acceptresponse(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Acknowledged is ICal::GLib::Property {\

  method new (ICalTime() $v) {
    my $ical-property = i_cal_property_new_acknowledged($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method acknowledged (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_acknowledged(:$raw) },
      STORE => -> $, \v { self.set_acknowledged(v)     };
  }

  method get_acknowledged (:$raw = False) {
    returnObject(
      i_cal_property_get_acknowledged(self.ICalProperty),
      $raw,
      ICalTime,
      ICal::GLib::Time
    );
  }

  method set_acknowledged ($v) {
    i_cal_property_set_acknowledged(
      self.ICalProperty,
      my $vv = resolveICalTime($v)
    );
    $vv;
  }

}

class ICal::GLib::DerivedProperty::Action is ICal::GLib::Property {

  method new (Int $v) {
    my ICalPropertyAction $vv = $v;

    my $ical-property = i_cal_property_new_action($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method action is rw {
    Proxy.new:
      FETCH => -> $     { self.get_action    },
      STORE => -> $, \v { self.set_action(v) };
  }

  method get_action {
    ICalPropertyActionEnum(
      i_cal_property_get_action(self.ICalProperty)
    )
  }

  method set_action (Int() $v) {
    my ICalPropertyAction $vv = $v;

    i_cal_property_set_action(self.ICalProperty, $vv);
    ICalPropertyActionEnum($v);
  }

}

class ICal::GLib::DerivedProperty::AllowConflict is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_allowconflict($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method allowconflict is rw {
    Proxy.new:
      FETCH => -> $     { self.get_allowconflict    },
      STORE => -> $, \v { self.set_allowconflict(v) };
  }

  method get_allowconflict {
    i_cal_property_get_allowconflict(self.ICalProperty);
  }

  method set_allowconflict (Str() $v) {
    i_cal_property_set_allowconflict(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Attach is ICal::GLib::Property {

  method new (ICalAttach() $v) {
    my $ical-property = i_cal_property_new_attach($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method attach (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_attach(:$raw) },
      STORE => -> $, \v { self.set_attach(v)     };
  }

  method get_attach (:$raw = False) {
    returnObject(
      i_cal_property_get_attach(self.ICalProperty),
      $raw,
      ICalAttach,
      ICal::GLib::Attach
    );
  }

  # cw: ICalAttach is really limited, so ease-of-use efforts were not made.
  #     If you feel differently, please satisfy your itch. Please remeber to
  #     offer a PR when you are done.
  method set_attach (ICalAttach() $v) {
    i_cal_property_set_attach(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Attendee is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_attendee($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method attendee is rw {
    Proxy.new:
      FETCH => -> $     { self.get_attendee    },
      STORE => -> $, \v { self.set_attendee(v) };
  }

  method get_attendee {
    i_cal_property_get_attendee(self.ICalProperty);
  }

  method set_attendee (Str() $v) {
    i_cal_property_set_attendee(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::BusyType is ICal::GLib::Property {

  method new (Int() $v) {
    my ICalPropertyBusyType $vv = $v;

    my $ical-property = i_cal_property_new_busytype($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method busytype is rw {
    Proxy.new:
      FETCH => -> $     { self.get_busytype    },
      STORE => -> $, \v { self.set_busytype(v) };
  }

  method get_busytype {
    ICalPropertyBusyTypeEnum(
      i_cal_property_get_busytype(self.ICalProperty)
    );
  }

  method set_busytype (Int() $v) {
    my ICalPropertyBusyType $vv = $v;

    i_cal_property_set_busytype(self.ICalProperty, $vv);
    ICalPropertyBusyTypeEnum($v);
  }

}

class ICal::GLib::DerivedProperty::CalId is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_calid($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method calid is rw {
    Proxy.new:
      FETCH => -> $     { self.get_calid    },
      STORE => -> $, \v { self.set_calid(v) };
  }

  method get_calid {
    i_cal_property_get_calid(self.ICalProperty);
  }

  method set_calid (Str() $v) {
    i_cal_property_set_calid(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::CalMaster is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_calmaster($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method calmaster is rw {
    Proxy.new:
      FETCH => -> $     { self.get_calmaster    },
      STORE => -> $, \v { self.set_calmaster(v) };
  }

  method get_calmaster {
    i_cal_property_get_calmaster(self.ICalProperty);
  }

  method set_calmaster (Str() $v) {
    i_cal_property_set_calmaster(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::CalScale is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_calscale($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method calscale is rw {
    Proxy.new:
      FETCH => -> $     { self.get_calscale    },
      STORE => -> $, \v { self.set_calscale(v) };
  }

  method get_calscale {
    i_cal_property_get_calscale(self.ICalProperty);
  }

  method set_calscale (Str() $v) {
    i_cal_property_set_calscale(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::CapVersion is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_capversion($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method capversion is rw {
    Proxy.new:
      FETCH => -> $     { self.get_capversion    },
      STORE => -> $, \v { self.set_capversion(v) };
  }

  method get_capversion {
    i_cal_property_get_capversion(self.ICalProperty);
  }

  method set_capversion (Str() $v) {
    i_cal_property_set_capversion(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::CarId is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_carid($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method carid is rw {
    Proxy.new:
      FETCH => -> $     { self.get_carid    },
      STORE => -> $, \v { self.set_carid(v) };
  }

  method get_carid {
    i_cal_property_get_carid(self.ICalProperty);
  }

  method set_carid (Str() $v) {
    i_cal_property_set_carid(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::CarLevel is ICal::GLib::Property {

  method new (Int() $v) {
    my ICalPropertyCarlevel $vv = $v;

    my $ical-property = i_cal_property_new_carlevel($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method carlevel is rw {
    Proxy.new:
      FETCH => -> $     { self.get_carlevel    },
      STORE => -> $, \v { self.set_carlevel(v) };
  }

  method get_carlevel {
    ICalPropertyCarlevelEnum(
      i_cal_property_get_carlevel(self.ICalProperty)
    );
  }

  method set_carlevel (Int() $v) {
    my ICalPropertyCarlevel $vv = $v;

    i_cal_property_set_carlevel(self.ICalProperty, $v);
    ICalPropertyCarlevelEnum($v);
  }

}

class ICal::GLib::DerivedProperty::Categories is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_categories($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method categories is rw {
    Proxy.new:
      FETCH => -> $     { self.get_categories    },
      STORE => -> $, \v { self.set_categories(v) };
  }

  method get_categories {
    i_cal_property_get_categories(self.ICalProperty);
  }

  method set_categories (Str() $v) {
    i_cal_property_set_categories(self.ICalProperty, $v);
  }

}

class ICal::GLib::DerivedProperty::Class is ICal::GLib::Property {

  method new (Int() $v) {
    my ICalPropertyClass $vv = $v;

    my $ical-property = i_cal_property_new_class($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method class is rw {
    Proxy.new:
      FETCH => -> $     { self.get_class    },
      STORE => -> $, \v { self.set_class(v) };
  }

  method get_class {
    ICalPropertyClassEnum( i_cal_property_get_class(self.ICalProperty) );
  }

  method set_class (Int() $v) {
    my ICalPropertyClass $vv = $v;

    i_cal_property_set_class(self.ICalProperty, $vv);
    ICalPropertyClassEnum($v);
  }
}

class ICal::GLib::DerivedProperty::Cmd is ICal::GLib::Property {
  method new (Int() $v) {
    my ICalPropertyCmd $vv = $v;

    my $ical-property = i_cal_property_new_cmd($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method cmd is rw {
    Proxy.new:
      FETCH => -> $     { self.get_cmd    },
      STORE => -> $, \v { self.set_cmd(v) };
  }

  method get_cmd {
    ICalPropertyCmdEnum( i_cal_property_get_cmd(self.ICalProperty) )
  }

  method set_cmd (Int() $v) {
    i_cal_property_set_cmd(self.ICalProperty, $v);
    ICalPropertyCmdEnum($v);
  }

}

class ICal::GLib::DerivedProperty::Color is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_color($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method color is rw {
    Proxy.new:
      FETCH => -> $     { self.get_color    },
      STORE => -> $, \v { self.set_color(v) };
  }

  method get_color {
    i_cal_property_get_color(self.ICalProperty);
  }

  method set_color (Str() $v) {
    i_cal_property_set_color(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Comment is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_comment($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method comment is rw {
    Proxy.new:
      FETCH => -> $     { self.get_comment    },
      STORE => -> $, \v { self.set_comment(v) };
  }

  method get_comment {
    i_cal_property_get_comment(self.ICalProperty);
  }

  method set_comment (Str() $v) {
    i_cal_property_set_comment(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Completed is ICal::GLib::Property {

  method new (ICalTime() $v) {
    my $ical-property = i_cal_property_new_completed($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method completed (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_completed(:$raw) },
      STORE => -> $, \v { self.set_completed(v)     };
  }

  method get_completed {
    i_cal_property_get_completed(self.ICalProperty);
  }

  method set_completed ($v) {
    i_cal_property_set_completed(
      self.ICalProperty,
      my $vv = resolveICalTime($v)
    );
  }
}

class ICal::GLib::DerivedProperty::Components is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_components($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method components is rw {
    Proxy.new:
      FETCH => -> $     { self.get_components    },
      STORE => -> $, \v { self.set_components(v) };
  }

  method get_components {
    i_cal_property_get_components(self.ICalProperty);
  }

  method set_components (Str() $v) {
    i_cal_property_set_components(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Contact is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_contact($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method contact is rw {
    Proxy.new:
      FETCH => -> $     { self.get_contact    },
      STORE => -> $, \v { self.set_contact(v) };
  }

  method get_contact {
    i_cal_property_get_contact(self.ICalProperty);
  }

  method set_contact (Str() $v) {
    i_cal_property_set_contact(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Created is ICal::GLib::Property {

  method new ($v) {
    my $ical-property = i_cal_property_new_created($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method created (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_created(:$raw) },
      STORE => -> $, \v { self.set_created(v)     };
  }

  method get_created (:$raw = False) {
    returnObject(
      i_cal_property_get_created(self.ICalProperty),
      $raw,
      ICalTime,
      ICal::GLib::Time
    );
  }

  method set_created ($v) {
    i_cal_property_set_created(
      self.ICalProperty,
      my $vv = resolveICalTime($v)
    );
    $vv;
  }

}

class ICal::GLib::DerivedProperty::CSid is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_csid($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method csid is rw {
    Proxy.new:
      FETCH => -> $     { self.get_csid    },
      STORE => -> $, \v { self.set_csid(v) };
  }

  method get_csid {
    i_cal_property_get_csid(self.ICalProperty);
  }

  method set_csid (Str() $v) {
    i_cal_property_set_csid(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::DateMax is ICal::GLib::Property {

  method new (ICalTime() $v) {
    my $ical-property = i_cal_property_new_datemax($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method datemax (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_datemax(:$raw) },
      STORE => -> $, \v { self.set_datemax(v)     };
  }

  method get_datemax (:$raw = False) {
    returnObject(
      i_cal_property_get_datemax(self.ICalProperty),
      $raw,
      ICalTime,
      ICal::GLib::Time
    );
  }

  method set_datemax ($v) {
    i_cal_property_set_datemax(
      self.ICalProperty,
      my $vv = resolveICalTime($v)
    );
    $vv;
  }
}

class ICal::GLib::DerivedProperty::DateMin is ICal::GLib::Property {

  method new (ICalTime() $v) {
    my $ical-property = i_cal_property_new_datemin($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method datemin (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_datemin(:$raw) },
      STORE => -> $, \v { self.set_datemin(v)     };
  }

  method get_datemin (:$raw = False) {
    returnObject(
      i_cal_property_get_datemin(self.ICalProperty),
      $raw,
      ICalTime,
      ICal::GLib::Time
    );
  }

  method set_datemin ($v) {
    i_cal_property_set_datemin(
      self.ICalProperty,
      my $vv = resolveICalTime($v)
    );
    $vv
  }

}

class ICal::GLib::DerivedProperty::Decreed is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_decreed($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method decreed is rw {
    Proxy.new:
      FETCH => -> $     { self.get_decreed    },
      STORE => -> $, \v { self.set_decreed(v) };
  }

  method get_decreed {
    i_cal_property_get_decreed(self.ICalProperty);
  }

  method set_decreed (Str() $v) {
    i_cal_property_set_decreed(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::DefaultCharset is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_defaultcharset($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method defaultcharset is rw {
    Proxy.new:
      FETCH => -> $     { self.get_defaultcharset    },
      STORE => -> $, \v { self.set_defaultcharset(v) };
  }

  method get_defaultcharset {
    i_cal_property_get_defaultcharset(self.ICalProperty);
  }

  method set_defaultcharset (Str() $v) {
    i_cal_property_set_defaultcharset(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::DefaultLocale is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_defaultlocale($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method defaultlocale is rw {
    Proxy.new:
      FETCH => -> $     { self.get_defaultlocale    },
      STORE => -> $, \v { self.set_defaultlocale(v) };
  }

  method get_defaultlocale {
    i_cal_property_get_defaultlocale(self.ICalProperty);
  }

  method set_defaultlocale (Str() $v) {
    i_cal_property_set_defaultlocale(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::DefaultTZid is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_defaulttzid($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method defaulttzid is rw {
    Proxy.new:
      FETCH => -> $     { self.get_defaulttzid    },
      STORE => -> $, \v { self.set_defaulttzid(v) };
  }

  method get_defaulttzid {
    i_cal_property_get_defaulttzid(self.ICalProperty);
  }

  method set_defaulttzid (Str() $v) {
    i_cal_property_set_defaulttzid(self.ICalProperty, $v);
  }

}

class ICal::GLib::DerivedProperty::DefaultVCars is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_defaultvcars($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method defaultvcars is rw {
    Proxy.new:
      FETCH => -> $     { self.get_defaultvcars    },
      STORE => -> $, \v { self.set_defaultvcars(v) };
  }

  method get_defaultvcars {
    i_cal_property_get_defaultvcars(self.ICalProperty);
  }

  method set_defaultvcars (Str() $v) {
    i_cal_property_set_defaultvcars(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Deny is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_deny($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method deny is rw {
    Proxy.new:
      FETCH => -> $     { self.get_deny    },
      STORE => -> $, \v { self.set_deny(v) };
  }

  method get_deny {
    i_cal_property_get_deny(self.ICalProperty);
  }

  method set_deny (Str() $v) {
    i_cal_property_set_deny(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Description is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_description($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method description is rw {
    Proxy.new:
      FETCH => -> $     { self.get_description    },
      STORE => -> $, \v { self.set_description(v) };
  }

  method get_description {
    i_cal_property_get_description(self.ICalProperty);
  }

  method set_description (Str() $v) {
    i_cal_property_set_description(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::DTEnd is ICal::GLib::Property {

  method new (ICal::GLib::Raw::Definitions::ICalTime $v) {
    my $ical-property = i_cal_property_new_dtend($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method dtend (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_dtend(:$raw) },
      STORE => -> $, \v { self.set_dtend(v)     };
  }

  method get_dtend (:$raw = False) {
    returnObject(
      i_cal_property_get_dtend(self.ICalProperty),
      $raw,
      ICalTime,
      ICal::GLib::Time
    );
  }

  method set_dtend ($v) {
    i_cal_property_set_dtend(
      self.ICalProperty,
      my $vv = resolveICalTime($v)
    );
    $vv;
  }

}

class ICal::GLib::DerivedProperty::DTStamp is ICal::GLib::Property {

  method new (ICalTime() $v) {
    my $ical-property = i_cal_property_new_dtstamp($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method dtstamp (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_dtstamp(:$raw) },
      STORE => -> $, \v { self.set_dtstamp(v)     };
  }

  method get_dtstamp {
    i_cal_property_get_dtstamp(self.ICalProperty);
  }

  method set_dtstamp ($v) {
    i_cal_property_set_dtstamp(
      self.ICalProperty,
      my $vv = resolveICalTime($v)
    );
    $vv
  }

}

class ICal::GLib::DerivedProperty::DTStart is ICal::GLib::Property {

  method new (ICalTime() $v) {
    my $ical-property = i_cal_property_new_dtstart($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method dtstart (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_dtstart(:$raw) },
      STORE => -> $, \v { self.set_dtstart(v)     };
  }

  method get_dtstart (:$raw = False) {
    returnObject(
      i_cal_property_get_dtstart(self.ICalProperty),
      $raw,
      ICalTime,
      ICal::GLib::Time
    );
  }

  method set_dtstart ($v) {
    i_cal_property_set_dtstart(
      self.ICalProperty,
      my $vv = resolveICalTime($v)
    );
    $vv;
  }

}

class ICal::GLib::DerivedProperty::Due is ICal::GLib::Property {

  method new (ICalTime() $v) {
    my $ical-property = i_cal_property_new_due($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method due(:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_due(:$raw) },
      STORE => -> $, \v { self.set_due(v)     };
  }

  method get_due (:$raw = False) {
    returnObject(
      i_cal_property_get_due(self.ICalProperty),
      $raw,
      ICalTime,
      ICal::GLib::Time
    );
  }

  method set_due ($v) {
    i_cal_property_set_due(
      self.ICalProperty,
      my $vv = resolveICalTime($v)
    );
    $vv;
  }

}

class ICal::GLib::DerivedProperty::Duration is ICal::GLib::Property {

  method new (ICalDuration() $v) {
    my $ical-property = i_cal_property_new_duration($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method duration (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_duration(:$raw) },
      STORE => -> $, \v { self.set_duration(v)     };
  }

  method get_duration (:$raw = False) {
    returnObject(
      i_cal_property_get_duration(self.ICalProperty),
      $raw,
      ICalDuration,
      ICal::GLib::Duration
    );
  }

  method set_duration ($v) {
    i_cal_property_set_duration(
      self.ICalProperty,
      my $vv = resolveICalDuration($v)
    );
    $vv;
  }

}

class ICal::GLib::DerivedProperty::EstimatedDuration is ICal::GLib::Property {

  method new (ICalDuration() $v) {
    my $ical-property = i_cal_property_new_estimatedduration($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method estimatedduration (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_estimatedduration(:$raw) },
      STORE => -> $, \v { self.set_estimatedduration(v)     };
  }

  method get_estimatedduration (:$raw = False) {
    returnObject(
      i_cal_property_get_estimatedduration(self.ICalProperty),
      $raw,
      ICalDuration,
      ICal::GLib::Duration
    );
  }

  method set_estimatedduration ($v is copy) {
    i_cal_property_set_estimatedduration(
      self.ICalProperty,
      my $vv = resolveICalDuration($v)
    );
    $vv;
  }
}

class ICal::GLib::DerivedProperty::ExDate is ICal::GLib::Property {

  method new (ICalTime() $v) {
    my $ical-property = i_cal_property_new_exdate($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method exdate (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_exdate(:$raw) },
      STORE => -> $, \v { self.set_exdate(v)     };
  }

  method get_exdate (:$raw = False) {
    returnObject(
      i_cal_property_get_exdate(self.ICalProperty),
      $raw,
      ICalTime.
      ICal::GLib::Time
    );
  }

  multi method set_exdate ($v) {
    i_cal_property_set_exdate(
      self.ICalProperty,
      my $vv = resolveICalTime($v)
    );
    $vv
  }

}

class ICal::GLib::DerivedProperty::Expand is ICal::GLib::Property {

  method new (Int() $v) {
    my int32 $vv = $v;

    my $ical-property = i_cal_property_new_expand($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method expand is rw {
    Proxy.new:
      FETCH => -> $     { self.get_expand    },
      STORE => -> $, \v { self.set_expand(v) };
  }

  method get_expand {
    so i_cal_property_get_expand(self.ICalProperty);
  }

  method set_expand (Int() $v) {
    my int32 $vv = $v.so.Int;

    i_cal_property_set_expand(self.ICalProperty, $vv);
    $v;
  }

}

class ICal::GLib::DerivedProperty::ExRule is ICal::GLib::Property {

  method new (ICalRecurrence() $v) {
    my $ical-property = i_cal_property_new_exrule($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method exrule (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_exrule(:$raw) },
      STORE => -> $, \v { self.set_exrule(v)     };
  }

  method get_exrule (:$raw = False)  {
    returnObject(
      i_cal_property_get_exrule(self.ICalProperty),
      $raw,
      ICalRecurrence,
      ICal::GLib::Recurrence
    );
  }

  method set_exrule ($v) {
    i_cal_property_set_exrule(
      self.ICalProperty,
      my $vv = resolveICalRecurrence($v)
    );
    $vv;
  }

}

class ICal::GLib::DerivedProperty::FreeBusy is ICal::GLib::Property {

  method new (ICalPeriod() $v) {
    my $ical-property = i_cal_property_new_freebusy($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method freebusy (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_freebusy(:$raw) },
      STORE => -> $, \v { self.set_freebusy(v)     };
  }

  method get_freebusy (:$raw = False) {
    returnObject(
      i_cal_property_get_freebusy(self.ICalProperty),
      $raw,
      ICalPeriod,
      ICal::GLib::Period
    );
  }

  method set_freebusy ($v) {
    i_cal_property_set_freebusy(
      self.ICalProperty,
      my $vv = resolveICalPeriod($v)
    );
    $vv;
  }

}

class ICal::GLib::DerivedProperty::Geo is ICal::GLib::Property {

  method new (ICalGeo() $v) {
    my $ical-property = i_cal_property_new_geo($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method geo (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_geo(:$raw) },
      STORE => -> $, \v { self.set_geo(v)     };
  }

  method get_geo (:$raw = False) {
    returnObject(
      i_cal_property_get_geo(self.ICalProperty),
      $raw,
      ICalGeo,
      ICal::GLib::Geo
    );
  }

  method set_geo ($v) {
    i_cal_property_set_geo(
      self.ICalProperty,
      my $vv = resolveICalGeo($v)
    );
    $vv;
  }

}

class ICal::GLib::DerivedProperty::Grant is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_grant($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method grant is rw {
    Proxy.new:
      FETCH => -> $     { self.get_grant    },
      STORE => -> $, \v { self.set_grant(v) };
  }

  method get_grant {
    i_cal_property_get_grant(self.ICalProperty);
  }

  method set_grant (Str() $v) {
    i_cal_property_set_grant(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::ITIPVersion is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_itipversion($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method itipversion is rw {
    Proxy.new:
      FETCH => -> $     { self.get_itipversion    },
      STORE => -> $, \v { self.set_itipversion(v) };
  }

  method get_itipversion {
    i_cal_property_get_itipversion(self.ICalProperty);
  }

  method set_itipversion (Str() $v) {
    i_cal_property_set_itipversion(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::LastModified is ICal::GLib::Property {

  method new (ICalTime() $v) {
    my $ical-property = i_cal_property_new_lastmodified($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method lastmodified (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_lastmodified(:$raw) },
      STORE => -> $, \v { self.set_lastmodified(v)     };
  }

  method get_lastmodified (:$raw = False) {
    returnObject(
      i_cal_property_get_lastmodified(self.ICalProperty),
      $raw,
      ICalTime,
      ICal::GLib::Time
    );
  }

  method set_lastmodified ($v) {
    i_cal_property_set_lastmodified(
      self.ICalProperty,
      my $vv = resolveICalTime($v)
    );
    $vv;
  }

}

class ICal::GLib::DerivedProperty::Location is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_location($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method location is rw {
    Proxy.new:
      FETCH => -> $     { self.get_location    },
      STORE => -> $, \v { self.set_location(v) };
  }

  method get_location {
    i_cal_property_get_location(self.ICalProperty);
  }

  method set_location (Str() $v) {
    i_cal_property_set_location(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::MaxComponentSize is ICal::GLib::Property {

  method new (Int() $v) {
    my int32 $vv = $v;

    my $ical-property = i_cal_property_new_maxcomponentsize($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method maxcomponentsize is rw {
    Proxy.new:
      FETCH => -> $     { self.get_maxcomponentsize    },
      STORE => -> $, \v { self.set_maxcomponentsize(v) };
  }

  method get_maxcomponentsize {
    i_cal_property_get_maxcomponentsize(self.ICalProperty);
  }

  method set_maxcomponentsize (Int() $v) {
    my int32 $vv = $v;

    i_cal_property_set_maxcomponentsize(self.ICalProperty, $vv);
    $v;
  }
}

class ICal::GLib::DerivedProperty::MaxDate is ICal::GLib::Property {

  method new (ICalTime() $v) { my
    $ical-property = i_cal_property_new_maxdate($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method maxdate (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_maxdate(:$raw) },
      STORE => -> $, \v { self.set_maxdate(v)     };
  }

  method get_maxdate (:$raw = False) {
    returnObject(
      i_cal_property_get_maxdate(self.ICalProperty),
      $raw,
      ICalTime,
      ICal::GLib::Time
    )
  }

  method set_maxdate ($v) {
    i_cal_property_set_maxdate(
      self.ICalProperty,
      my $vv = resolveICalTime($v)
    );
    $vv;
  }

}

class ICal::GLib::DerivedProperty::MaxResults is ICal::GLib::Property {

  method new (Int() $v) {
    my int32 $vv = $v;

    my $ical-property = i_cal_property_new_maxresults($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method maxresults is rw {
    Proxy.new:
      FETCH => -> $     { self.get_maxresults    },
      STORE => -> $, \v { self.set_maxresults(v) };
  }

  method get_maxresults {
    i_cal_property_get_maxresults(self.ICalProperty);
  }

  method set_maxresults (Int() $v) {
    my int32 $vv = $v;

    i_cal_property_set_maxresults(self.ICalProperty, $vv);
    $v;
  }

}

class ICal::GLib::DerivedProperty::MaxResultsSize is ICal::GLib::Property {

  method new (Int() $v) {
    my int32 $vv = $v;

    my $ical-property = i_cal_property_new_maxresultssize($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method maxresultssize is rw {
    Proxy.new:
      FETCH => -> $     { self.get_maxresultssize    },
      STORE => -> $, \v { self.set_maxresultssize(v) };
  }

  method get_maxresultssize {
    i_cal_property_get_maxresultssize(self.ICalProperty);
  }

  method set_maxresultssize (Int() $v) {
    my int32 $vv = $v;

    i_cal_property_set_maxresultssize(self.ICalProperty, $vv);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Method is ICal::GLib::Property {

  method new (Int() $v) {
    my ICalPropertyMethod $vv = $v;

    my $ical-property = i_cal_property_new_method($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method method is rw {
    Proxy.new:
      FETCH => -> $     { self.get_method    },
      STORE => -> $, \v { self.set_method(v) };
  }

  method get_method {
    ICalPropertyMethodEnum(
      i_cal_property_get_method(self.ICalProperty)
    );
  }

  method set_method (Int() $v) {
    my ICalPropertyMethod $vv = $v;

    i_cal_property_set_method(self.ICalProperty, $vv);
    ICalPropertyMethodEnum($v);
  }

}

class ICal::GLib::DerivedProperty::MinDate is ICal::GLib::Property {

  method new (ICalTime() $v) {
    my $ical-property = i_cal_property_new_mindate($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method mindate (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_mindate(:$raw) },
      STORE => -> $, \v { self.set_mindate(v)     };
  }

  method get_mindate (:$raw = False) {
    returnObject(
      i_cal_property_get_mindate(self.ICalProperty),
      $raw,
      ICalTime,
      ICal::GLib::Time
    );
  }

  method set_mindate (ICalTime() $v) {
    i_cal_property_set_mindate(
      self.ICalProperty,
      my $vv = resolveICalTime($v)
    );
    $vv;
  }

}

class ICal::GLib::DerivedProperty::Multipart is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_multipart($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method multipart is rw {
    Proxy.new:
      FETCH => -> $     { self.get_multipart    },
      STORE => -> $, \v { self.set_multipart(v) };
  }

  method get_multipart {
    i_cal_property_get_multipart(self.ICalProperty);
  }

  method set_multipart (Str() $v) {
    i_cal_property_set_multipart(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Name is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_name($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method name is rw {
    Proxy.new:
      FETCH => -> $     { self.get_name    },
      STORE => -> $, \v { self.set_name(v) };
  }

  method get_name {
    i_cal_property_get_name(self.ICalProperty);
  }

  method set_name (Str() $v) {
    i_cal_property_set_name(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Organizer is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_organizer($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method organizer is rw {
    Proxy.new:
      FETCH => -> $     { self.get_organizer    },
      STORE => -> $, \v { self.set_organizer(v) };
  }

  method get_organizer {
    i_cal_property_get_organizer(self.ICalProperty);
  }

  method set_organizer (Str() $v) {
    i_cal_property_set_organizer(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Owner is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_owner($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method owner is rw {
    Proxy.new:
      FETCH => -> $     { self.get_owner    },
      STORE => -> $, \v { self.set_owner(v) };
  }

  method get_owner {
    i_cal_property_get_owner(self.ICalProperty);
  }

  method set_owner (Str() $v) {
    i_cal_property_set_owner(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::PercentComplete is ICal::GLib::Property {

  method new (Int() $v) {
    my int32 $vv = $v;

    my $ical-property = i_cal_property_new_percentcomplete($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method percentcomplete is rw {
    Proxy.new:
      FETCH => -> $     { self.get_percentcomplete    },
      STORE => -> $, \v { self.set_percentcomplete(v) };
  }

  method get_percentcomplete {
    i_cal_property_get_percentcomplete(self.ICalProperty);
  }

  method set_percentcomplete (Int() $v) {
    my int32 $vv = $v;

    i_cal_property_set_percentcomplete(self.ICalProperty, $vv);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Permission is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_permission($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method permission is rw {
    Proxy.new:
      FETCH => -> $     { self.get_permission    },
      STORE => -> $, \v { self.set_permission(v) };
  }

  method get_permission {
    i_cal_property_get_permission(self.ICalProperty);
  }

  method set_permission (Str() $v) {
    i_cal_property_set_permission(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::PollCompletion is ICal::GLib::Property {

  method new (Int() $v) {
    my int32 $vv = $v;

    my $ical-property = i_cal_property_new_pollcompletion($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method pollcompletion is rw {
    Proxy.new:
      FETCH => -> $     { self.get_pollcompletion    },
      STORE => -> $, \v { self.set_pollcompletion(v) };
  }

  method get_pollcompletion {
    ICalPropertyPollCompletionEnum(
      i_cal_property_get_pollcompletion(self.ICalProperty)
    );
  }

  method set_pollcompletion (Int() $v) {
    my ICalPropertyPollCompletion $vv = $v;

    i_cal_property_set_pollcompletion(self.ICalProperty, $vv);
    ICalPropertyPollCompletionEnum($v)
  }

}

class ICal::GLib::DerivedProperty::PollItemId is ICal::GLib::Property {

  method new (Int() $v) {
    my int32 $vv = $v;

    my $ical-property = i_cal_property_new_pollitemid($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method pollitemid is rw {
    Proxy.new:
      FETCH => -> $     { self.get_pollitemid    },
      STORE => -> $, \v { self.set_pollitemid(v) };
  }

  method get_pollitemid {
    i_cal_property_get_pollitemid(self.ICalProperty);
  }

  method set_pollitemid (Int() $v) {
    my int32 $vv = $v;

    i_cal_property_set_pollitemid(self.ICalProperty, $vv);
    $v;
  }

}

class ICal::GLib::DerivedProperty::PollMode is ICal::GLib::Property {

  method new (Int() $v) {
    my int32 $vv = $v;

    my $ical-property = i_cal_property_new_pollmode($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method pollmode is rw {
    Proxy.new:
      FETCH => -> $     { self.get_pollmode    },
      STORE => -> $, \v { self.set_pollmode(v) };
  }

  method get_pollmode {
    ICalPropertyPollModeEnum(
      i_cal_property_get_pollmode(self.ICalProperty)
    )
  }

  method set_pollmode (Int() $v) {
    my ICalPropertyPollMode $vv = $v;

    i_cal_property_set_pollmode(self.ICalProperty, $vv);
    ICalPropertyPollModeEnum($v);
  }
}

class ICal::GLib::DerivedProperty::PollProperties is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_pollproperties($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method pollproperties is rw {
    Proxy.new:
      FETCH => -> $     { self.get_pollproperties    },
      STORE => -> $, \v { self.set_pollproperties(v) };
  }

  method get_pollproperties {
    i_cal_property_get_pollproperties(self.ICalProperty);
  }

  method set_pollproperties (Str() $v) {
    i_cal_property_set_pollproperties(self.ICalProperty, $v);
  }

}

class ICal::GLib::DerivedProperty::PollWinner is ICal::GLib::Property {

  method new (Int() $v) {
    my int32 $vv = $v;

    my $ical-property = i_cal_property_new_pollwinner($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method pollwinner is rw {
    Proxy.new:
      FETCH => -> $     { self.get_pollwinner    },
      STORE => -> $, \v { self.set_pollwinner(v) };
  }

  method get_pollwinner {
    i_cal_property_get_pollwinner(self.ICalProperty);
  }

  method set_pollwinner (Int() $v) {
    my int32 $vv = $v;

    i_cal_property_set_pollwinner(self.ICalProperty, $vv);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Priority is ICal::GLib::Property {
  method new (int32 $v) {
    my int32 $vv = $v;

    my $ical-property = i_cal_property_new_priority($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method priority is rw {
    Proxy.new:
      FETCH => -> $     { self.get_priority    },
      STORE => -> $, \v { self.set_priority(v) };
  }

  method get_priority {
    i_cal_property_get_priority(self.ICalProperty);
  }

  method set_priority (Int() $v) {
    my int32 $vv = $v;

    i_cal_property_set_priority(self.ICalProperty, $vv);
    $v;
  }
}

class ICal::GLib::DerivedProperty::ProdId is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_prodid($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method prodid is rw {
    Proxy.new:
      FETCH => -> $     { self.get_prodid    },
      STORE => -> $, \v { self.set_prodid(v) };
  }

  method get_prodid {
    i_cal_property_get_prodid(self.ICalProperty);
  }

  method set_prodid (Str() $v) {
    i_cal_property_set_prodid(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Query is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_query($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method query is rw {
    Proxy.new:
      FETCH => -> $     { self.get_query    },
      STORE => -> $, \v { self.set_query(v) };
  }

  method get_query {
    i_cal_property_get_query(self.ICalProperty);
  }

  method set_query (Str() $v) {
    i_cal_property_set_query(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::QueryId is ICal::GLib::Property {

  method new (Str() $v) {

    my $ical-property = i_cal_property_new_queryid($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method queryid is rw {
    Proxy.new:
      FETCH => -> $     { self.get_queryid    },
      STORE => -> $, \v { self.set_queryid(v) };
  }

  method get_queryid {
    i_cal_property_get_queryid(self.ICalProperty);
  }

  method set_queryid (Str() $v) {
    i_cal_property_set_queryid(self.ICalProperty, $v);
    $v
  }

}

class ICal::GLib::DerivedProperty::QueryLevel is ICal::GLib::Property {

  method new (Int() $v) {
    my ICalPropertyQueryLevel $vv = $v;

    my $ical-property = i_cal_property_new_querylevel($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method querylevel is rw {
    Proxy.new:
      FETCH => -> $     { self.get_querylevel    },
      STORE => -> $, \v { self.set_querylevel(v) };
  }

  method get_querylevel {
    ICalPropertyQueryLevelEnum(
      i_cal_property_get_querylevel(self.ICalProperty)
    );
  }

  method set_querylevel (Int() $v) {
    my ICalPropertyQueryLevel $vv = $v;

    i_cal_property_set_querylevel(self.ICalProperty, $vv);
    ICalPropertyQueryLevelEnum($v);
  }

}

class ICal::GLib::DerivedProperty::QueryName is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_queryname($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method queryname is rw {
    Proxy.new:
      FETCH => -> $     { self.get_queryname    },
      STORE => -> $, \v { self.set_queryname(v) };
  }

  method get_queryname {
    i_cal_property_get_queryname(self.ICalProperty);
  }

  method set_queryname (Str() $v) {
    i_cal_property_set_queryname(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::RDate is ICal::GLib::Property {

  method new (ICalDatetimeperiod() $v) {
    my $ical-property = i_cal_property_new_rdate($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method rdate is rw {
    Proxy.new:
      FETCH => -> $     { self.get_rdate    },
      STORE => -> $, \v { self.set_rdate(v) };
  }

  method get_rdate {
    i_cal_property_get_rdate(self.ICalProperty);
  }

  method set_rdate (ICalDatetimeperiod() $v) {
    i_cal_property_set_rdate(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::RecurAccepted is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_recuraccepted($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method recuraccepted is rw {
    Proxy.new:
      FETCH => -> $     { self.get_recuraccepted    },
      STORE => -> $, \v { self.set_recuraccepted(v) };
  }

  method get_recuraccepted {
    i_cal_property_get_recuraccepted(self.ICalProperty);
  }

  method set_recuraccepted (Str() $v) {
    i_cal_property_set_recuraccepted(self.ICalProperty, $v);
  }

}

class ICal::GLib::DerivedProperty::RecurExpand is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_recurexpand($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method recurexpand is rw {
    Proxy.new:
      FETCH => -> $     { self.get_recurexpand    },
      STORE => -> $, \v { self.set_recurexpand(v) };
  }

  method get_recurexpand {
    i_cal_property_get_recurexpand(self.ICalProperty);
  }

  method set_recurexpand (Str() $v) {
    i_cal_property_set_recurexpand(self.ICalProperty, $v);
    $v
  }
}

class ICal::GLib::DerivedProperty::RecurLimit is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_recurlimit($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method recurlimit is rw {
    Proxy.new:
      FETCH => -> $     { self.get_recurlimit    },
      STORE => -> $, \v { self.set_recurlimit(v) };
  }

  method get_recurlimit {
    i_cal_property_get_recurlimit(self.ICalProperty);
  }

  method set_recurlimit (Str() $v) {
    i_cal_property_set_recurlimit(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::RecurrenceId is ICal::GLib::Property {

  method new (ICalTime() $v) {
    my $ical-property = i_cal_property_new_recurrenceid($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method recurrenceid is rw {
    Proxy.new:
      FETCH => -> $     { self.get_recurrenceid    },
      STORE => -> $, \v { self.set_recurrenceid(v) };
  }

  method get_recurrenceid {
    i_cal_property_get_recurrenceid(self.ICalProperty);
  }

  method set_recurrenceid ($v) {
    i_cal_property_set_recurrenceid(
      self.ICalProperty,
      my $vv = resolveICalTime($v)
    );
  }

}

class ICal::GLib::DerivedProperty::RelatedTo is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_relatedto($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method relatedto is rw {
    Proxy.new:
      FETCH => -> $     { self.get_relatedto    },
      STORE => -> $, \v { self.set_relatedto(v) };
  }

  method get_relatedto {
    i_cal_property_get_relatedto(self.ICalProperty);
  }

  method set_relatedto (Str() $v) {
    i_cal_property_set_relatedto(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::RelCalId is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_relcalid($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method relcalid is rw {
    Proxy.new:
      FETCH => -> $     { self.get_relcalid    },
      STORE => -> $, \v { self.set_relcalid(v) };
  }

  method get_relcalid {
    i_cal_property_get_relcalid(self.ICalProperty);
  }

  method set_relcalid (Str() $v) {
    i_cal_property_set_relcalid(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Repeat is ICal::GLib::Property {

  method new (Int() $v) {
    my int32 $vv = $v;

    my $ical-property = i_cal_property_new_repeat($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method repeat is rw {
    Proxy.new:
      FETCH => -> $     { self.get_repeat    },
      STORE => -> $, \v { self.set_repeat(v) };
  }

  method get_repeat {
    i_cal_property_get_repeat(self.ICalProperty);
  }

  method set_repeat (Int() $v) {
    my int32 $vv = $v;

    i_cal_property_set_repeat(self.ICalProperty, $vv);
    $vv;
  }
}

class ICal::GLib::DerivedProperty::ReplyURL is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_replyurl($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method replyurl is rw {
    Proxy.new:
      FETCH => -> $     { self.get_replyurl    },
      STORE => -> $, \v { self.set_replyurl(v) };
  }

  method get_replyurl {
    i_cal_property_get_replyurl(self.ICalProperty);
  }

  method set_replyurl (Str() $v) {
    i_cal_property_set_replyurl(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::RequestStatus is ICal::GLib::Property {

  method new (ICalReqstat() $v) {
    my $ical-property = i_cal_property_new_requeststatus($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method requeststatus (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_requeststatus(:$raw) },
      STORE => -> $, \v { self.set_requeststatus(v)     };
  }

  method get_requeststatus (:$raw = False) {
    returnObject(
      i_cal_property_get_requeststatus(self.ICalProperty),
      $raw,
      ICalReqstat,
      ICal::GLib::ReqStat
    );
  }

  method set_requeststatus (ICalReqstat() $v) {
    i_cal_property_set_requeststatus(
      self.ICalProperty,
      my $vv = resolveICalReqstat($v)
    );
    $vv;
  }
}

class ICal::GLib::DerivedProperty::Resources is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_resources($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method resources is rw {
    Proxy.new:
      FETCH => -> $     { self.get_resources    },
      STORE => -> $, \v { self.set_resources(v) };
  }

  method get_resources {
    i_cal_property_get_resources(self.ICalProperty);
  }

  method set_resources (Str() $v) {
    i_cal_property_set_resources(self.ICalProperty, $v);
    $v;
  }
}

class ICal::GLib::DerivedProperty::Response is ICal::GLib::Property {

  method new (Int() $v) {
    my int32 $vv = $v;

    my $ical-property = i_cal_property_new_response($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method response is rw {
    Proxy.new:
      FETCH => -> $     { self.get_response    },
      STORE => -> $, \v { self.set_response(v) };
  }

  method get_response {
    i_cal_property_get_response(self.ICalProperty);
  }

  method set_response (Int() $v) {
    my int32 $vv = $v;

    i_cal_property_set_response(self.ICalProperty, $v);
    $vv;
  }
}

class ICal::GLib::DerivedProperty::Restriction is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_restriction($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method restriction is rw {
    Proxy.new:
      FETCH => -> $     { self.get_restriction    },
      STORE => -> $, \v { self.set_restriction(v) };
  }

  method get_restriction {
    i_cal_property_get_restriction(self.ICalProperty);
  }

  method set_restriction (Str() $v) {
    i_cal_property_set_restriction(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::RRule is ICal::GLib::Property {

  method new (ICalRecurrence() $v) {
    my $ical-property = i_cal_property_new_rrule($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method rrule (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_rrule(:$raw) },
      STORE => -> $, \v { self.set_rrule(v)     };
  }

  method get_rrule (:$raw = False) {
    returnObject(
      i_cal_property_get_rrule(self.ICalProperty),
      $raw,
      ICalProperty,
      ICal::GLib::property
    );
  }

  method set_rrule (ICalRecurrence() $v) {
    i_cal_property_set_rrule(
      self.ICalProperty,
      my $vv = resolveICalRecurrence($v)
    );
    $vv
  }
}

class ICal::GLib::DerivedProperty::Scope is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_scope($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method scope is rw {
    Proxy.new:
      FETCH => -> $     { self.get_scope    },
      STORE => -> $, \v { self.set_scope(v) };
  }

  method get_scope {
    i_cal_property_get_scope(self.ICalProperty);
  }

  method set_scope (Str() $v) {
    i_cal_property_set_scope(self.ICalProperty, $v);
    $v;
  }
}

class ICal::GLib::DerivedProperty::Sequence is ICal::GLib::Property {
  method new (Int() $v) {
    my $ical-property = i_cal_property_new_sequence($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method sequence is rw {
    Proxy.new:
      FETCH => -> $     { self.get_sequence    },
      STORE => -> $, \v { self.set_sequence(v) };
  }

  method get_sequence {
    i_cal_property_get_sequence(self.ICalProperty);
  }

  method set_sequence (Int() $v) {
    my int32 $vv = $v;
    i_cal_property_set_sequence(self.ICalProperty, $vv);
    $vv;
  }
}

class ICal::GLib::DerivedProperty::Status is ICal::GLib::Property {

  method new (Int() $v) {
    my ICalPropertyStatus $vv = $v;

    my $ical-property = i_cal_property_new_status($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method status is rw {
    Proxy.new:
      FETCH => -> $     { self.get_status    },
      STORE => -> $, \v { self.set_status(v) };
  }

  method get_status {
    ICalPropertyStatusEnum(
      i_cal_property_get_status(self.ICalProperty)
    );
  }

  method set_status (Int() $v) {
    my ICalPropertyStatus $vv = $v;

    i_cal_property_set_status(self.ICalProperty, $vv);
    ICalPropertyStatusEnum($vv)
  }
}

class ICal::GLib::DerivedProperty::StoresExpanded is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_storesexpanded($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method storesexpanded is rw {
    Proxy.new:
      FETCH => -> $     { self.get_storesexpanded    },
      STORE => -> $, \v { self.set_storesexpanded(v) };
  }

  method get_storesexpanded {
    i_cal_property_get_storesexpanded(self.ICalProperty);
  }

  method set_storesexpanded (Str() $v) {
    i_cal_property_set_storesexpanded(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Summary is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_summary($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method summary is rw {
    Proxy.new:
      FETCH => -> $     { self.get_summary    },
      STORE => -> $, \v { self.set_summary(v) };
  }

  method get_summary {
    i_cal_property_get_summary(self.ICalProperty);
  }

  method set_summary (Str() $v) {
    i_cal_property_set_summary(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Target is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_target($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method target is rw {
    Proxy.new:
      FETCH => -> $     { self.get_target    },
      STORE => -> $, \v { self.set_target(v) };
  }

  method get_target {
    i_cal_property_get_target(self.ICalProperty);
  }

  method set_target (Str() $v) {
    i_cal_property_set_target(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Taskmode is ICal::GLib::Property {

  method new (Int() $v) {
    my ICalPropertyTaskMode $vv = $v;

    my $ical-property = i_cal_property_new_taskmode($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method taskmode is rw {
    Proxy.new:
      FETCH => -> $     { self.get_taskmode    },
      STORE => -> $, \v { self.set_taskmode(v) };
  }

  method get_taskmode {
    ICalPropertyTaskModeEnum(
      i_cal_property_get_taskmode(self.ICalProperty)
    )
  }

  method set_taskmode (Int() $v) {
    my ICalPropertyTaskMode $vv = $v;

    i_cal_property_set_taskmode(self.ICalProperty, $vv);
    ICalPropertyTaskModeEnum($v);
  }

}

class ICal::GLib::DerivedProperty::Transp is ICal::GLib::Property {
  method new (uint32 $v) {
    my ICalPropertyTransp $vv = $v;

    my $ical-property = i_cal_property_new_transp($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method transp is rw {
    Proxy.new:
      FETCH => -> $     { self.get_transp    },
      STORE => -> $, \v { self.set_transp(v) };
  }

  method get_transp {
    ICalPropertyTranspEnum(
      i_cal_property_get_transp(self.ICalProperty)
    );
  }

  method set_transp (Int() $v) {
    my ICalPropertyTransp $vv = $v;

    i_cal_property_set_transp(self.ICalProperty, $vv);
    ICalPropertyTranspEnum($v);
  }
}

class ICal::GLib::DerivedProperty::Trigger is ICal::GLib::Property {

  method new (ICalTrigger() $v) {
    my $ical-property = i_cal_property_new_trigger($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method trigger (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_trigger(:$raw) },
      STORE => -> $, \v { self.set_trigger(v)     };
  }

  method get_trigger (:$raw = False) {
    returnObject(
      i_cal_property_get_trigger(self.ICalProperty),
      $raw,
      ICalTrigger,
      ICal::GLib::Trigger
    );
  }

  method set_trigger ($v) {
    i_cal_property_set_trigger(
      self.ICalProperty,
      my $vv = resolveICalTrigger($v)
    );
    $vv;
  }
}

class ICal::GLib::DerivedProperty::TZId is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_tzid($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method tzid is rw {
    Proxy.new:
      FETCH => -> $     { self.get_tzid    },
      STORE => -> $, \v { self.set_tzid(v) };
  }

  method get_tzid {
    i_cal_property_get_tzid(self.ICalProperty);
  }

  method set_tzid (Str() $v) {
    i_cal_property_set_tzid(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::TZIdAliasOf is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_tzidaliasof($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method tzidaliasof is rw {
    Proxy.new:
      FETCH => -> $     { self.get_tzidaliasof    },
      STORE => -> $, \v { self.set_tzidaliasof(v) };
  }

  method get_tzidaliasof {
    i_cal_property_get_tzidaliasof(self.ICalProperty);
  }

  method set_tzidaliasof (Str() $v) {
    i_cal_property_set_tzidaliasof(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::TZName is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_tzname($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method tzname is rw {
    Proxy.new:
      FETCH => -> $     { self.get_tzname    },
      STORE => -> $, \v { self.set_tzname(v) };
  }

  method get_tzname {
    i_cal_property_get_tzname(self.ICalProperty);
  }

  method set_tzname (Str() $v) {
    i_cal_property_set_tzname(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::TZOffsetFrom is ICal::GLib::Property {

  method new (Int() $v) {
    my int32 $vv = $v;

    my $ical-property = i_cal_property_new_tzoffsetfrom($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method tzoffsetfrom is rw {
    Proxy.new:
      FETCH => -> $     { self.get_tzoffsetfrom    },
      STORE => -> $, \v { self.set_tzoffsetfrom(v) };
  }

  method get_tzoffsetfrom {
    i_cal_property_get_tzoffsetfrom(self.ICalProperty);
  }

  method set_tzoffsetfrom (Int() $v) {
    my int32 $vv = $v;

    i_cal_property_set_tzoffsetfrom(self.ICalProperty, $vv);
    $v;
  }

}

class ICal::GLib::DerivedProperty::TZOffsetTo is ICal::GLib::Property {

  method new (Int() $v) {
    my int32 $vv = $v;

    my $ical-property = i_cal_property_new_tzoffsetto($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method tzoffsetto is rw {
    Proxy.new:
      FETCH => -> $     { self.get_tzoffsetto    },
      STORE => -> $, \v { self.set_tzoffsetto(v) };
  }

  method get_tzoffsetto {
    i_cal_property_get_tzoffsetto(self.ICalProperty);
  }

  method set_tzoffsetto (Int() $v) {
    my int32 $vv = $v;
    i_cal_property_set_tzoffsetto(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::TZUntil is ICal::GLib::Property {

  method new (ICalTime() $v) {
    my $ical-property = i_cal_property_new_tzuntil($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method tzuntil (:$raw = False) is rw {
    Proxy.new:
      FETCH => -> $     { self.get_tzuntil(:$raw) },
      STORE => -> $, \v { self.set_tzuntil(v)     };
  }

  method get_tzuntil (:$raw = False) {
    returnObject(
      i_cal_property_get_tzuntil(self.ICalProperty),
      $raw,
      ICalTime,
      ICal::GLib::Time
    );
  }

  method set_tzuntil ($v) {
    i_cal_property_set_tzuntil( self.ICalProperty, my $vv = resolveICalTime($v) );
    $v;
  }
}

class ICal::GLib::DerivedProperty::TZUrl is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_tzurl($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method tzurl is rw {
    Proxy.new:
      FETCH => -> $     { self.get_tzurl    },
      STORE => -> $, \v { self.set_tzurl(v) };
  }

  method get_tzurl {
    i_cal_property_get_tzurl(self.ICalProperty);
  }

  method set_tzurl (Str() $v is copy) {
    i_cal_property_set_tzurl(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Uid is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_uid($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method uid is rw {
    Proxy.new:
      FETCH => -> $     { self.get_uid    },
      STORE => -> $, \v { self.set_uid(v) };
  }

  method get_uid {
    i_cal_property_get_uid(self.ICalProperty);
  }

  method set_uid (Str() $v) {
    i_cal_property_set_uid(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::URL is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_url($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method url is rw {
    Proxy.new:
      FETCH => -> $     { self.get_url    },
      STORE => -> $, \v { self.set_url(v) };
  }

  method get_url {
    i_cal_property_get_url(self.ICalProperty);
  }

  method set_url (Str() $v) {
    i_cal_property_set_url(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Version is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_version($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method version is rw {
    Proxy.new:
      FETCH => -> $     { self.get_version    },
      STORE => -> $, \v { self.set_version(v) };
  }

  method get_version {
    i_cal_property_get_version(self.ICalProperty);
  }

  method set_version (Str() $v) {
    i_cal_property_set_version(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::Voter is ICal::GLib::Property {\

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_voter($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method voter is rw {
    Proxy.new:
      FETCH => -> $     { self.get_voter    },
      STORE => -> $, \v { self.set_voter(v) };
  }

  method get_voter {
    i_cal_property_get_voter(self.ICalProperty);
  }

  method set_voter (Str() $v) {
    i_cal_property_set_voter(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::X is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_x($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method x is rw {
    Proxy.new:
      FETCH => -> $     { self.get_x    },
      STORE => -> $, \v { self.set_x(v) };
  }

  method get_x {
    i_cal_property_get_x(self.ICalProperty);
  }

  method set_x (Str() $v) {
    i_cal_property_set_x(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedPoperty::XLicClass is ICal::GLib::Property {

  method new (Int() $v) {
    my ICalPropertyXLicClass $vv = $v;

    my $ical-property = i_cal_property_new_xlicclass($vv);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method xlicclass is rw {
    Proxy.new:
      FETCH => -> $     { self.get_xlicclass    },
      STORE => -> $, \v { self.set_xlicclass(v) };
  }

  method get_xlicclass {
    ICalPropertyXLicClassEnum(
      i_cal_property_get_xlicclass(self.ICalProperty)
    )
  }

  method set_xlicclass (Int() $v) {
    my ICalPropertyXLicClass $vv = $v;

    i_cal_property_set_xlicclass(self.ICalProperty, $vv);
    ICalPropertyXLicClassEnum($v);
  }

}

class ICal::GLib::DerivedProperty::XLicClusterCount is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_xlicclustercount($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method xlicclustercount is rw {
    Proxy.new:
      FETCH => -> $     { self.get_xlicclustercount    },
      STORE => -> $, \v { self.set_xlicclustercount(v) };
  }

  method get_xlicclustercount {
    i_cal_property_get_xlicclustercount(self.ICalProperty);
  }

  method set_xlicclustercount (Str() $v) {
    i_cal_property_set_xlicclustercount(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::XLicError is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_xlicerror($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method xlicerror is rw {
    Proxy.new:
      FETCH => -> $     { self.get_xlicerror    },
      STORE => -> $, \v { self.set_xlicerror(v) };
  }

  method get_xlicerror {
    i_cal_property_get_xlicerror(self.ICalProperty);
  }

  method set_xlicerror (Str() $v) {
    i_cal_property_set_xlicerror(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::XLicMIMECharset is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_xlicmimecharset($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method xlicmimecharset is rw {
    Proxy.new:
      FETCH => -> $     { self.get_xlicmimecharset    },
      STORE => -> $, \v { self.set_xlicmimecharset(v) };
  }

  method get_xlicmimecharset {
    i_cal_property_get_xlicmimecharset(self.ICalProperty);
  }

  method set_xlicmimecharset (Str() $v) {
    i_cal_property_set_xlicmimecharset(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::XLicMIMECid is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_xlicmimecid($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method xlicmimecid is rw {
    Proxy.new:
      FETCH => -> $     { self.get_xlicmimecid    },
      STORE => -> $, \v { self.set_xlicmimecid(v) };
  }

  method get_xlicmimecid {
    i_cal_property_get_xlicmimecid(self.ICalProperty);
  }

  method set_xlicmimecid (Str() $v) {
    i_cal_property_set_xlicmimecid(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::XLicMIMEContentType is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_xlicmimecontenttype($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method xlicmimecontenttype is rw {
    Proxy.new:
      FETCH => -> $     { self.get_xlicmimecontenttype    },
      STORE => -> $, \v { self.set_xlicmimecontenttype(v) };
  }

  method get_xlicmimecontenttype {
    i_cal_property_get_xlicmimecontenttype(self.ICalProperty);
  }

  method set_xlicmimecontenttype (Str() $v) {
    i_cal_property_set_xlicmimecontenttype(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::XLicMIMEEncoding is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_xlicmimeencoding($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method xlicmimeencoding is rw {
    Proxy.new:
      FETCH => -> $     { self.get_xlicmimeencoding    },
      STORE => -> $, \v { self.set_xlicmimeencoding(v) };
  }

  method get_xlicmimeencoding {
    i_cal_property_get_xlicmimeencoding(self.ICalProperty);
  }

  method set_xlicmimeencoding (Str() $v) {
    i_cal_property_set_xlicmimeencoding(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::XLicMIMEFilename is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_xlicmimefilename($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method xlicmimefilename is rw {
    Proxy.new:
      FETCH => -> $     { self.get_xlicmimefilename    },
      STORE => -> $, \v { self.set_xlicmimefilename(v) };
  }

  method get_xlicmimefilename {
    i_cal_property_get_xlicmimefilename(self.ICalProperty);
  }

  method set_xlicmimefilename (Str() $v) {
    i_cal_property_set_xlicmimefilename(self.ICalProperty, $v);
    $v;
  }

}

class ICal::GLib::DerivedProperty::XLicMIMEOptInfo is ICal::GLib::Property {

  method new (Str() $v) {
    my $ical-property = i_cal_property_new_xlicmimeoptinfo($v);

    $ical-property ?? self.bless( :$ical-property ) !! Nil;
  }

  method xlicmimeoptinfo is rw {
    Proxy.new:
      FETCH => -> $     { self.get_xlicmimeoptinfo    },
      STORE => -> $, \v { self.set_xlicmimeoptinfo(v) };
  }

  method get_xlicmimeoptinfo {
    i_cal_property_get_xlicmimeoptinfo(self.ICalProperty);
  }

  method set_xlicmimeoptinfo (Str() $v) {
    i_cal_property_set_xlicmimeoptinfo(self.ICalProperty, $v);
    $v;
  }

}
