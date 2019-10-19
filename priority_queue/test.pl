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

    print Dumper($PQ);
    # Test empty queue
    # expected: 0
    print "IS_EMPTY: ".$PQ->is_empty()."\n";

    my $args = {
        priority => 1,
        element => 'element one',
    };
    $PQ->insert_with_priority( $args );

    $args = {
        priority => 100,
        element => 'element one zero zero',
    };
    $PQ->insert_with_priority( $args );

    $args = {
        priority => 100,
        element => 'element 100 2nd',
    };
    $PQ->insert_with_priority( $args );

    # No arguments won't be inserted
    $PQ->insert_with_priority();

    print Dumper($PQ);

    # Test empty queue
    # expected: 1
    print "IS_EMPTY: ".$PQ->is_empty()."\n";

    my $element = $PQ->pull_highest_priority_element();
    print "HIGHEST_PRIORITY_ELEMENT: $element\n";

    print Dumper($PQ);
}

1;
