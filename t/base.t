#!/usr/bin/perl
# $Id: base.t,v 1.3 2004/05/03 12:46:27 guillaume Exp $

use Lingua::Features;
use Test::More tests => 6;
use strict;

BEGIN {
    use_ok 'Lingua::Features::FeatureType';
    use_ok 'Lingua::Features::StructureType';
}

isa_ok(
    Lingua::Features::FeatureType->type('noun'),
    'Lingua::Features::FeatureType'
);

isa_ok(
    Lingua::Features::StructureType->type('noun'),
    'Lingua::Features::StructureType'
);

ok(
    eq_array(
	[ Lingua::Features::StructureType->type('noun')->features() ],
	[ qw/type gender num sem/ ]
    ),
    'features list'
);

ok(
    eq_set(
	[ Lingua::Features::FeatureType->type('noun')->values() ],
	[ qw/ord proper dist common/ ]
    ),
    'values set'
);
