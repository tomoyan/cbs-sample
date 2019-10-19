package PriorityQueue;

use strict;
use warnings;
use Data::Dumper;
use List::Util qw( max );

# https://perlweeklychallenge.org/blog/perl-weekly-challenge-018/
# Task #2
# Write a script to implement Priority Queue.
# It is like regular queue except each element has a priority associated with it.
# In a priority queue, an element with high priority is served before an element with low priority.
# Please check this wiki page for more informations.
# It should serve the following operations:
# 1) is_empty: check whether the queue has no elements.
# 2) insert_with_priority: add an element to the queue with an associated priority.
# 3) pull_highest_priority_element: remove the element from the queue
# that has the highest priority, and return it.
# If two elements have the same priority, then return element added first.

sub new {
    my ( $class, $args ) = @_;
    my $self = bless $args, $class;
}

# 1) is_empty: check whether the queue has no elements.
# If queue is empty, return 0
# If not empty, return 1
sub is_empty {
    my $self = shift;

    if ( scalar keys %{ $self->{queue} } ) {
        return 1;
    }

    return 0;
}

# 2) insert_with_priority: add an element to the queue with an associated priority.
# If insert is successful, return 1
# return 0 if missing arguments
sub insert_with_priority {
    my $self = shift;
    my $args = shift;
    my $priority = $args->{priority};
    my $element = $args->{element};

    if ( $priority && $element ) {
        push @{ $self->{queue}{$priority} }, $element;
        return 1;
    }
    else {
        return 0;
    }
}

# 3) pull_highest_priority_element: remove the element from the queue
# that has the highest priority, and return it.
# If two elements have the same priority, then return element added first.
sub pull_highest_priority_element {
    my $self = shift;

    # Check empty queue
    if ( !$self->is_empty() ) {
        return;
    }

    my $queue = $self->{queue};
    my @keys = keys %$queue;
    my $highest_key = max @keys;
    my $element = shift( @{$queue->{$highest_key}} );

    # Delete the highest_key from the queue
    # if highest_key has no more elements
    if ( !scalar @{ $queue->{$highest_key} } ) {
        delete( $queue->{$highest_key} );
    }

    return $element;
}

1;
