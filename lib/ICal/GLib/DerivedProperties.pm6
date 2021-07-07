use v6.c;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::DerivedProperties;

class ICal::GLib::DerivedProperties::Master {
  has $!dp;

  method get_acceptresponse {
    i_cal_property_get_acceptresponse($!dp);
  }

  method get_acknowledged {
    i_cal_property_get_acknowledged($!dp);
  }

  method get_action {
    i_cal_property_get_action($!dp);
  }

  method get_allowconflict {
    i_cal_property_get_allowconflict($!dp);
  }

  method get_attach {
    i_cal_property_get_attach($!dp);
  }

  method get_attendee {
    i_cal_property_get_attendee($!dp);
  }

  method get_busytype {
    i_cal_property_get_busytype($!dp);
  }

  method get_calid {
    i_cal_property_get_calid($!dp);
  }

  method get_calmaster {
    i_cal_property_get_calmaster($!dp);
  }

  method get_calscale {
    i_cal_property_get_calscale($!dp);
  }

  method get_capversion {
    i_cal_property_get_capversion($!dp);
  }

  method get_carid {
    i_cal_property_get_carid($!dp);
  }

  method get_carlevel {
    i_cal_property_get_carlevel($!dp);
  }

  method get_categories {
    i_cal_property_get_categories($!dp);
  }

  method get_class {
    i_cal_property_get_class($!dp);
  }

  method get_cmd {
    i_cal_property_get_cmd($!dp);
  }

  method get_color {
    i_cal_property_get_color($!dp);
  }

  method get_comment {
    i_cal_property_get_comment($!dp);
  }

  method get_completed {
    i_cal_property_get_completed($!dp);
  }

  method get_components {
    i_cal_property_get_components($!dp);
  }

  method get_contact {
    i_cal_property_get_contact($!dp);
  }

  method get_created {
    i_cal_property_get_created($!dp);
  }

  method get_csid {
    i_cal_property_get_csid($!dp);
  }

  method get_datemax {
    i_cal_property_get_datemax($!dp);
  }

  method get_datemin {
    i_cal_property_get_datemin($!dp);
  }

  method get_decreed {
    i_cal_property_get_decreed($!dp);
  }

  method get_defaultcharset {
    i_cal_property_get_defaultcharset($!dp);
  }

  method get_defaultlocale {
    i_cal_property_get_defaultlocale($!dp);
  }

  method get_defaulttzid {
    i_cal_property_get_defaulttzid($!dp);
  }

  method get_defaultvcars {
    i_cal_property_get_defaultvcars($!dp);
  }

  method get_deny {
    i_cal_property_get_deny($!dp);
  }

  method get_description {
    i_cal_property_get_description($!dp);
  }

  method get_dtend {
    i_cal_property_get_dtend($!dp);
  }

  method get_dtstamp {
    i_cal_property_get_dtstamp($!dp);
  }

  method get_dtstart {
    i_cal_property_get_dtstart($!dp);
  }

  method get_due {
    i_cal_property_get_due($!dp);
  }

  method get_duration {
    i_cal_property_get_duration($!dp);
  }

  method get_estimatedduration {
    i_cal_property_get_estimatedduration($!dp);
  }

  method get_exdate {
    i_cal_property_get_exdate($!dp);
  }

  method get_expand {
    i_cal_property_get_expand($!dp);
  }

  method get_exrule {
    i_cal_property_get_exrule($!dp);
  }

  method get_freebusy {
    i_cal_property_get_freebusy($!dp);
  }

  method get_geo {
    i_cal_property_get_geo($!dp);
  }

  method get_grant {
    i_cal_property_get_grant($!dp);
  }

  method get_itipversion {
    i_cal_property_get_itipversion($!dp);
  }

  method get_lastmodified {
    i_cal_property_get_lastmodified($!dp);
  }

  method get_location {
    i_cal_property_get_location($!dp);
  }

