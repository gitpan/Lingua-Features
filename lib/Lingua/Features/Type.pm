# $Id: Type.pm,v 1.3 2004/04/13 15:03:26 guillaume Exp $
package Lingua::Features::Type;

=head1 NAME

Lingua::Features::Type - Type object for Lingua::Features

=cut

use Lingua::Features::Value;
use strict;

=head1 Constructor

=head2 new(I<$id>, I<$values>)

Creates and returns a new C<Lingua::Features::Type> object.

I<$id> is the id of the type.

I<$values> is a hash reference of value names indexed by id.

=cut

sub new {
    my ($class, $id, $values) = @_;

    my $self = bless {
	_id     => $id,
	_values => {}
    }, $class;

    foreach my $id (keys %$values) {
	$self->{_values}->{$id} = Lingua::Features::Value->new($id, $values->{$id});
    }

    return $self;
}

=head1 Accessors

=head2 $type->id()

Returns the type id.

=cut

sub id {
    my ($self) = @_;
    return unless ref $self;
    return $self->{_id};
}

=head2 $type->values()

Returns the values.

=cut

sub values {
    my ($self) = @_;
    return unless ref $self;
    return keys %{$self->{_values}};
}

=head2 $type->value(I<$id>)

Returns the value with id I<$id>.

=cut

sub value {
    my ($self, $id) = @_;
    return unless ref $self;
    return $self->{_values}->{$id};
}

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004, INRIA.

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

Guillaume Rousse <grousse@cpan.org>

=cut

1;
