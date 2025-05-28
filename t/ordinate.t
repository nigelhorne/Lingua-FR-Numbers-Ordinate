#!perl -wT

use strict;
use warnings;
use Test::Most tests => 7;
use Test::Warn;
use utf8::all;

BEGIN {
	use_ok('Lingua::FR::Numbers::Ordinate');
}

ORDINATE: {
	is(Lingua::FR::Numbers::Ordinate::ordinate('1'), '1er', 'first');
	is(Lingua::FR::Numbers::Ordinate::ordinate('1', 'f'), '1re', 'first - feminine');
	is(Lingua::FR::Numbers::Ordinate::ordinate(), '0ème');
	is(Lingua::FR::Numbers::Ordinate::ordinate('19'), "19\N{U+00E8}me", 'nineteenth');
	ok(Lingua::FR::Numbers::Ordinate::ordinate('-4') eq '-4ème', '-fourth');

	warning_like { Lingua::FR::Numbers::Ordinate::ordinate('one') } qr/^Usage/, 'verify only numbers are allowed';
}