  method get_maxcomponentsize {
    i_cal_property_get_maxcomponentsize($!dp);
  }

  method get_maxdate {
    i_cal_property_get_maxdate($!dp);
  }

  method get_maxresults {
    i_cal_property_get_maxresults($!dp);
  }

  method get_maxresultssize {
    i_cal_property_get_maxresultssize($!dp);
  }

  method get_method {
    i_cal_property_get_method($!dp);
  }

  method get_mindate {
    i_cal_property_get_mindate($!dp);
  }

  method get_multipart {
    i_cal_property_get_multipart($!dp);
  }

  method get_name {
    i_cal_property_get_name($!dp);
  }

  method get_organizer {
    i_cal_property_get_organizer($!dp);
  }

  method get_owner {
    i_cal_property_get_owner($!dp);
  }

  method get_percentcomplete {
    i_cal_property_get_percentcomplete($!dp);
  }

  method get_permission {
    i_cal_property_get_permission($!dp);
  }

  method get_pollcompletion {
    i_cal_property_get_pollcompletion($!dp);
  }

  method get_pollitemid {
    i_cal_property_get_pollitemid($!dp);
  }

  method get_pollmode {
    i_cal_property_get_pollmode($!dp);
  }

  method get_pollproperties {
    i_cal_property_get_pollproperties($!dp);
  }

  method get_pollwinner {
    i_cal_property_get_pollwinner($!dp);
  }

  method get_priority {
    i_cal_property_get_priority($!dp);
  }

  method get_prodid {
    i_cal_property_get_prodid($!dp);
  }

  method get_query {
    i_cal_property_get_query($!dp);
  }

  method get_queryid {
    i_cal_property_get_queryid($!dp);
  }

  method get_querylevel {
    i_cal_property_get_querylevel($!dp);
  }

  method get_queryname {
    i_cal_property_get_queryname($!dp);
  }

  method get_rdate {
    i_cal_property_get_rdate($!dp);
  }

  method get_recuraccepted {
    i_cal_property_get_recuraccepted($!dp);
  }

  method get_recurexpand {
    i_cal_property_get_recurexpand($!dp);
  }

  method get_recurlimit {
    i_cal_property_get_recurlimit($!dp);
  }

  method get_recurrenceid {
    i_cal_property_get_recurrenceid($!dp);
  }

  method get_relatedto {
    i_cal_property_get_relatedto($!dp);
  }

  method get_relcalid {
    i_cal_property_get_relcalid($!dp);
  }

  method get_repeat {
    i_cal_property_get_repeat($!dp);
  }

  method get_replyurl {
    i_cal_property_get_replyurl($!dp);
  }

  method get_requeststatus {
    i_cal_property_get_requeststatus($!dp);
  }

  method get_resources {
    i_cal_property_get_resources($!dp);
  }

  method get_response {
    i_cal_property_get_response($!dp);
  }

  method get_restriction {
    i_cal_property_get_restriction($!dp);
  }

  method get_rrule {
    i_cal_property_get_rrule($!dp);
  }

  method get_scope {
    i_cal_property_get_scope($!dp);
  }

  method get_sequence {
    i_cal_property_get_sequence($!dp);
  }

  method get_status {
    i_cal_property_get_status($!dp);
  }

  method get_storesexpanded {
    i_cal_property_get_storesexpanded($!dp);
  }

  method get_summary {
    i_cal_property_get_summary($!dp);
  }

  method get_target {
    i_cal_property_get_target($!dp);
  }

  method get_taskmode {
    i_cal_property_get_taskmode($!dp);
  }

  method get_transp {
    i_cal_property_get_transp($!dp);
  }

  method get_trigger {
    i_cal_property_get_trigger($!dp);
  }

  method get_tzid {
    i_cal_property_get_tzid($!dp);
  }

  method get_tzidaliasof {
    i_cal_property_get_tzidaliasof($!dp);
  }

