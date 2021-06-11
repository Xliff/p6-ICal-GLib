use v6.c;

use Method::Also;

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
    is also<ICalObject>
  { $!ico }

  method add_depender (GObject() $depender) is also<add-depender> {
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

  method free_global_objects (ICal::GLib::Object:U: )
    is also<free-global-objects>
  {
    i_cal_object_free_global_objects();
  }

  # Boolean?
  method get_is_global_memory is also<get-is-global-memory> {
    i_cal_object_get_is_global_memory($!ico);
  }

  method get_native
    is also<
      get-native
      native
    >
  {
    i_cal_object_get_native($!ico);
  }

  method get_native_destroy_func is also<get-native-destroy-func> {
    i_cal_object_get_native_destroy_func($!ico);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_object_get_type, $n, $t );
  }

  method ref_owner (:$raw = False) is also<ref-owner> {
    my $o = i_cal_object_ref_owner($!ico);

    # Transfer: full (by virtue of ref)
    $o ??
      ( $raw ?? $o !! GLib::Roles::Object.new-object-obj($o, :!ref) )
      !!
      Nil
  }

  method remove_depender (GObject() $depender) is also<remove-depender> {
    i_cal_object_remove_depender($!ico, $depender);
  }

  method remove_owner is also<remove-owner> {
    i_cal_object_remove_owner($!ico);
  }

  method set_native_destroy_func (GDestroyNotify $native_destroy_func)
    is also<set-native-destroy-func>
  {
    i_cal_object_set_native_destroy_func($!ico, $native_destroy_func);
  }

  method set_owner (GObject() $owner) is also<set-owner> {
    i_cal_object_set_owner($!ico, $owner);
  }

  method steal_native is also<steal-native> {
    i_cal_object_steal_native($!ico);
  }

}
