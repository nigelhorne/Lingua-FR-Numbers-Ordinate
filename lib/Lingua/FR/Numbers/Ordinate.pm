package Lingua::FR::Numbers::Ordinate;

use 5.006;
use strict;
use warnings;

=head1 NAME

Lingua::FR::Numbers::Ordinate - Go from cardinal number (4) to ordinal ("4eme")

=head1 VERSION

Version 0.03

=cut

our $VERSION = '0.03';

=head1 SYNOPSIS

    use Lingua::FR::Numbers::Ordinate;
    print Lingua::FR::Numbers::Ordinate::ordinate(4), "\n";

=head1 DESCRIPTION

Translate from cardinal numbers (1, 2, 3) to ordinal numbers (1er, 2eme, 3eme)
amd vice versa.

=head1 SUBROUTINES/METHODS

=head2 ordinate

Translate a given number into the ordinal form.

=cut

sub ordinate
{
	my $cardinal = shift;

	if(!defined($cardinal)) {
		return '0eme';
	}
	if($cardinal !~ /[\d\-]+/) {
		warn 'Usage: ', __PACKAGE__, ':ordinate(number)';
		return;
	}
	if($cardinal == 1) {
		return '1er';
	}
	return $cardinal . 'eme';
}

=head1 AUTHOR

Nigel Horne, C<< <njh at bandsman.co.uk> >>

=head1 BUGS

It's up to you do add an e to a feminine use of ordinate(1);

=head1 SEE ALSO

L<Lingua::EN::Numbers::Ordinate>

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Lingua::FR::Numbers::Ordinate

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Lingua-FR-Numbers-Ordinate>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Lingua-FR-Numbers-Ordinate>

=item * Search CPAN

L<http://search.cpan.org/dist/Lingua-FR-Numbers-Ordinate/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2020-2021 Nigel Horne

This program is released under the following licence: GPL2

=cut

1;

__END__