  method get_tzname {
    i_cal_property_get_tzname($!dp);
  }

  method get_tzoffsetfrom {
    i_cal_property_get_tzoffsetfrom($!dp);
  }

  method get_tzoffsetto {
    i_cal_property_get_tzoffsetto($!dp);
  }

  method get_tzuntil {
    i_cal_property_get_tzuntil($!dp);
  }

  method get_tzurl {
    i_cal_property_get_tzurl($!dp);
  }

  method get_uid {
    i_cal_property_get_uid($!dp);
  }

  method get_url {
    i_cal_property_get_url($!dp);
  }

  method get_version {
    i_cal_property_get_version($!dp);
  }

  method get_voter {
    i_cal_property_get_voter($!dp);
  }

  method get_x {
    i_cal_property_get_x($!dp);
  }

  method get_xlicclass {
    i_cal_property_get_xlicclass($!dp);
  }

  method get_xlicclustercount {
    i_cal_property_get_xlicclustercount($!dp);
  }

  method get_xlicerror {
    i_cal_property_get_xlicerror($!dp);
  }

  method get_xlicmimecharset {
    i_cal_property_get_xlicmimecharset($!dp);
  }

  method get_xlicmimecid {
    i_cal_property_get_xlicmimecid($!dp);
  }

  method get_xlicmimecontenttype {
    i_cal_property_get_xlicmimecontenttype($!dp);
  }

  method get_xlicmimeencoding {
    i_cal_property_get_xlicmimeencoding($!dp);
  }

  method get_xlicmimefilename {
    i_cal_property_get_xlicmimefilename($!dp);
  }

  method get_xlicmimeoptinfo {
    i_cal_property_get_xlicmimeoptinfo($!dp);
  }

  method new_acceptresponse {
    i_cal_property_new_acceptresponse($!dp);
  }

  method new_acknowledged {
    i_cal_property_new_acknowledged($!dp);
  }

  method new_action {
    i_cal_property_new_action($!dp);
  }

  method new_allowconflict {
    i_cal_property_new_allowconflict($!dp);
  }

  method new_attach {
    i_cal_property_new_attach($!dp);
  }

  method new_attendee {
    i_cal_property_new_attendee($!dp);
  }

  method new_busytype {
    i_cal_property_new_busytype($!dp);
  }

  method new_calid {
    i_cal_property_new_calid($!dp);
  }

  method new_calmaster {
    i_cal_property_new_calmaster($!dp);
  }

  method new_calscale {
    i_cal_property_new_calscale($!dp);
  }

  method new_capversion {
    i_cal_property_new_capversion($!dp);
  }

  method new_carid {
    i_cal_property_new_carid($!dp);
  }

  method new_carlevel {
    i_cal_property_new_carlevel($!dp);
  }

  method new_categories {
    i_cal_property_new_categories($!dp);
  }

  method new_class {
    i_cal_property_new_class($!dp);
  }

  method new_cmd {
    i_cal_property_new_cmd($!dp);
  }

  method new_color {
    i_cal_property_new_color($!dp);
  }

  method new_comment {
    i_cal_property_new_comment($!dp);
  }

  method new_completed {
    i_cal_property_new_completed($!dp);
  }

  method new_components {
    i_cal_property_new_components($!dp);
  }

  method new_contact {
    i_cal_property_new_contact($!dp);
  }

  method new_created {
    i_cal_property_new_created($!dp);
  }

  method new_csid {
    i_cal_property_new_csid($!dp);
  }

  method new_datemax {
    i_cal_property_new_datemax($!dp);
  }

  method new_datemin {
    i_cal_property_new_datemin($!dp);
  }

  method new_decreed {
    i_cal_property_new_decreed($!dp);
  }

  method new_defaultcharset {
    i_cal_property_new_defaultcharset($!dp);
  }

  method new_defaultlocale {
    i_cal_property_new_defaultlocale($!dp);
  }

