#!/usr/bin/perl
# $Id: comparison.t,v 1.1 2004/06/09 13:16:28 rousse Exp $

use Lingua::Features;
use Test::More tests => 4;
use strict;

my $struc1 = Lingua::Features::Structure->from_string('cat@noun type@proper gender@masc num@sing');
my $struc2 = Lingua::Features::Structure->from_string('cat@noun type@proper');

ok(
    $struc2->is_subset($struc1),
    'cat@noun type@proper subset of cat@noun type@proper gender@masc num@sing'
);

ok(
    ! $struc1->is_subset($struc2),
    'cat@noun type@proper gender@masc num@sing not subset of cat@noun type@proper'
);

ok(
    $struc2->is_compatible($struc1),
    'cat@noun type@proper compatible with cat@noun type@proper gender@masc num@sing'
);

ok(
    $struc1->is_compatible($struc2),
    'cat@noun type@proper gender@masc num@sing compatible with cat@noun type@proper'
);
