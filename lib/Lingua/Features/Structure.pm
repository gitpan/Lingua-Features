# $Id: Structure.pm,v 1.3 2004/04/13 15:03:26 guillaume Exp $
package Lingua::Features::Structure;

=head1 NAME

Lingua::Features::Structure - Structure object for Lingua::Features

=cut

use XML::Generator;
use Lingua::Features::Tag;
use Tie::IxHash;
use strict;

my $tag_delimiter = ' ';

=head1 Constructor

=head2 new(I<%tags>)

Creates and returns a new C<Lingua::Features::Structure> object.

=cut

sub new {
    my ($class, %tags) = @_;

    my $self = bless {
	_tags => {}
    }, $class;

    tie %{$self->{_tags}}, 'Tie::IxHash';

    foreach my $name (keys %tags) {
	$self->{_tags}->{$name} = Lingua::Features::Tag->new($name, @{$tags{$name}});
    }

    return $self;
}

=head2 from_string(I<$string>)

Creates and returns a new C<Lingua::Features::Structure> object from a string representation.

=cut

sub from_string {
    my ($class, $string) = @_;

    my $self = bless {
	_tags => {}
    }, $class;

    tie %{$self->{_tags}}, 'Tie::IxHash';

    foreach my $token (split(/$tag_delimiter/, $string)) {
	my $tag = Lingua::Features::Tag->from_string($token);
	$self->{_tags}->{$tag->id()} = $tag;
    }

    return $self;
}

=head1 Accessors

=head2 $structure->tags(I<%tags>)

Sets of returns the tags composing the structure.

=cut

sub tags {
    my $self = shift;
    if (@_) {
	my %tags = @_;
	foreach my $name (keys %tags) {
	    $tags{$name} = Lingua::Features::Tag->new($name, @{$tags{$name}});
	}
	$self->{_tags} = \%tags;
    } else {
	return values %{$self->{_tags}};
    }
}

=head2 $structure->tag(I<$id>, I<@values>)

Sets of returns tag I<$id>.

=cut

sub tag {
    my $self = shift;
    my $id = shift;
    if (@_) {
	my @values = @_;
	$self->{_tags}->{$id} = Lingua::Features::Tag->new($id, @values);
    } else {
	return $self->{_tags}->{$id};
    }
}

=head1 Other methods

=head2 $structure->to_string()

Dumps the structure in string format.

=cut

sub to_string {
    my ($self) = @_;
    
    return
	join($tag_delimiter, map { $_->to_string() } values %{$self->{_tags}});
}

=head2 $structure->to_xml()

Dumps the structure in XML format.

=cut

sub to_xml {
    my ($self) = @_;

    my $xml = XML::Generator->new(pretty => 2);

    return $xml->fs(map { $_->to_xml($xml) } values %{$self->{_tags}});
}

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004, INRIA.

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

Guillaume Rousse <grousse@cpan.org>

=cut

1;