  method new_defaulttzid {
    i_cal_property_new_defaulttzid($!dp);
  }

  method new_defaultvcars {
    i_cal_property_new_defaultvcars($!dp);
  }

  method new_deny {
    i_cal_property_new_deny($!dp);
  }

  method new_description {
    i_cal_property_new_description($!dp);
  }

  method new_dtend {
    i_cal_property_new_dtend($!dp);
  }

  method new_dtstamp {
    i_cal_property_new_dtstamp($!dp);
  }

  method new_dtstart {
    i_cal_property_new_dtstart($!dp);
  }

  method new_due {
    i_cal_property_new_due($!dp);
  }

  method new_duration {
    i_cal_property_new_duration($!dp);
  }

  method new_estimatedduration {
    i_cal_property_new_estimatedduration($!dp);
  }

  method new_exdate {
    i_cal_property_new_exdate($!dp);
  }

  method new_expand {
    i_cal_property_new_expand($!dp);
  }

  method new_exrule {
    i_cal_property_new_exrule($!dp);
  }

  method new_freebusy {
    i_cal_property_new_freebusy($!dp);
  }

  method new_geo {
    i_cal_property_new_geo($!dp);
  }

  method new_grant {
    i_cal_property_new_grant($!dp);
  }

  method new_itipversion {
    i_cal_property_new_itipversion($!dp);
  }

  method new_lastmodified {
    i_cal_property_new_lastmodified($!dp);
  }

  method new_location {
    i_cal_property_new_location($!dp);
  }

  method new_maxcomponentsize {
    i_cal_property_new_maxcomponentsize($!dp);
  }

  method new_maxdate {
    i_cal_property_new_maxdate($!dp);
  }

  method new_maxresults {
    i_cal_property_new_maxresults($!dp);
  }

  method new_maxresultssize {
    i_cal_property_new_maxresultssize($!dp);
  }

  method new_method {
    i_cal_property_new_method($!dp);
  }

  method new_mindate {
    i_cal_property_new_mindate($!dp);
  }

  method new_multipart {
    i_cal_property_new_multipart($!dp);
  }

  method new_name {
    i_cal_property_new_name($!dp);
  }

  method new_organizer {
    i_cal_property_new_organizer($!dp);
  }

  method new_owner {
    i_cal_property_new_owner($!dp);
  }

  method new_percentcomplete {
    i_cal_property_new_percentcomplete($!dp);
  }

  method new_permission {
    i_cal_property_new_permission($!dp);
  }

  method new_pollcompletion {
    i_cal_property_new_pollcompletion($!dp);
  }

  method new_pollitemid {
    i_cal_property_new_pollitemid($!dp);
  }

  method new_pollmode {
    i_cal_property_new_pollmode($!dp);
  }

  method new_pollproperties {
    i_cal_property_new_pollproperties($!dp);
  }

  method new_pollwinner {
    i_cal_property_new_pollwinner($!dp);
  }

  method new_priority {
    i_cal_property_new_priority($!dp);
  }

  method new_prodid {
    i_cal_property_new_prodid($!dp);
  }

  method new_query {
    i_cal_property_new_query($!dp);
  }

  method new_queryid {
    i_cal_property_new_queryid($!dp);
  }

  method new_querylevel {
    i_cal_property_new_querylevel($!dp);
  }

  method new_queryname {
    i_cal_property_new_queryname($!dp);
  }

  method new_rdate {
    i_cal_property_new_rdate($!dp);
  }

  method new_recuraccepted {
    i_cal_property_new_recuraccepted($!dp);
  }

  method new_recurexpand {
    i_cal_property_new_recurexpand($!dp);
  }

  method new_recurlimit {
    i_cal_property_new_recurlimit($!dp);
  }

  method new_recurrenceid {
    i_cal_property_new_recurrenceid($!dp);
  }

  method new_relatedto {
    i_cal_property_new_relatedto($!dp);
  }

