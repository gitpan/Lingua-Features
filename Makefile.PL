# $Id: Makefile.PL,v 1.4 2004/06/09 13:17:41 rousse Exp $

use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'         => 'Lingua::Features',
    'VERSION_FROM' => 'lib/Lingua/Features.pm',
    'AUTHOR'       => 'Guillaume Rousse',
    'PREREQ_PM'    => {
	'XML::Generator' => 0,
	'Tie::IxHash'    => 0,
	'List::Compare'  => 0
    }
);
