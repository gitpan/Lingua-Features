# $Id: Makefile.PL,v 1.3 2004/04/13 15:03:05 guillaume Exp $

use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'         => 'Lingua::Features',
    'VERSION_FROM' => 'lib/Lingua/Features.pm',
    'AUTHOR'       => 'Guillaume Rousse',
    'PREREQ_PM'    => {
	'XML::Generator' => 0,
	'Tie::IxHash'    => 0
    }
);