  method new_relcalid {
    i_cal_property_new_relcalid($!dp);
  }

  method new_repeat {
    i_cal_property_new_repeat($!dp);
  }

  method new_replyurl {
    i_cal_property_new_replyurl($!dp);
  }

  method new_requeststatus {
    i_cal_property_new_requeststatus($!dp);
  }

  method new_resources {
    i_cal_property_new_resources($!dp);
  }

  method new_response {
    i_cal_property_new_response($!dp);
  }

  method new_restriction {
    i_cal_property_new_restriction($!dp);
  }

  method new_rrule {
    i_cal_property_new_rrule($!dp);
  }

  method new_scope {
    i_cal_property_new_scope($!dp);
  }

  method new_sequence {
    i_cal_property_new_sequence($!dp);
  }

  method new_status {
    i_cal_property_new_status($!dp);
  }

  method new_storesexpanded {
    i_cal_property_new_storesexpanded($!dp);
  }

  method new_summary {
    i_cal_property_new_summary($!dp);
  }

  method new_target {
    i_cal_property_new_target($!dp);
  }

  method new_taskmode {
    i_cal_property_new_taskmode($!dp);
  }

  method new_transp {
    i_cal_property_new_transp($!dp);
  }

  method new_trigger {
    i_cal_property_new_trigger($!dp);
  }

  method new_tzid {
    i_cal_property_new_tzid($!dp);
  }

  method new_tzidaliasof {
    i_cal_property_new_tzidaliasof($!dp);
  }

  method new_tzname {
    i_cal_property_new_tzname($!dp);
  }

  method new_tzoffsetfrom {
    i_cal_property_new_tzoffsetfrom($!dp);
  }

  method new_tzoffsetto {
    i_cal_property_new_tzoffsetto($!dp);
  }

  method new_tzuntil {
    i_cal_property_new_tzuntil($!dp);
  }

  method new_tzurl {
    i_cal_property_new_tzurl($!dp);
  }

  method new_uid {
    i_cal_property_new_uid($!dp);
  }

  method new_url {
    i_cal_property_new_url($!dp);
  }

  method new_version {
    i_cal_property_new_version($!dp);
  }

  method new_voter {
    i_cal_property_new_voter($!dp);
  }

  method new_x {
    i_cal_property_new_x($!dp);
  }

  method new_xlicclass {
    i_cal_property_new_xlicclass($!dp);
  }

  method new_xlicclustercount {
    i_cal_property_new_xlicclustercount($!dp);
  }

  method new_xlicerror {
    i_cal_property_new_xlicerror($!dp);
  }

  method new_xlicmimecharset {
    i_cal_property_new_xlicmimecharset($!dp);
  }

  method new_xlicmimecid {
    i_cal_property_new_xlicmimecid($!dp);
  }

  method new_xlicmimecontenttype {
    i_cal_property_new_xlicmimecontenttype($!dp);
  }

  method new_xlicmimeencoding {
    i_cal_property_new_xlicmimeencoding($!dp);
  }

  method new_xlicmimefilename {
    i_cal_property_new_xlicmimefilename($!dp);
  }

  method new_xlicmimeoptinfo {
    i_cal_property_new_xlicmimeoptinfo($!dp);
  }

  method set_acceptresponse (Str $v) {
    i_cal_property_set_acceptresponse($!dp, $v);
  }

  method set_acknowledged (ICalTime $v) {
    i_cal_property_set_acknowledged($!dp, $v);
  }

  method set_action (ICalPropertyAction $v) {
    i_cal_property_set_action($!dp, $v);
  }

  method set_allowconflict (Str $v) {
    i_cal_property_set_allowconflict($!dp, $v);
  }

  method set_attach (ICalAttach $v) {
    i_cal_property_set_attach($!dp, $v);
  }

  method set_attendee (Str $v) {
    i_cal_property_set_attendee($!dp, $v);
  }

