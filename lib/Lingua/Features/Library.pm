# $Id: Library.pm,v 1.3 2004/04/13 15:03:26 guillaume Exp $
package Lingua::Features::Library;

=head1 NAME

Lingua::Features::Library - Features library object for Lingua::Features

=cut

use XML::Generator;
use Tie::IxHash;
use Lingua::Features::Type;
use Lingua::Features::Feature;
use strict;

=head1 Constructor

=head2 new(I<$types>, I<$features>)

Creates and returns a new C<Lingua::Features::Library> object.

I<$types> is an hash reference corresponding to the types of this library. Each type is given as a set of pairs of strings corresponding to the id and name of each values in its range, indexed by type name:

foo => {
    id1 => 'name1',
    id2 => 'name2'
}

This structure will get instanciated as a C<Lingua::Features::Type> object.

I<$features> is an hash reference corresponding to the features this library. Each feature is given as a pair of strings corresponding to the name of the feature and its type:

foo => 'foo_type',

This structure will get instanciated as a C<Lingua::Features::Feature> object.

=cut

sub new {
    my ($class, $types, $features) = @_;

    my $self = bless {
	_types    => {},
	_features => {},
    }, $class;

    tie %{$self->{_types}}, 'Tie::IxHash';
    tie %{$self->{_features}}, 'Tie::IxHash';

    foreach my $id (keys %$types) {
	$self->{_types}->{$id} = Lingua::Features::Type->new($id, $types->{$id});
}

    foreach my $id (keys %$features) {
	$self->{_features}->{$id} = Lingua::Features::Feature->new($id, $self->{_types}->{$features->{$id}});
}

    return $self;
}

=head1 Accessors

=head2 $library->feature(I<$id>)

Returns the feature with id I<$id>.

=cut

sub feature {
    my ($self, $id) = @_;
    return unless ref $self;
    return $self->{_features}->{$id};
}

=head2 $library->features()

Returns all the features.

=cut

sub features {
    my ($self) = @_;
    return unless ref $self;
    return values %{$self->{_features}};
}

=head2 $library->type(I<$id>)

Returns the type with id I<$id>.

=cut

sub type {
    my ($self, $id) = @_;
    return unless ref $self;
    return $self->{_types}->{$id};
}

=head2 $library->types()

Returns all the types.

=cut

sub types {
    my ($self) = @_;
    return unless ref $self;
    return values %{$self->{_types}};
}

=head1 Other methods

=head2 $library->to_xml()

Dumps the library in XML format.

=cut

sub to_xml {
    my ($self) = @_;
    return unless ref $self;

    my $xml = XML::Generator->new(pretty => 2);
    my @features;
    my @types;

    foreach my $id (sort keys %{$self->{_types}}) {
	my $type = $self->{_types}->{$id};
	my @values = ();
	foreach my $value ($type->values()) {
	    push(@values, $xml->value({
		id   => $value->id(),
		name => $value->name(),
	    }));
	}
	push(@types, $xml->type({id => $id}, @values));
    }

    foreach my $id (sort keys %{$self->{_features}}){
	my $feature = $self->{_features}->{$id};
	my $type_id = $feature->type()->id();
	push(@features, $xml->feature({id => $id, type => $type_id}));
    }

    return $xml->tagset(@types, @features);
}

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004, INRIA.

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

Guillaume Rousse <grousse@cpan.org>

=cut

1;
