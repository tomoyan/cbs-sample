#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

# Write a script that takes 2 or more strings as command line parameters
# and print the longest common substring.

# For example, the longest common substring of the strings
# "ABABC", "BABCA" and "ABCBA" is string "ABC" of length 3.
# Other common substrings are "A", "AB", "B", "BA", "BC" and "C".

# Run this script
# perl longest_string.pl myname mynumber myneighbor
# returns -> myn

# perl longest_string.pl this egg camo
# returns -> No Common Substring

# perl longest_string.pl
# returns -> ABC

main();

# Find substings from a string
sub substrings {
    my $args = shift;
    my $string = $args->{string};
    my $longest_length = $args->{longest_length};
    my $length = length( $string );
    my $substrings = [];

    # Find all substrings if $longest_length is 0
    # if substring is shorter than $longest_length,
    # it will be skipped
    foreach my $index ( 1..$length ) {
        foreach my $offset ( 0..$length - $index ) {
            my $temp_sub = substr( $string, $offset, $index );
            if ( length($temp_sub) < $longest_length ) {
                next;
            }
            push @$substrings, substr( $string, $offset, $index );
        }
    }

    return $substrings;
}

# Find common substrings in a list of strings
sub string_matches {
    my $args = shift;
    my $strings = $args->{strings};
    my $substrings = $args->{substrings};
    my $number_of_strings = $args->{number_of_strings};
    my $longest_length = 0;
    my $matches = [];

    # Each substring will go through a list of strings
    # And find longest common substrings
    foreach my $substring ( @$substrings ) {
        my $count = 0;
        foreach my $string ( @$strings ) {
            if ( $string =~ /$substring/ ) {
                $count++;
                if ( $count == $number_of_strings ) {
                    my $length_substring = length( $substring );
                    if ( $length_substring > $longest_length ) {
                        $longest_length = $length_substring;
                        $matches = [];
                    }
                    push @$matches, $substring;
                }
            }
            else {
                last;
            }
        }
    }

    my $result = {
        matches => $matches,
        longest_length => $longest_length,
    };
    return $result;
}

sub main {
    # Check command line input
    # Default 'ABABC', 'ABCBA', 'ABCBA'
    my $strings = \@ARGV;
    if ( !@$strings ) {
        $strings = ['ABABC', 'ABCBA', 'ABCBA'];
    }

    my $number_of_strings = scalar @$strings;
    my $longest_length = 0;
    my $matches = [];

    foreach my $string ( @$strings ) {
        my $args = {
            string => $string,
            longest_length => $longest_length,
        };
        my $substrings = substrings( $args );

        $args = {
            strings => $strings,
            substrings => $substrings,
            number_of_strings => $number_of_strings,
        };
        my $result = string_matches( $args );

        if ( $result->{longest_length} > $longest_length ) {
            $longest_length = $result->{longest_length};
            $matches = $result->{matches};
        }
    }

    if ( @$matches ) {
        print "Longest Common Substring: ";
        foreach my $match ( @$matches ) {
            print "$match\n";
        }
    }
    else {
        print "No Common Substring\n";
    }

}