  method set_busytype (ICalPropertyBusytype $v) {
    i_cal_property_set_busytype($!dp, $v);
  }

  method set_calid (Str $v) {
    i_cal_property_set_calid($!dp, $v);
  }

  method set_calmaster (Str $v) {
    i_cal_property_set_calmaster($!dp, $v);
  }

  method set_calscale (Str $v) {
    i_cal_property_set_calscale($!dp, $v);
  }

  method set_capversion (Str $v) {
    i_cal_property_set_capversion($!dp, $v);
  }

  method set_carid (Str $v) {
    i_cal_property_set_carid($!dp, $v);
  }

  method set_carlevel (ICalPropertyCarlevel $v) {
    i_cal_property_set_carlevel($!dp, $v);
  }

  method set_categories (Str $v) {
    i_cal_property_set_categories($!dp, $v);
  }

  method set_class (ICalProperty_Class $v) {
    i_cal_property_set_class($!dp, $v);
  }

  method set_cmd (ICalPropertyCmd $v) {
    i_cal_property_set_cmd($!dp, $v);
  }

  method set_color (Str $v) {
    i_cal_property_set_color($!dp, $v);
  }

  method set_comment (Str $v) {
    i_cal_property_set_comment($!dp, $v);
  }

  method set_completed (ICalTime $v) {
    i_cal_property_set_completed($!dp, $v);
  }

  method set_components (Str $v) {
    i_cal_property_set_components($!dp, $v);
  }

  method set_contact (Str $v) {
    i_cal_property_set_contact($!dp, $v);
  }

  method set_created (ICalTime $v) {
    i_cal_property_set_created($!dp, $v);
  }

  method set_csid (Str $v) {
    i_cal_property_set_csid($!dp, $v);
  }

  method set_datemax (ICalTime $v) {
    i_cal_property_set_datemax($!dp, $v);
  }

  method set_datemin (ICalTime $v) {
    i_cal_property_set_datemin($!dp, $v);
  }

  method set_decreed (Str $v) {
    i_cal_property_set_decreed($!dp, $v);
  }

  method set_defaultcharset (Str $v) {
    i_cal_property_set_defaultcharset($!dp, $v);
  }

  method set_defaultlocale (Str $v) {
    i_cal_property_set_defaultlocale($!dp, $v);
  }

  method set_defaulttzid (Str $v) {
    i_cal_property_set_defaulttzid($!dp, $v);
  }

  method set_defaultvcars (Str $v) {
    i_cal_property_set_defaultvcars($!dp, $v);
  }

  method set_deny (Str $v) {
    i_cal_property_set_deny($!dp, $v);
  }

  method set_description (Str $v) {
    i_cal_property_set_description($!dp, $v);
  }

  method set_dtend (ICalTime $v) {
    i_cal_property_set_dtend($!dp, $v);
  }

  method set_dtstamp (ICalTime $v) {
    i_cal_property_set_dtstamp($!dp, $v);
  }

  method set_dtstart (ICalTime $v) {
    i_cal_property_set_dtstart($!dp, $v);
  }

  method set_due (ICalTime $v) {
    i_cal_property_set_due($!dp, $v);
  }

  method set_duration (ICalDuration $v) {
    i_cal_property_set_duration($!dp, $v);
  }

  method set_estimatedduration (ICalDuration $v) {
    i_cal_property_set_estimatedduration($!dp, $v);
  }

  method set_exdate (ICalTime $v) {
    i_cal_property_set_exdate($!dp, $v);
  }

  method set_expand (gint $v) {
    i_cal_property_set_expand($!dp, $v);
  }

  method set_exrule (ICalRecurrence $v) {
    i_cal_property_set_exrule($!dp, $v);
  }

  method set_freebusy (ICalPeriod $v) {
    i_cal_property_set_freebusy($!dp, $v);
  }

  method set_geo (ICalGeo $v) {
    i_cal_property_set_geo($!dp, $v);
  }

