# $Id: Feature.pm,v 1.3 2004/04/13 15:03:26 guillaume Exp $
package Lingua::Features::Feature;

=head1 NAME

Lingua::Features::Feature - Feature object for Lingua::Features

=cut

use strict;

=head1 Constructor

=head2 new(I<$id>, I<$type>)

Creates and returns a new C<Lingua::Features::Feature> object.

I<$id> is the id of the feature.

I<$type> is the type of the feature.

=cut


sub new {
    my ($class, $id, $type) = @_;

    my $self = bless {
	_id   => $id,
	_type => $type,
    }, $class;

    return $self;
}

=head1 Accessors

=head2 $feature->id()

Returns the id.

=cut

sub id {
    my ($self) = @_;
    return unless ref $self;
    return $self->{_id};
}

=head2 $feature->type()

Returns the type.

=cut

sub type {
    my ($self) = @_;
    return unless ref $self;
    return $self->{_type};
}

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004, INRIA.

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

Guillaume Rousse <grousse@cpan.org>

=cut

1;
