#!/usr/bin/perl
# $Id: base.t,v 1.1 2004/04/13 15:04:08 guillaume Exp $

use Lingua::Features;
use Test::More tests => 5;
use strict;

isa_ok(
    Lingua::Features::Feature->new(),
    'Lingua::Features::Feature',
    'Feature instanciation'
);
isa_ok(
    Lingua::Features::Type->new(),
    'Lingua::Features::Type',
    'Type instanciation'
);
isa_ok(
    Lingua::Features::Value->new(),
    'Lingua::Features::Value',
    'Value instanciation'
);
isa_ok(
    Lingua::Features::Structure->new(),
    'Lingua::Features::Structure',
    'Structure instanciation'
);
isa_ok(
    Lingua::Features::Tag->new(),
    'Lingua::Features::Tag',
    'Structure instanciation'
);
