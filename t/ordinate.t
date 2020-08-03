#!perl -wT

use strict;
use warnings;
use Test::Most tests => 5;
use Test::Warn;

BEGIN {
	use_ok('Lingua::FR::Numbers::Ordinate');
}

ORDINATE: {
	ok(Lingua::FR::Numbers::Ordinate::ordinate('1') eq '1er');
	ok(Lingua::FR::Numbers::Ordinate::ordinate() eq '0e');
	ok(Lingua::FR::Numbers::Ordinate::ordinate('-4') eq '-4e');

	warning_like { Lingua::FR::Numbers::Ordinate::ordinate('one') } qr/^Usage/, 'verify only numbers are allowed';
}
