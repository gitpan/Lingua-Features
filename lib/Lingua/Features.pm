# $Id: Features.pm,v 1.9 2004/04/16 13:34:34 guillaume Exp $
package Lingua::Features;

=head1 NAME

Lingua::Features - Natural languages features

=head1 VERSION

Version 0.2

=head1 DESCRIPTION

This module implements natural languages features in Perl.

=head1 SYNOPSIS

    use Lingua::Features;

    my $struc = Lingua::Features::Structure->new(
	type      => [ 'verb' ],
	verb_type => [ 'main' ],
	tense     => [ 'pres' ],
	mode      => [ 'ind' ] ,
	pers      => [ '3' ] ,
	num       => [ 'sing' ]
    );

    print $struc->to_string();

    print $struc->to_xml();

=cut

use Lingua::Features::Library;
use Lingua::Features::Feature;
use Lingua::Features::Type;
use Lingua::Features::Value;
use Lingua::Features::Structure;
use Lingua::Features::Tag;
use strict;

our $VERSION = '0.2';

our $lib = Lingua::Features::Library->new(
    {
	cat_type => {
	    abr     => 'abreviation',
	    adj     => 'adjective',
	    adv     => 'adverb',
	    advneg  => 'negative_adverb',
	    x       => 'x',
	    cl      => 'cl',
	    cla     => 'cla',
	    cld     => 'cld',
	    cln     => 'cln',
	    clng    => 'clng',
	    det     => 'det',
	    noun    => 'noun',
	    pron    => 'pronoun',
	    ponct   => 'ponctuation',
	    pp      => 'pp',
	    prep    => 'prep',
	    pref    => 'pref',
	    s       => 's',
	    verb    => 'verb',
	    vm      => 'vm',
	    cc      => 'cc',
	    cs      => 'cs',
	    interj  => 'interjection',
	},
	det_type_type => {
	    art  => 'article',
	    dem  => 'demonstrative',
	    ind  => 'indefini',
	    def  => 'defini',
	    poss => 'possessive',
	    int  => 'interrogative',
	    excl => 'exclusive',
	    part => 'partitive',
	    card => 'cardinal',
	},
	adj_type_type => {
	    qual => 'qualitative',
	    ord  => 'ordinal',
	    ind  => 'indefi',
	    poss => 'possessive',
	    card => 'cardinal',
	    int  => 'interrogative',
	},
	noun_type_type => {
	    common => 'common',
	    proper => 'proper',
	    dist   => 'distinguished',
	    ord    => 'ordinal', # FIXME
	},
	pron_type_type => {
	    pers => 'personal',
	    dem  => 'demonstrative',
	    ind  => 'indefini',
	    poss => 'possessive',
	    int  => 'interrogative',
	    rel  => 'relative',
	    cli  => 'clitique'
	},
	verb_type_type => {
	    avoir => 'avoir',
	    etre  => 'etre',
	    main  => 'main',
	},
	mode_type => {
	    ind  => 'indicative',
	    subj => 'subjonctive',
	    imp  => 'imperative',
	    cond => 'conditionnal',
	    inf  => 'infinitive',
	    part => 'participe',
	},
	tense_type => {
	    pres => 'present',
	    imp  => 'imparfait',
	    fut  => 'future',
	    past => 'past',
	},
	pers_type => {
	    1 => '1',
	    2 => '2',
	    3 => '3',
	},
	gender_type => {
	    masc => 'masculin',
	    fem  => 'feminin',
	},
	num_type => {
	    pl   => 'plural',
	    sing => 'singular',
	},
	case_type => {
	    acc => 'accusative',
	    dat => 'dative',
	    gen => 'genitive',
	    nom => 'nominative',
	    obl => 'oblique',
	    ref => 'reflexive'
	},
	restr_type => {
	    moinshum => 'moinshum',
	    plushum  => 'plushum',
	},
	wh_type => {
	    plus  => 'plus',
	    minus => 'minus',
	    rel   => 'rel',
	},
	bool_type => {
	    plus  => 'plus',
	    minus => 'minus',
	},
	def_type => {
	    def => 'defini',
	    ind => 'indefini',
	},
	degree_type => {
	    pos  => 'pos',
	    comp => 'comp',
	},
	res_type => {
	    unit => 'unit',
	    exp  => 'expression',
	    for  => 'foreign',
	},
	sem_type => {
	    pl  => 'place',
	    inh => 'inhabitant',
	    ent => 'entity',
	}
    },
    {
	cat       => 'cat_type_type',
	det_type  => 'det_type_type',
	adj_type  => 'adj_type_type',
	noun_type => 'noun_type_type',
	pron_type => 'pron_type_type',
	verb_type => 'verb_type_type',
	mode      => 'mode_type',
	tense     => 'tense_type',
	pers      => 'pers_type',
	gender    => 'gender_type',
	num       => 'num_type',
	numposs   => 'num_type',
	def       => 'def_type',
	case      => 'case_type',
	restr     => 'restr_type', 
	wh        => 'wh_type',
	bool      => 'bool_type',
	degree    => 'degree_type',
	res       => 'res_type', 
	sem       => 'sem_type'
    }
);

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004, INRIA.

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

Guillaume Rousse <grousse@cpan.org>

=cut

1;
