#!/usr/bin/perl
# $Id: strings.t,v 1.1 2004/04/13 15:04:18 guillaume Exp $

use Lingua::Features;
use Test::More;
use strict;

# compute plan
open(STRINGS, 'strings') or die "unable to open strings: $!";
my @strings = <STRINGS>;
close(STRINGS);
plan tests => scalar @strings;

foreach my $string (@strings) {
    chomp $string;
    isa_ok(
	Lingua::Features::Structure->from_string($string),
	'Lingua::Features::Structure',
	"$string parsing"
    );
}
