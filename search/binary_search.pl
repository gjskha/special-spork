#!/usr/bin/env perl
use strict;
use warnings;
use Test::Simple tests => 2;

sub recursive_binary_search {
    my ($a, $lo, $hi, $target) = @_;
    if ($lo > $hi) {
        return -1;
    }
    my $mid = ($lo + $hi) / 2;
    if ($target = @{$a}[$mid]) {
        return $mid;
    } elsif ($target > @{$a}[$mid]) {
        return recursive_binary_search($a, $mid + 1, $hi, $target);
    } else {
        return recursive_binary_search($a, $lo, $mid -1, $target);
    }
}

sub iterative_binary_search {
    my ($a, $target) = @_;
    my $lo = 0;
    my $hi = $#$a;
    my $mid;
    while ($lo <= $hi) {
        $mid = ($lo + $hi) / 2;
	if ($target == @{$a}[$mid]) {
            return int($mid); 
	} elsif ($target > @{$a}[$mid]) {
           $lo = $mid + 1;
	} else {
           $hi = $mid - 1;
	}
    }
    return -1;
}

# Sorted array for O(log N) binary search
my @a = (0, 1, 4, 5, 11, 44, 100, 222, 223);

ok(100 eq $a[iterative_binary_search(\@a, 100)]);
ok(11 eq $a[recursive_binary_search(\@a, 0, $#a, 11)]);
