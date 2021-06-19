use v6.c;

use Method::Also;

use ICal::GLib::Raw::Types;
use ICal::GLib::Raw::Parser;

use ICal::GLib::Object;

our subset ICalParserAncestry is export of Mu
  where ICalParser | ICalObjectAncestry;

class ICal::GLib::Parser is ICal::GLib::Object {
  has ICalParser $!icp;

  submethod BUILD (:$parser) {
    self.setICalParser($parser) if $parser;
  }

  method setICalParser(ICalParserAncestry $_) {
    my $to-parent;

    $!icp = do {
      when ICalParser {
        $to-parent = cast(ICalObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(ICalParser, $_);
      }
    }
    self.setICalObject($to-parent);
  }

  method ICal::GLib::Raw::Definitions::ICalParser
    is also<ICalParser>
  { $!icp }

  method ICal::Raw::Definitions::ICalParser
    is also<icalparser>
  { cast(ICalParser, self.get_native) }

  multi method new (ICalParser $native-parser, :$raw = False) {
    use NativeCall;

    # cw: Avaialble in ::Raw::Object, but shouldn't this conserve memory?
    sub i_cal_object_construct (
      GType,
      ICalParser,
      &func,
      gboolean,
      GObject
    )
      is native(ical-glib)
    { * }

    my $gc = i_cal_object_construct(
      self.get_type,
      $native-parser,
      &i_cal_parser_free,
      0,
      GObject
    );

    return $gc unless $raw;

    samewith($gc);
  }
  multi method new (ICalParserAncestry $parser, :$ref = True) {
    return Nil unless $parser;

    my $o = self.bless( :$parser );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $parser = i_cal_parser_new();

    $parser ?? self.bless( :$parser ) !! Nil;
  }

  method add_line (Str() $str, :$raw = False) is also<add-line> {
    my $c = i_cal_parser_add_line($!icp, $str);

    $c ??
      ( $raw ?? $c !! ICal::GLib::Component.new($c, :!ref) )
      !!
      Nil;
  }

  method clean (:$raw = False) {
    my $c = i_cal_parser_clean($!icp);

    $c ??
      ( $raw ?? $c !! ICal::GLib::Component.new($c, :!ref) )
      !!
      Nil;
  }

  method free {
    i_cal_parser_free($!icp);
  }

  method get_line (&func, gpointer $user_data = gpointer) is also<get-line> {
    i_cal_parser_get_line($!icp, &func, $user_data);
  }

  method get_state is also<get-state> {
    ICalParserStateEnum( i_cal_parser_get_state($!icp) );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &i_cal_parser_get_type, $n, $t );
  }

  method parse (&func, gpointer $user_data = gpointer, :$raw = False) {
    my $c = i_cal_parser_parse($!icp, &func, $user_data);

    $c ??
      ( $raw ?? $c !! ICal::GLib::Component.new($c, :!ref) )
      !!
      Nil;
  }

  method parse_string (ICal::GLib::Parser:U: Str() $string, :$raw = False) is also<parse-string> {
    my $c = i_cal_parser_parse_string($string);

    $c ??
      ( $raw ?? $c !! ICal::GLib::Component.new($c, :!ref) )
      !!
      Nil;
  }

}
