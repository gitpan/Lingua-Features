# $Id: Value.pm,v 1.4 2004/04/13 15:03:26 guillaume Exp $
package Lingua::Features::Value;

=head1 NAME

Lingua::Features::Value - Value object for Lingua::Features

=cut

use strict;

=head2 new(I<$string>)

Creates and returns a new C<Lingua::Features::Value> object.

=cut

sub new {
    my ($class, $string) = @_;

    my ($id, $name) = split(/::/, $string) if $string;

    my $self = bless {
	_id    => $id,
	_name  => $name
    }, $class;

    return $self;
}

=head1 Accessors

=head2 $value->id()

Returns the value id.

=cut

sub id {
    my $self = shift;
    return $self->{_id};
}

=head2 $value->name()

Returns the value name.

=cut

sub name {
    my $self = shift;
    return $self->{_name};
}

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004, INRIA.

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

Guillaume Rousse <grousse@cpan.org>

=cut

1;
