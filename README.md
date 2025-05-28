# NAME

Lingua::FR::Numbers::Ordinate - Go from cardinal number (4) to ordinal ("4ème")

# VERSION

Version 0.04

# SYNOPSIS

    use Lingua::FR::Numbers::Ordinate;
    use utf8::all;

    print Lingua::FR::Numbers::Ordinate::ordinate(4), "\n";

# DESCRIPTION

Concert from cardinal numbers (1, 2, 3) to ordinal numbers (1er, 2ème, 3ème)
and vice versa.

# SUBROUTINES/METHODS

## ordinate

    my $ordinal = ordinate($number);
    my $ordinal = ordinate($number, $gender);

Convert a cardinal number into its ordinal French representation.

- `$number` (required)

    The cardinal number to convert. Must be an integer or numeric string. If undefined, returns `"0ème"`.

- `$gender` (optional)

    Specifies the grammatical gender to use for the ordinal form of `1`. 

    Valid values are:

    - `'m'` — masculine (default): returns `"1er"`
    - `'f'` — feminine: returns `"1re"`

    This parameter has no effect for numbers other than `1`.

### Examples

    ordinate(1) => "1er"
    ordinate(1, 'm') => "1er"
    ordinate(1, 'f') => "1re"
    ordinate(2) => "2ème"
    ordinate(undef)=> "0ème"

## cardinal

    my $number = cardinal($ordinal);

Convert an ordinal string (e.g., `"2ème"`, `"1er"`) back to its numeric cardinal form.

Returns the corresponding number or `undef` if the input is invalid.

### Examples

    cardinal("1er") => 1
    cardinal("1re") => 1
    cardinal("2ème")=> 2
    cardinal("4.5ème") => 4.5

# AUTHOR

Nigel Horne, `<njh at nigelhorne.com>`

# BUGS

# SEE ALSO

[Lingua::EN::Numbers::Ordinate](https://metacpan.org/pod/Lingua%3A%3AEN%3A%3ANumbers%3A%3AOrdinate)

# SUPPORT

This module is provided as-is without any warranty.

You can find documentation for this module with the perldoc command.

        perldoc Lingua::FR::Numbers::Ordinate

You can also look for information at:

- RT: CPAN's request tracker

    [http://rt.cpan.org/NoAuth/Bugs.html?Dist=Lingua-FR-Numbers-Ordinate](http://rt.cpan.org/NoAuth/Bugs.html?Dist=Lingua-FR-Numbers-Ordinate)

- Search CPAN

    [http://search.cpan.org/dist/Lingua-FR-Numbers-Ordinate/](http://search.cpan.org/dist/Lingua-FR-Numbers-Ordinate/)

# LICENSE AND COPYRIGHT

Copyright 2020-2025 Nigel Horne

This program is released under the following licence: GPL2