  method set_grant (Str $v) {
    i_cal_property_set_grant($!dp, $v);
  }

  method set_itipversion (Str $v) {
    i_cal_property_set_itipversion($!dp, $v);
  }

  method set_lastmodified (ICalTime $v) {
    i_cal_property_set_lastmodified($!dp, $v);
  }

  method set_location (Str $v) {
    i_cal_property_set_location($!dp, $v);
  }

  method set_maxcomponentsize (gint $v) {
    i_cal_property_set_maxcomponentsize($!dp, $v);
  }

  method set_maxdate (ICalTime $v) {
    i_cal_property_set_maxdate($!dp, $v);
  }

  method set_maxresults (gint $v) {
    i_cal_property_set_maxresults($!dp, $v);
  }

  method set_maxresultssize (gint $v) {
    i_cal_property_set_maxresultssize($!dp, $v);
  }

  method set_method (ICalPropertyMethod $v) {
    i_cal_property_set_method($!dp, $v);
  }

  method set_mindate (ICalTime $v) {
    i_cal_property_set_mindate($!dp, $v);
  }

  method set_multipart (Str $v) {
    i_cal_property_set_multipart($!dp, $v);
  }

  method set_name (Str $v) {
    i_cal_property_set_name($!dp, $v);
  }

  method set_organizer (Str $v) {
    i_cal_property_set_organizer($!dp, $v);
  }

  method set_owner (Str $v) {
    i_cal_property_set_owner($!dp, $v);
  }

  method set_percentcomplete (gint $v) {
    i_cal_property_set_percentcomplete($!dp, $v);
  }

  method set_permission (Str $v) {
    i_cal_property_set_permission($!dp, $v);
  }

  method set_pollcompletion (ICalPropertyPollcompletion $v) {
    i_cal_property_set_pollcompletion($!dp, $v);
  }

  method set_pollitemid (gint $v) {
    i_cal_property_set_pollitemid($!dp, $v);
  }

  method set_pollmode (ICalPropertyPollmode $v) {
    i_cal_property_set_pollmode($!dp, $v);
  }

  method set_pollproperties (Str $v) {
    i_cal_property_set_pollproperties($!dp, $v);
  }

  method set_pollwinner (gint $v) {
    i_cal_property_set_pollwinner($!dp, $v);
  }

  method set_priority (gint $v) {
    i_cal_property_set_priority($!dp, $v);
  }

  method set_prodid (Str $v) {
    i_cal_property_set_prodid($!dp, $v);
  }

  method set_query (Str $v) {
    i_cal_property_set_query($!dp, $v);
  }

  method set_queryid (Str $v) {
    i_cal_property_set_queryid($!dp, $v);
  }

  method set_querylevel (ICalPropertyQuerylevel $v) {
    i_cal_property_set_querylevel($!dp, $v);
  }

  method set_queryname (Str $v) {
    i_cal_property_set_queryname($!dp, $v);
  }

  method set_rdate (ICalDatetimeperiod $v) {
    i_cal_property_set_rdate($!dp, $v);
  }

  method set_recuraccepted (Str $v) {
    i_cal_property_set_recuraccepted($!dp, $v);
  }

  method set_recurexpand (Str $v) {
    i_cal_property_set_recurexpand($!dp, $v);
  }

  method set_recurlimit (Str $v) {
    i_cal_property_set_recurlimit($!dp, $v);
  }

  method set_recurrenceid (ICalTime $v) {
    i_cal_property_set_recurrenceid($!dp, $v);
  }

  method set_relatedto (Str $v) {
    i_cal_property_set_relatedto($!dp, $v);
  }

  method set_relcalid (Str $v) {
    i_cal_property_set_relcalid($!dp, $v);
  }

  method set_repeat (gint $v) {
    i_cal_property_set_repeat($!dp, $v);
  }

  method set_replyurl (Str $v) {
    i_cal_property_set_replyurl($!dp, $v);
  }

