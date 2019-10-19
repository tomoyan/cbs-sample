#! /usr/local/bin/perl

# Missing Integer
# Find the smallest positive integer that does not occur in a given sequence.

# Given an array A of N integers,
# returns the smallest positive integer (greater than 0)
# that does not occur in A.

# For example,
# Given A = [1, 3, 6, 4, 1, 2], the function should return 5.
# Given A = [1, 2, 3], the function should return 4.
# Given A = [−1, −3], the function should return 1.

# Run this script
# perl missing_integer.pl

use strict;
use warnings;
use Data::Dumper;
use List::Util qw( min max );

# Test cases
my $arg = [1, 3, 6, 4, 1, 2];
print @$arg;
print "-> SOLUTION: ".solution( @$arg )."\n";

$arg = [1, 2, 3];
print @$arg;
print "-> SOLUTION: ".solution( @$arg )."\n";

$arg = [-1, -3];
print @$arg;
print "-> SOLUTION: ".solution( @$arg )."\n";

$arg = [2, 3, -7, 6, 8, 1, -10, 15];
print @$arg;
print "-> SOLUTION: ".solution( @$arg )."\n";

$arg = [2, 3, 7, 6, 8, -1, -10, 15];
print @$arg;
print "-> SOLUTION: ".solution( @$arg )."\n";

sub solution {
    my (@A) = @_;

    my $max = max @A;

    # Return 1 if all elements are negative
    if ( $max < 0 ) {
        return 1;
    }

    # Convert array into hash
    my %hash = map { $_ => 1 } @A;

    # Loop through positive numbers
    # And find smallest number
    my $result = 0;
    my @array = (1..$max);
    foreach my $i (@array) {
        if ( $hash{$i} ) {
            next;
        }
        else {
            $result = $i;
            last;
        }
    }

    if ( $result == 0 ) {
        return $max + 1;
    }
    elsif ( $result > 0 ) {
        return $result;
    }
}

1;
