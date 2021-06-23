use v6.c;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;
use ICal::GLib::Raw::Enums;

unit package ICal::GLib::Raw::DerivedParameters;

### /usr/include/libical-glib/i-cal-derived-parameter.h

sub i_cal_parameter_get_actionparam (ICalParameter $value)
  returns ICalParameterAction
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_altrep (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_charset (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_cn (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_cutype (ICalParameter $value)
  returns ICalParameterCutype
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_delegatedfrom (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_delegatedto (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_dir (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_enable (ICalParameter $value)
  returns ICalParameterEnable
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_encoding (ICalParameter $value)
  returns ICalParameterEncoding
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_fbtype (ICalParameter $value)
  returns ICalParameterFbtype
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_filename (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_fmttype (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_iana (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_id (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_language (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_latency (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_local (ICalParameter $value)
  returns ICalParameterLocal
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_localize (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_managedid (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_member (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_modified (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_options (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_partstat (ICalParameter $value)
  returns ICalParameterPartstat
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_publiccomment (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_range (ICalParameter $value)
  returns ICalParameterRange
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_reason (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_related (ICalParameter $value)
  returns ICalParameterRelated
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_reltype (ICalParameter $value)
  returns ICalParameterReltype
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_required (ICalParameter $value)
  returns ICalParameterRequired
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_response (ICalParameter $value)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_role (ICalParameter $value)
  returns ICalParameterRole
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_rsvp (ICalParameter $value)
  returns ICalParameterRsvp
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_scheduleagent (ICalParameter $value)
  returns ICalParameterScheduleagent
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_scheduleforcesend (ICalParameter $value)
  returns ICalParameterScheduleforcesend
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_schedulestatus (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_sentby (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_size (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_stayinformed (ICalParameter $value)
  returns ICalParameterStayinformed
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_substate (ICalParameter $value)
  returns ICalParameterSubstate
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_tzid (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_value (ICalParameter $value)
  returns ICalParameterValue
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_x (ICalParameter $value)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_xliccomparetype (ICalParameter $value)
  returns ICalParameterXliccomparetype
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_get_xlicerrortype (ICalParameter $value)
  returns ICalParameterXlicerrortype
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_actionparam (ICalParameterAction $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_altrep (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_charset (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_cn (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_cutype (ICalParameterCutype $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_delegatedfrom (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_delegatedto (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_dir (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_enable (ICalParameterEnable $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_encoding (ICalParameterEncoding $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_fbtype (ICalParameterFbtype $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_filename (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_fmttype (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_iana (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_id (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_language (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_latency (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_local (ICalParameterLocal $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_localize (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_managedid (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_member (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_modified (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_options (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_partstat (ICalParameterPartstat $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_publiccomment (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_range (ICalParameterRange $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_reason (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_related (ICalParameterRelated $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_reltype (ICalParameterReltype $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_required (ICalParameterRequired $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_response (gint $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_role (ICalParameterRole $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_rsvp (ICalParameterRsvp $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_scheduleagent (ICalParameterScheduleagent $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_scheduleforcesend (ICalParameterScheduleforcesend $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_schedulestatus (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_sentby (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_size (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_stayinformed (ICalParameterStayinformed $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_substate (ICalParameterSubstate $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_tzid (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_value (ICalParameterValue $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_x (Str $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_xliccomparetype (ICalParameterXliccomparetype $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_new_xlicerrortype (ICalParameterXlicerrortype $v)
  returns ICalParameter
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_actionparam (
  ICalParameter       $value,
  ICalParameterAction $v
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_altrep (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_charset (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_cn (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_cutype (ICalParameter $value, ICalParameterCutype $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_delegatedfrom (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_delegatedto (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_dir (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_enable (ICalParameter $value, ICalParameterEnable $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_encoding (
  ICalParameter         $value,
  ICalParameterEncoding $v
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_fbtype (ICalParameter $value, ICalParameterFbtype $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_filename (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_fmttype (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_iana (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_id (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_language (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_latency (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_local (ICalParameter $value, ICalParameterLocal $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_localize (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_managedid (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_member (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_modified (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_options (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_partstat (
  ICalParameter         $value,
  ICalParameterPartstat $v
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_publiccomment (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_range (ICalParameter $value, ICalParameterRange $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_reason (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_related (ICalParameter $value, ICalParameterRelated $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_reltype (ICalParameter $value, ICalParameterReltype $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_required (
  ICalParameter         $value,
  ICalParameterRequired $v
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_response (ICalParameter $value, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_role (ICalParameter $value, ICalParameterRole $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_rsvp (ICalParameter $value, ICalParameterRsvp $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_scheduleagent (
  ICalParameter              $value,
  ICalParameterScheduleagent $v
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_scheduleforcesend (
  ICalParameter                  $value,
  ICalParameterScheduleforcesend $v
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_schedulestatus (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_sentby (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_size (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_stayinformed (
  ICalParameter             $value,
  ICalParameterStayinformed $v
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_substate (
  ICalParameter         $value,
  ICalParameterSubstate $v
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_tzid (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_value (ICalParameter $value, ICalParameterValue $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_x (ICalParameter $value, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_xliccomparetype (
  ICalParameter                $value,
  ICalParameterXliccomparetype $v
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_parameter_set_xlicerrortype (
  ICalParameter              $value, 
  ICalParameterXlicerrortype $v
)
  is native(ical-glib)
  is export
{ * }
