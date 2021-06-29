use v6.c;

use Method::Also;
use NativeCall;

use NativeHelpers::Blob;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Attach;

use ICal::GLib::Object;

our subset ICalAttachAncestry is export of Mu
  where ICalAttach | ICalObjectAncestry;

class ICal::GLib::Attach is ICal::GLib::Object {
  has ICalAttach $!ica;

  submethod BUILD (:$ical-attach) {
    self.setICalAttach($ical-attach) if $ical-attach;
  }

  method setICalAttach(ICalAttachAncestry $_) {
    my $to-parent;

    $!ica = do {
      when ICalAttach {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalAttach, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalAttach
    is also<ICalAttach>
  { $!ica }

  method ICal::Raw::Definitions::icalattach
    is also<icalattach>
  { cast(icalattach, self.get_native) }

  multi method new (icalattach $native-attach, :$raw = False) {
    use NativeCall;

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      icalattach,
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-attach,
      &i_cal_attach_unref,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalAttachAncestry $ical-attach, :$ref = True) {
    return Nil unless $ical-attach;

    my $o = self.bless( :$ical-attach );
    $o.ref if $ref;
    $o;
  }

  method new_from_bytes (GBytes() $bytes) is also<new-from-bytes> {
    my $ical-attach = i_cal_attach_new_from_bytes($bytes);

    $ical-attach ?? self.bless( :$ical-attach ) !! Nil;
  }

  proto method new_from_data (|)
      is also<new-from-data>
  { * }

  multi method new_from_data (
    Str() $buf,
          :$encoding = 'utf8'
  ) {
    samewith( $buf.encode($encoding) );
  }
  multi method new_from_data (Blob $buf) {
    samewith( pointer-to($buf) );
  }
  multi method new_from_data (CArray[uint8] $data) {
    samewith( pointer-to($data) );
  }
  multi method new_from_data (
    Pointer $data,
            &free_fn      = Callable,
    Pointer $free_fn_data = gpointer
  ) {
    my $ical-attach = i_cal_attach_new_from_data(
      $data,
      &free_fn,
      $free_fn_data
    );

    $ical-attach ?? self.bless( :$ical-attach ) !! Nil;
  }

  method new_from_url (Str() $url) is also<new-from-url> {
    my $ical-attach = i_cal_attach_new_from_url($url);

    $ical-attach ?? self.bless( :$ical-attach ) !! Nil;
  }


  method get_data (:$buf = False, :$size, :$null = False)
    is also<
      get-data
      data
    >
  {
    my $data = i_cal_attach_get_data($!ica);
    return $data unless $buf;

    if $size || $null {
      die 'Cannot use both :$size and :$null in call to .get_data'
        unless $size ?^ $null;
    }

    $data = SizedCArray.new($data, $size) if $size;
    $data = nullTerminatedBuffer($data)   if $null;

    Buf.new($data.Array);
  }

  # Camel cased since API exclusive, but offers standard aliases.
  method getString ( :$encoding = 'utf-8' )
    is also<
      get_string
      get-string
      string
    >
  {
    # cw: -XXX- Not working with string equivalence. Does this embed the
    #           NULL termiator?
    self.get_data( :buf, :null ).decode($encoding);
  }

  method get_is_url
    is also<
      get-is-url
      is_url
      is-url
    >
  {
    so i_cal_attach_get_is_url($!ica);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_attach_get_type, $n, $t );
  }

  method get_url
    is also<
      get-url
      url
    >
  {
    i_cal_attach_get_url($!ica);
  }

  method ref {
    i_cal_attach_ref($!ica);
    self;
  }

  method unref {
    i_cal_attach_unref($!ica);
  }
}
