use v6.c;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Object;

use GLib::Roles::Object;

our subset ICalObjectAncestry is export of Mu
  where ICalObject | GObject;

class ICal::GLib::Object {
  also does GLib::Roles::Object;

  has ICalObject $!ico;

  submethod BUILD (:$ical-object) {
    self.setICalObject($ical-object) if $ical-object;
  }

  method setICalObject (ICalObjectAncestry $_) {
    my $to-parent;

    $!ico = do {
      when ICalObject {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalObject, $_);
      }
    }
    self!setObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalObject
  { $!ico }

  method add_depender (GObject() $depender) {
    i_cal_object_add_depender($!ico, $depender);
  }

  method construct (
    gpointer $native,
    gpointer $native_destroy_func,
    gboolean $is_global_memory,
    GObject() $owner
  ) {
    i_cal_object_construct(
      $!ico,
      $native,
      $native_destroy_func, 
      $is_global_memory, $owner
    );
  }

  method free_global_objects (ICal::GLib::Object:U: ) {
    i_cal_object_free_global_objects();
  }

  # Boolean?
  method get_is_global_memory {
    i_cal_object_get_is_global_memory($!ico);
  }

  method get_native {
    i_cal_object_get_native($!ico);
  }

  method get_native_destroy_func {
    i_cal_object_get_native_destroy_func($!ico);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_object_get_type, $n, $t );
  }

  method ref_owner (:$raw = False) {
    my $o = i_cal_object_ref_owner($!ico);

    # Transfer: full (by virtue of ref)
    $o ??
      ( $raw ?? $o !! GLib::Roles::Object.new-object-obj($o, :!ref) )
      !!
      Nil
  }

  method remove_depender (GObject() $depender) {
    i_cal_object_remove_depender($!ico, $depender);
  }

  method remove_owner {
    i_cal_object_remove_owner($!ico);
  }

  method set_native_destroy_func (GDestroyNotify $native_destroy_func) {
    i_cal_object_set_native_destroy_func($!ico, $native_destroy_func);
  }

  method set_owner (GObject() $owner) {
    i_cal_object_set_owner($!ico, $owner);
  }

  method steal_native {
    i_cal_object_steal_native($!ico);
  }

}
