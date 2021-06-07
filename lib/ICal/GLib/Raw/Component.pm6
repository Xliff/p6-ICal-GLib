use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use ICal::GLib::Raw::Definitions;
use ICal::GLib::Raw::Enums;

unit package ICal::GLib::Raw::Component;

### /usr/include/libical-glib/i-cal-component.h

sub i_cal_component_add_component (
  ICalComponent $parent,
  ICalComponent $child
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_add_property (
  ICalComponent $component,
  ICalProperty  $property
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_as_ical_string (ICalComponent $component)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_begin_component (
  ICalComponent     $component,
  ICalComponentKind $kind
)
  returns ICalCompIter
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_check_restrictions (ICalComponent $comp)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_clone (ICalComponent $component)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_convert_errors (ICalComponent $comp)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_count_components (
  ICalComponent     $component,
  ICalComponentKind $kind
)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_count_errors (ICalComponent $comp)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_count_properties (ICalComponent $component,
  ICalPropertyKind $kind
)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_end_component (
  ICalComponent     $component,
  ICalComponentKind $kind
)
  returns ICalCompIter
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_foreach_recurrence (
  ICalComponent $comp,
  ICalTime      $start,
  ICalTime      $end,
                &callback (ICalComponent, ICalTimeSpan, gpointer),
  gpointer      $user_data
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_foreach_tzid (
  ICalComponent $comp,
                &callback (ICalParameter, gpointer),
  gpointer      $user_data
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_free (ICalComponent $component)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_comment (ICalComponent $comp)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_current_component (ICalComponent $component)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_current_property (ICalComponent $component)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_description (ICalComponent $comp)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_dtend (ICalComponent $comp)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_dtstamp (ICalComponent $comp)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_dtstart (ICalComponent $comp)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_due (ICalComponent $comp)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_duration (ICalComponent $comp)
  returns ICalDuration
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_first_component (
  ICalComponent     $component,
  ICalComponentKind $kind
)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_first_property (
  ICalComponent    $component,
  ICalPropertyKind $kind
)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_first_real_component (ICalComponent $c)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_inner (ICalComponent $comp)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_location (ICalComponent $comp)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_method (ICalComponent $comp)
  returns ICalPropertyMethod
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_next_component (
  ICalComponent     $component,
  ICalComponentKind $kind
)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_next_property (
  ICalComponent    $component,
  ICalPropertyKind $kind
)
  returns ICalProperty
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_parent (ICalComponent $component)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_recurrenceid (ICalComponent $comp)
  returns ICalTime
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_relcalid (ICalComponent $comp)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_sequence (ICalComponent $comp)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_span (ICalComponent $comp)
  returns ICalTimeSpan
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_status (ICalComponent $comp)
  returns ICalPropertyStatus
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_summary (ICalComponent $comp)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_timezone (ICalComponent $comp, Str $tzid)
  returns ICalTimezone
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_type
  returns GType
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_get_uid (ICalComponent $comp)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_comp_iter_deref (ICalCompIter $i)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_comp_iter_next (ICalCompIter $i)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_comp_iter_prior (ICalCompIter $i)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_property_recurrence_is_excluded (
  ICalComponent $comp,
  ICalTime      $dtstart,
  ICalTime      $recurtime
)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_is_valid (ICalComponent $component)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_isa (ICalComponent $component)
  returns ICalComponentKind
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_isa_component (ICalComponent $component)
  returns gint
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_kind_from_string (Str $string)
  returns ICalComponentKind
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_kind_is_valid (ICalComponentKind $kind)
  returns uint32
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_kind_to_string (ICalComponentKind $kind)
  returns Str
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_merge_component (
  ICalComponent $comp,
  ICalComponent $comp_to_merge
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new (ICalComponentKind $kind)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_from_string (Str $str)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_vagenda
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_valarm
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_vavailability
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_vcalendar
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_vevent
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_vfreebusy
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_vjournal
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_vpoll
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_vquery
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_vtimezone
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_vtodo
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_vvoter
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_x (Str $x_name)
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_xavailable
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_xdaylight
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_xstandard
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_new_xvote
  returns ICalComponent
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_remove_component (
  ICalComponent $parent,
  ICalComponent $child
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_remove_property (
  ICalComponent $component,
  ICalProperty  $property
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_comment (ICalComponent $comp, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_description (ICalComponent $comp, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_dtend (ICalComponent $comp, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_dtstamp (ICalComponent $comp, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_dtstart (ICalComponent $comp, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_due (ICalComponent $comp, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_duration (ICalComponent $comp, ICalDuration $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_location (ICalComponent $comp, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_method (
  ICalComponent      $comp,
  ICalPropertyMethod $method
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_parent (
  ICalComponent $component,
  ICalComponent $parent
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_recurrenceid (ICalComponent $comp, ICalTime $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_relcalid (ICalComponent $comp, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_sequence (ICalComponent $comp, gint $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_status (
  ICalComponent      $comp,
  ICalPropertyStatus $status
)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_summary (ICalComponent $comp, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_set_uid (ICalComponent $comp, Str $v)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_strip_errors (ICalComponent $comp)
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_take_component (
  ICalComponent $parent,
  ICalComponent $child
  )
  is native(ical-glib)
  is export
{ * }

sub i_cal_component_take_property (
  ICalComponent $component,
  ICalProperty  $property
)
  is native(ical-glib)
  is export
{ * }
