use strict;
use warnings;
use ExtUtils::MakeMaker 6.64;	# 6.64 for TEST_REQUIRES

WriteMakefile(
	NAME		=> 'Lingua::FR::Numbers::Ordinate',
	AUTHOR		=> q{Nigel Horne <njh@bandsman.co.uk>},
	VERSION_FROM	=> 'lib/Lingua/FR/Numbers/Ordinate.pm',
	ABSTRACT_FROM	   => 'lib/Lingua/FR/Numbers/Ordinate.pm',
	((defined($ExtUtils::MakeMaker::VERSION) &&
	 ($ExtUtils::MakeMaker::VERSION >= 6.3002))
	  ? ('LICENSE'=> 'GPL')
	  : ()),
	PL_FILES	=> {},
	TEST_REQUIRES => {
		'Test::Exception' => 0.42,
		'Test::Most' => 0,
		'Test::NoWarnings' => 0,
		# 'Test::Kwalitee' => 0,
		'Test::Warn' => 0,
		'utf8::all' => 0,
	}, PREREQ_PM => {
	}, dist		=> { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
	clean		=> { FILES => 'Lingua-FR-Numbers-Ordinate-*' },
	# META_ADD => {
		# provides => {}
	# },
	META_MERGE		=> {
		'meta-spec' => { version => 2 },
		resources => {
			repository => {
				type => 'git',
				url => 'git://github.com/nigelhorne/Lingua-FR-Numbers-Ordinate.git',
				web => 'https://github.com/nigelhorne/Lingua-FR-Numbers-Ordinate',
				repository => 'https://github.com/nigelhorne/Lingua-FR-Numbers-Ordinate',
			},
			bugtracker => {
				# web => 'https://rt.cpan.org/Public/Dist/Display.html?Name=Lingua-FR-Numbers-Ordinate',
				# mailto => 'bug-Lingua-FR-Numbers-Ordinate@rt.cpan.org'
				web => 'https://github.com/nigelhorne/Lingua-FR-Numbers-Ordinate/issues',
				url => 'https://github.com/nigelhorne/Lingua-FR-Numbers-Ordinate/issues',
			}
		},
	},
	MIN_PERL_VERSION	=> '5.6.2'	# Probably would work, but never tested on earlier versions than this
);
