#!/usr/bin/env perl

use warnings;
use strict;

use Test::Most;
use utf8;

BEGIN { use_ok('Lingua::FR::Numbers::Ordinate') }

note('Basic ordinals');
is(Lingua::FR::Numbers::Ordinate::ordinate(1), '1er', '1 returns 1er (default masculine)');
is(Lingua::FR::Numbers::Ordinate::ordinate(1, 'm'), '1er', '1 with gender "m" returns 1er');
is(Lingua::FR::Numbers::Ordinate::ordinate(1, 'f'), '1re', '1 with gender "f" returns 1re');

is(Lingua::FR::Numbers::Ordinate::ordinate(2), '2ème', '2 returns 2ème');
is(Lingua::FR::Numbers::Ordinate::ordinate(10), '10ème', '10 returns 10ème');
is(Lingua::FR::Numbers::Ordinate::ordinate(0), '0ème', '0 returns 0ème');
is(Lingua::FR::Numbers::Ordinate::ordinate(-3), '-3ème', 'Negative number returns negative ordinal');

note('Undefined input');
is(Lingua::FR::Numbers::Ordinate::ordinate(), '0ème', 'undef input returns 0ème');

note('Invalid input');
is(Lingua::FR::Numbers::Ordinate::ordinate('abc'), undef, 'Non-numeric input returns undef');
is(Lingua::FR::Numbers::Ordinate::ordinate('--3'), undef, 'Malformed numeric input returns undef');
is(Lingua::FR::Numbers::Ordinate::ordinate('4.2.1'), undef, 'Malformed float returns undef');

note('Float input');
is(Lingua::FR::Numbers::Ordinate::ordinate(4.5), '4.5ème', 'Float returns float ordinal');

note('Reverse translation - cardinal');

is(Lingua::FR::Numbers::Ordinate::cardinal('1er'), 1, '1er -> 1');
is(Lingua::FR::Numbers::Ordinate::cardinal('1re'), 1, '1re -> 1');
is(Lingua::FR::Numbers::Ordinate::cardinal('2ème'),2, '2ème -> 2');
is(Lingua::FR::Numbers::Ordinate::cardinal('  10ème  '), 10, 'Spaces are trimmed');
is(Lingua::FR::Numbers::Ordinate::cardinal('4.5ème'), 4.5, 'Float ordinal returns float cardinal');

is(Lingua::FR::Numbers::Ordinate::cardinal('foo'), undef, 'Invalid ordinal returns undef');
is(Lingua::FR::Numbers::Ordinate::cardinal('1st'), undef, 'Unknown suffix returns undef');
is(Lingua::FR::Numbers::Ordinate::cardinal(undef), undef, 'undef input returns undef');

done_testing();