  method set_requeststatus (ICalReqstat $v) {
    i_cal_property_set_requeststatus($!dp, $v);
  }

  method set_resources (Str $v) {
    i_cal_property_set_resources($!dp, $v);
  }

  method set_response (gint $v) {
    i_cal_property_set_response($!dp, $v);
  }

  method set_restriction (Str $v) {
    i_cal_property_set_restriction($!dp, $v);
  }

  method set_rrule (ICalRecurrence $v) {
    i_cal_property_set_rrule($!dp, $v);
  }

  method set_scope (Str $v) {
    i_cal_property_set_scope($!dp, $v);
  }

  method set_sequence (gint $v) {
    i_cal_property_set_sequence($!dp, $v);
  }

  method set_status (ICalPropertyStatus $v) {
    i_cal_property_set_status($!dp, $v);
  }

  method set_storesexpanded (Str $v) {
    i_cal_property_set_storesexpanded($!dp, $v);
  }

  method set_summary (Str $v) {
    i_cal_property_set_summary($!dp, $v);
  }

  method set_target (Str $v) {
    i_cal_property_set_target($!dp, $v);
  }

  method set_taskmode (ICalPropertyTaskmode $v) {
    i_cal_property_set_taskmode($!dp, $v);
  }

  method set_transp (ICalPropertyTransp $v) {
    i_cal_property_set_transp($!dp, $v);
  }

  method set_trigger (ICalTrigger $v) {
    i_cal_property_set_trigger($!dp, $v);
  }

  method set_tzid (Str $v) {
    i_cal_property_set_tzid($!dp, $v);
  }

  method set_tzidaliasof (Str $v) {
    i_cal_property_set_tzidaliasof($!dp, $v);
  }

  method set_tzname (Str $v) {
    i_cal_property_set_tzname($!dp, $v);
  }

  method set_tzoffsetfrom (gint $v) {
    i_cal_property_set_tzoffsetfrom($!dp, $v);
  }

  method set_tzoffsetto (gint $v) {
    i_cal_property_set_tzoffsetto($!dp, $v);
  }

  method set_tzuntil (ICalTime $v) {
    i_cal_property_set_tzuntil($!dp, $v);
  }

  method set_tzurl (Str $v) {
    i_cal_property_set_tzurl($!dp, $v);
  }

  method set_uid (Str $v) {
    i_cal_property_set_uid($!dp, $v);
  }

  method set_url (Str $v) {
    i_cal_property_set_url($!dp, $v);
  }

  method set_version (Str $v) {
    i_cal_property_set_version($!dp, $v);
  }

  method set_voter (Str $v) {
    i_cal_property_set_voter($!dp, $v);
  }

  method set_x (Str $v) {
    i_cal_property_set_x($!dp, $v);
  }

  method set_xlicclass (ICalPropertyXlicclass $v) {
    i_cal_property_set_xlicclass($!dp, $v);
  }

  method set_xlicclustercount (Str $v) {
    i_cal_property_set_xlicclustercount($!dp, $v);
  }

  method set_xlicerror (Str $v) {
    i_cal_property_set_xlicerror($!dp, $v);
  }

  method set_xlicmimecharset (Str $v) {
    i_cal_property_set_xlicmimecharset($!dp, $v);
  }

  method set_xlicmimecid (Str $v) {
    i_cal_property_set_xlicmimecid($!dp, $v);
  }

  method set_xlicmimecontenttype (Str $v) {
    i_cal_property_set_xlicmimecontenttype($!dp, $v);
  }

  method set_xlicmimeencoding (Str $v) {
    i_cal_property_set_xlicmimeencoding($!dp, $v);
  }

  method set_xlicmimefilename (Str $v) {
    i_cal_property_set_xlicmimefilename($!dp, $v);
  }

  method set_xlicmimeoptinfo (Str $v) {
    i_cal_property_set_xlicmimeoptinfo($!dp, $v);
  }

}
