# $Id: Tag.pm,v 1.3 2004/04/13 15:03:26 guillaume Exp $
package Lingua::Features::Tag;

=head1 NAME

Lingua::Features::Tag - Tag object for Lingua::Features

=cut

use strict;

my $internal_delimiter  = '@';
my $value_delimiter = '|';

=head1 Accessors

=head2 new(I<$id>, I<@values>)

Creates and returns a new C<Lingua::Features::Tag> object.

=cut

sub new {
    my ($class, $id, @values) = @_;

    my $self = bless {
	_id     => $id,
	_values => \@values
    }, $class;

    return $self;
}

=head2 from_string(I<$string>)

Creates and returns a new C<Lingua::Features::Tag> object from a string representation.

=cut

sub from_string {
    my ($class, $string) = @_;

    my ($id, $value) = split(/$internal_delimiter/, $string);
    my @values = split(/\Q$value_delimiter/, $value);

    my $self = bless {
	_id     => $id,
	_values => \@values
    }, $class;

    return $self;
}

=head1 Accessors

=head2 $tag->id(I<$id>)

Sets or returns the tag id.

=cut

sub id {
    my ($self, $id) = @_;
    return unless ref $self;
    if ($id) {
	$self->{_id} = $id;
    } else {
	return $self->{_id};
    }
}

=head2 $tag->values(I<@values>)

Sets or returns the tag values.

=cut

sub values {
    my ($self, @values) = @_;
    return unless ref $self;
    if (@values) {
	$self->{_values} = \@values;
    } else {
	return @{$self->{_values}};
    }
}

=head1 Other methods

=head2 $tag->to_string()

Dumps the tag in string format.

=cut

sub to_string {
    my ($self) = @_;
    return
	$self->{_id} .
	$internal_delimiter .
	join($value_delimiter, @{$self->{_values}});
}

=head2 $tag->to_xml()

Dumps the tag in XML format.

=cut

sub to_xml {
    my ($self, $xml) = @_;

    return unless @{$self->{_values}};

    my @values = map { $xml->sym({value => $_}) } @{$self->{_values}};

    return $xml->f(
	{id => $self->{_id}},
	@values > 1 ? $xml->vAlt(@values) : @values
    );
}

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004, INRIA.

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

Guillaume Rousse <grousse@cpan.org>

=cut

1;
