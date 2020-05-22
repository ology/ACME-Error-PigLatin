package ACME::Error::PigLatin;

# ABSTRACT: die and warn in piglatin

our $VERSION = '0.0100';

use strict;
no strict 'refs';
use warnings;

use Lingua::PigLatin 'piglatin';

=head1 SYNOPSIS

  use ACME::Error 'PigLatin';

  warn 'Something happened'; #

  die 'Oof!'; # Oofway!

=head1 DESCRIPTION

C<Acme::Error::PigLatin> generates die and warn messages in piglatin.

=cut

*warn_handler = *die_handler = sub {
  my @error = @_;
  for (0 .. @error - 1) {
    if ($error[$_] =~ /^(.+?) at (.+)$/) {
      my $msg = piglatin($1);
      my $loc = $2;
      $error[$_] = "$msg at $loc";
    }
  }
  return @error;
};

1;
__END__

=head1 SEE ALSO

L<ACME::Error>

L<Lingua::PigLatin>

=cut
