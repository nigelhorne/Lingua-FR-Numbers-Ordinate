#!perl -T

use strict;

use Test::Most tests => 3;
use Test::NoWarnings;

BEGIN {
	use_ok('Lingua::FR::Numbers::Ordinate') || print 'Bail out!';
}

require_ok('Lingua::FR::Numbers::Ordinate') || print 'Bail out!';

diag( "Testing Lingua::FR::Numbers::Ordinate $Lingua::FR::Numbers::Ordinate::VERSION, Perl $], $^X" );
