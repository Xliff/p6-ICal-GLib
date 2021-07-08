use ICal::GLib::DerivedProperties;

my %pt;
my @sets = ICal::GLib::DerivedProperties::Master.^methods(:local)
                                                .grep(
                                                   *.name.starts-with("set_")
                                                );

for @sets {
  my $n = .name.substr(4);
  my $p = .signature.params[1];
  say qq:to/CLASS/;
    class ICal::GLib::DerivedProperty::{ $n } is ICal::GLib::Property \{
      method new ({ $p.type.^name } { $p.name }) \{
        my \$ical-parameter = i_cal_property_new_{ $n }({ $p.name });

        \$ical-parameter ?? self.bless( :\$ical-parameter ) !! Nil;
      \}

      method { $n } is rw \{
        Proxy.new:
          FETCH => -> \$     \{ self.get_{ $n }    \},
          STORE => -> \$, \\v \{ self.set_{ $n }(v) \};
      \}

      method get_{ $n } \{
        i_cal_parameter_get_{ $n }(self.ICalProperty);
      \}

      method set_{ $n } ({ $p.type.^name } { $p.name }) \{
        i_cal_parameter_set_{$n}(self.ICalProperty, { $p.name });
      \}
    \}
    CLASS
}
