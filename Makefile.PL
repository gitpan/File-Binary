use ExtUtils::MakeMaker;

$module = 'Binary.pm';

%depends = (    'IO::Scalar' => 0,
		'Test::More' => 0,
              );

# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'File::Binary',
    'VERSION_FROM'	=> 'Binary.pm', # finds $VERSION
    'PREREQ_PM'		=> \%depends,
    'AUTHOR'            => 'Simon Wistow <simon@thegestalt.org>',
) if $0 =~ m/makefile.pl/i;

sub MY::postamble {
    return <<EOF
README: $module Changes ../makereadme
\t../makereadme $module \$(NAME) \$(VERSION) > README

dist: README

EOF
}

1;
