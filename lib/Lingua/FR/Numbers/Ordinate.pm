package Lingua::FR::Numbers::Ordinate;

use 5.006;

use strict;
use warnings;

use Scalar::Util qw(looks_like_number);

=encoding UTF-8

=head1 NAME

Lingua::FR::Numbers::Ordinate - Go from cardinal number (4) to ordinal ("4ème")

=head1 VERSION

Version 0.05

=cut

our $VERSION = '0.05';

=head1 SYNOPSIS

    use Lingua::FR::Numbers::Ordinate;
    use utf8::all;

    print Lingua::FR::Numbers::Ordinate::ordinate(4), "\n";

=head1 DESCRIPTION

Concert from cardinal numbers (1, 2, 3) to ordinal numbers (1er, 2ème, 3ème)
and vice versa.

=head1 SUBROUTINES/METHODS

=head2 ordinate

    my $ordinal = ordinate($number);
    my $ordinal = ordinate($number, $gender);

Convert a cardinal number into its ordinal French representation.

=over 4

=item * C<$number> (required)

The cardinal number to convert. Must be an integer or numeric string. If undefined, returns C<"0ème">.

=item * C<$gender> (optional)

Specifies the grammatical gender to use for the ordinal form of C<1>. 

Valid values are:

=over 4

=item * C<'m'> — masculine (default): returns C<"1er">

=item * C<'f'> — feminine: returns C<"1re">

=back

This parameter has no effect for numbers other than C<1>.

=back

=head3 Examples

    ordinate(1) => "1er"
    ordinate(1, 'm') => "1er"
    ordinate(1, 'f') => "1re"
    ordinate(2) => "2ème"
    ordinate(undef)=> "0ème"

=cut

sub ordinate {
	my ($cardinal, $gender) = @_;

	if(!defined($cardinal)) {
		return "0\N{U+00E8}me";
	}

	if(!looks_like_number($cardinal)) {
		warn 'Usage: ', __PACKAGE__, '::ordinate(number)';
		return;
	}

	if($cardinal == 1) {
		if((defined($gender)) && ($gender eq 'f')) {
			return '1re';
		} else {
			return '1er';
		}
	}

	return $cardinal . "\N{U+00E8}me";  # ème
}

=head2 cardinal

    my $number = cardinal($ordinal);

Convert an ordinal string (e.g., C<"2ème">, C<"1er">) back to its numeric cardinal form.

Returns the corresponding number or C<undef> if the input is invalid.

=head3 Examples

    cardinal("1er") => 1
    cardinal("1re") => 1
    cardinal("2ème")=> 2
    cardinal("4.5ème") => 4.5

=cut

sub cardinal {
    my $ordinal = shift;

    return unless defined $ordinal;

    # Trim leading/trailing whitespace
    $ordinal =~ s/^\s+|\s+$//g;

    # Match digit/floating-point part followed by allowed suffixes (er, re, ème)
    if ($ordinal =~ /^(\d+(?:\.\d+)?)(?:er|re|(?:\N{U+00E8})me)$/) {
        return 0 + $1;  # Ensure numeric context
    }

    return;
}

=head1 AUTHOR

Nigel Horne, C<< <njh at nigelhorne.com> >>

=head1 BUGS

=head1 SEE ALSO

L<Lingua::EN::Numbers::Ordinate>

=head1 SUPPORT

This module is provided as-is without any warranty.

You can find documentation for this module with the perldoc command.

	perldoc Lingua::FR::Numbers::Ordinate

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Lingua-FR-Numbers-Ordinate>

=item * Search CPAN

L<http://search.cpan.org/dist/Lingua-FR-Numbers-Ordinate/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2020-2025 Nigel Horne

This program is released under the following licence: GPL2

=cut

1;

__END__
