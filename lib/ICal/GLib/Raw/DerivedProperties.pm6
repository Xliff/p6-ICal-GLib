use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;
use ICal::GLib::Raw::Enums;

### /usr/include/libical-glib/i-cal-derived-property.h

sub i_cal_property_get_acceptresponse (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_acknowledged (ICalProperty $prop)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_action (ICalProperty $prop)
  returns ICalPropertyAction
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_allowconflict (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_attach (ICalProperty $prop)
  returns ICalAttach
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_attendee (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_busytype (ICalProperty $prop)
  returns ICalPropertyBusytype
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_calid (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_calmaster (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_calscale (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_capversion (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_carid (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_carlevel (ICalProperty $prop)
  returns ICalPropertyCarlevel
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_categories (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_class (ICalProperty $prop)
  returns ICalProperty_Class
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_cmd (ICalProperty $prop)
  returns ICalPropertyCmd
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_color (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_comment (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_completed (ICalProperty $prop)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_components (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_contact (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_created (ICalProperty $prop)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_csid (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_datemax (ICalProperty $prop)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_datemin (ICalProperty $prop)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_decreed (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_defaultcharset (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_defaultlocale (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_defaulttzid (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_defaultvcars (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_deny (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_description (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_dtend (ICalProperty $prop)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_dtstamp (ICalProperty $prop)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_dtstart (ICalProperty $prop)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_due (ICalProperty $prop)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_duration (ICalProperty $prop)
  returns ICalDuration
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_estimatedduration (ICalProperty $prop)
  returns ICalDuration
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_exdate (ICalProperty $prop)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_expand (ICalProperty $prop)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_exrule (ICalProperty $prop)
  returns ICalRecurrence
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_freebusy (ICalProperty $prop)
  returns ICalPeriod
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_geo (ICalProperty $prop)
  returns ICalGeo
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_grant (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_itipversion (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_lastmodified (ICalProperty $prop)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_location (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_maxcomponentsize (ICalProperty $prop)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_maxdate (ICalProperty $prop)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_maxresults (ICalProperty $prop)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_maxresultssize (ICalProperty $prop)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_method (ICalProperty $prop)
  returns ICalPropertyMethod
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_mindate (ICalProperty $prop)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_multipart (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_name (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_organizer (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_owner (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_percentcomplete (ICalProperty $prop)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_permission (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_pollcompletion (ICalProperty $prop)
  returns ICalPropertyPollcompletion
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_pollitemid (ICalProperty $prop)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_pollmode (ICalProperty $prop)
  returns ICalPropertyPollmode
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_pollproperties (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_pollwinner (ICalProperty $prop)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_priority (ICalProperty $prop)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_prodid (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_query (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_queryid (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_querylevel (ICalProperty $prop)
  returns ICalPropertyQuerylevel
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_queryname (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_rdate (ICalProperty $prop)
  returns ICalDatetimeperiod
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_recuraccepted (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_recurexpand (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_recurlimit (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_recurrenceid (ICalProperty $prop)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_relatedto (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_relcalid (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_repeat (ICalProperty $prop)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_replyurl (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_requeststatus (ICalProperty $prop)
  returns ICalReqstat
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_resources (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_response (ICalProperty $prop)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_restriction (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_rrule (ICalProperty $prop)
  returns ICalRecurrence
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_scope (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_sequence (ICalProperty $prop)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_status (ICalProperty $prop)
  returns ICalPropertyStatus
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_storesexpanded (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_summary (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_target (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_taskmode (ICalProperty $prop)
  returns ICalPropertyTaskmode
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_transp (ICalProperty $prop)
  returns ICalPropertyTransp
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_trigger (ICalProperty $prop)
  returns ICalTrigger
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_tzid (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_tzidaliasof (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_tzname (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_tzoffsetfrom (ICalProperty $prop)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_tzoffsetto (ICalProperty $prop)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_tzuntil (ICalProperty $prop)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_tzurl (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_uid (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_url (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_version (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_voter (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_x (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_xlicclass (ICalProperty $prop)
  returns ICalPropertyXlicclass
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_xlicclustercount (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_xlicerror (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_xlicmimecharset (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_xlicmimecid (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_xlicmimecontenttype (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_xlicmimeencoding (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_xlicmimefilename (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_get_xlicmimeoptinfo (ICalProperty $prop)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_acceptresponse (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_acknowledged (ICalTime $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_action (ICalPropertyAction $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_allowconflict (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_attach (ICalAttach $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_attendee (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_busytype (ICalPropertyBusytype $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_calid (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_calmaster (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_calscale (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_capversion (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_carid (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_carlevel (ICalPropertyCarlevel $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_categories (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_class (ICalProperty_Class $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_cmd (ICalPropertyCmd $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_color (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_comment (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_completed (ICalTime $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_components (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_contact (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_created (ICalTime $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_csid (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_datemax (ICalTime $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_datemin (ICalTime $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_decreed (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_defaultcharset (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_defaultlocale (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_defaulttzid (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_defaultvcars (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_deny (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_description (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_dtend (ICalTime $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_dtstamp (ICalTime $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_dtstart (ICalTime $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_due (ICalTime $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_duration (ICalDuration $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_estimatedduration (ICalDuration $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_exdate (ICalTime $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_expand (gint $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_exrule (ICalRecurrence $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_freebusy (ICalPeriod $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_geo (ICalGeo $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_grant (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_itipversion (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_lastmodified (ICalTime $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_location (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_maxcomponentsize (gint $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_maxdate (ICalTime $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_maxresults (gint $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_maxresultssize (gint $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_method (ICalPropertyMethod $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_mindate (ICalTime $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_multipart (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_name (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_organizer (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_owner (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_percentcomplete (gint $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_permission (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_pollcompletion (ICalPropertyPollcompletion $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_pollitemid (gint $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_pollmode (ICalPropertyPollmode $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_pollproperties (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_pollwinner (gint $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_priority (gint $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_prodid (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_query (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_queryid (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_querylevel (ICalPropertyQuerylevel $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_queryname (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_rdate (ICalDatetimeperiod $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_recuraccepted (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_recurexpand (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_recurlimit (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_recurrenceid (ICalTime $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_relatedto (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_relcalid (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_repeat (gint $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_replyurl (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_requeststatus (ICalReqstat $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_resources (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_response (gint $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_restriction (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_rrule (ICalRecurrence $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_scope (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_sequence (gint $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_status (ICalPropertyStatus $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_storesexpanded (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_summary (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_target (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_taskmode (ICalPropertyTaskmode $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_transp (ICalPropertyTransp $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_trigger (ICalTrigger $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_tzid (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_tzidaliasof (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_tzname (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_tzoffsetfrom (gint $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_tzoffsetto (gint $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_tzuntil (ICalTime $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_tzurl (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_uid (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_url (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_version (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_voter (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_x (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_xlicclass (ICalPropertyXlicclass $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_xlicclustercount (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_xlicerror (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_xlicmimecharset (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_xlicmimecid (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_xlicmimecontenttype (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_xlicmimeencoding (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_xlicmimefilename (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_new_xlicmimeoptinfo (Str $v)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_acceptresponse (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_acknowledged (ICalProperty $prop, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_action (ICalProperty $prop, ICalPropertyAction $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_allowconflict (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_attach (ICalProperty $prop, ICalAttach $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_attendee (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_busytype (ICalProperty $prop, ICalPropertyBusytype $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_calid (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_calmaster (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_calscale (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_capversion (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_carid (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_carlevel (ICalProperty $prop, ICalPropertyCarlevel $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_categories (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_class (ICalProperty $prop, ICalProperty_Class $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_cmd (ICalProperty $prop, ICalPropertyCmd $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_color (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_comment (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_completed (ICalProperty $prop, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_components (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_contact (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_created (ICalProperty $prop, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_csid (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_datemax (ICalProperty $prop, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_datemin (ICalProperty $prop, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_decreed (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_defaultcharset (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_defaultlocale (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_defaulttzid (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_defaultvcars (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_deny (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_description (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_dtend (ICalProperty $prop, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_dtstamp (ICalProperty $prop, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_dtstart (ICalProperty $prop, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_due (ICalProperty $prop, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_duration (ICalProperty $prop, ICalDuration $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_estimatedduration (ICalProperty $prop, ICalDuration $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_exdate (ICalProperty $prop, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_expand (ICalProperty $prop, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_exrule (ICalProperty $prop, ICalRecurrence $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_freebusy (ICalProperty $prop, ICalPeriod $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_geo (ICalProperty $prop, ICalGeo $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_grant (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_itipversion (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_lastmodified (ICalProperty $prop, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_location (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_maxcomponentsize (ICalProperty $prop, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_maxdate (ICalProperty $prop, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_maxresults (ICalProperty $prop, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_maxresultssize (ICalProperty $prop, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_method (ICalProperty $prop, ICalPropertyMethod $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_mindate (ICalProperty $prop, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_multipart (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_name (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_organizer (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_owner (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_percentcomplete (ICalProperty $prop, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_permission (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_pollcompletion (ICalProperty $prop, ICalPropertyPollcompletion $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_pollitemid (ICalProperty $prop, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_pollmode (ICalProperty $prop, ICalPropertyPollmode $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_pollproperties (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_pollwinner (ICalProperty $prop, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_priority (ICalProperty $prop, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_prodid (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_query (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_queryid (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_querylevel (ICalProperty $prop, ICalPropertyQuerylevel $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_queryname (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_rdate (ICalProperty $prop, ICalDatetimeperiod $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_recuraccepted (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_recurexpand (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_recurlimit (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_recurrenceid (ICalProperty $prop, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_relatedto (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_relcalid (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_repeat (ICalProperty $prop, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_replyurl (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_requeststatus (ICalProperty $prop, ICalReqstat $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_resources (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_response (ICalProperty $prop, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_restriction (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_rrule (ICalProperty $prop, ICalRecurrence $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_scope (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_sequence (ICalProperty $prop, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_status (ICalProperty $prop, ICalPropertyStatus $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_storesexpanded (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_summary (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_target (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_taskmode (ICalProperty $prop, ICalPropertyTaskmode $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_transp (ICalProperty $prop, ICalPropertyTransp $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_trigger (ICalProperty $prop, ICalTrigger $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_tzid (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_tzidaliasof (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_tzname (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_tzoffsetfrom (ICalProperty $prop, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_tzoffsetto (ICalProperty $prop, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_tzuntil (ICalProperty $prop, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_tzurl (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_uid (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_url (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_version (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_voter (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_x (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_xlicclass (ICalProperty $prop, ICalPropertyXlicclass $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_xlicclustercount (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_xlicerror (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_xlicmimecharset (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_xlicmimecid (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_xlicmimecontenttype (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_xlicmimeencoding (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_xlicmimefilename (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_set_xlicmimeoptinfo (ICalProperty $prop, Str $v)
  is native(ical-glib)
  is export
{ * }
