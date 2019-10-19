#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use PriorityQueue;

eval {
    main();
};
print $@ if $@;

sub main {
    # Create empty PriorityQueue
    my $PQ = new PriorityQueue({
        queue => {},
    });

    # Test empty queue
    # expected: 0
    print "EMPTY QUEUE: ".Dumper($PQ);
    print "IS_EMPTY: ".$PQ->is_empty()."\n";

    # Insert elements into queue
    my $args = {
        priority => 1,
        element => 'element one',
    };
    $PQ->insert_with_priority( $args );

    $args = {
        priority => 100,
        element => 'element priority 100',
    };
    $PQ->insert_with_priority( $args );

    $args = {
        priority => 100,
        element => 'element priority 100 2nd',
    };
    $PQ->insert_with_priority( $args );

    # Insert without arguments won't be inserted
    $PQ->insert_with_priority();

    # Test empty queue
    # expected: 1
    print "QUEUE: ".Dumper($PQ);
    print "IS_EMPTY: ".$PQ->is_empty()."\n";

    my $element = $PQ->pull_highest_priority_element();
    print "PULL_HIGHEST_PRIORITY_ELEMENT: $element\n";

    print "HIGHEST_PRIORITY_ELEMENT was removed from queue\n";
    print Dumper($PQ);
}

1;
