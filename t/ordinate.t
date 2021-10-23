#!perl -wT

use strict;
use warnings;
use Test::Most tests => 6;
use Test::Warn;

BEGIN {
	use_ok('Lingua::FR::Numbers::Ordinate');
}

ORDINATE: {
	is(Lingua::FR::Numbers::Ordinate::ordinate('1'), '1er', 'first');
	ok(Lingua::FR::Numbers::Ordinate::ordinate() eq '0eme');
	is(Lingua::FR::Numbers::Ordinate::ordinate('-4'), '-4eme', '-fourth');
	is(Lingua::FR::Numbers::Ordinate::ordinate('19'), '19eme', 'nineteenth');

	warning_like { Lingua::FR::Numbers::Ordinate::ordinate('one') } qr/^Usage/, 'verify only numbers are allowed';
}
