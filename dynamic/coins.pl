#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
my $DEBUG = 1;

print "=" x 79 . "\n";
print <<EOF;
Coin change problem using Dynamic Programming: 

Find the minimum number of coins needed to sum up to a given amount.  Dynamic
programming builds the optimal solution from the bottom up by finding optimal
sub-solutions. So for 15 cents that means optimizing the solution for 10 cents
and 5 cents, and so on.

EOF
print "=" x 79 . "\n";


sub coin_change {
    my ($d, $amount) = @_;
    my @denom = @{$d};
    $DEBUG && print "Finding coins for $amount cents using these denominations: " . join(",", @denom) . ".\n";
    # @DP_res has the minimum coins needed for a given amount (sub-solutions of $amount)
    my @DP_res;
    $DP_res[0] = 0;
    foreach my $j (1 .. $amount) {
        my $min = "inf"; # this could be set to $amount + 1, same principle.
        foreach my $i (1 .. $#denom) {
	    $DEBUG && print "$denom[$i] coin -> $j cents -> min $min\n";
            if ($j >= $denom[$i]) {
                if ($min > 1 + $DP_res[$j-$denom[$i]]) { 
			$DEBUG && print "but 1 $denom[$i]c coin plus " . $DP_res[$j - $denom[$i]] . " coins is LESS than " . $min . " coins. Swapping.\n";
			$min = 1 + $DP_res[$j-$denom[$i]];
		} else { 
		    $DEBUG && print "\n";
	        } 
	    } else {
		$DEBUG && print "Skipping $denom[$i] for $j cents\n";    
            }
	    
	}
        $DP_res[$j] = $min;
	$DEBUG && print "setting $j cents to $min coins\n";
    }

    if ($DP_res[$amount] != "inf") {
        return $DP_res[$amount];
    } else {
        return -1;
    }  
}

my @denom = (0,1,5,10,25);
1 eq coin_change(\@denom,1) && print "1c takes 1 coin\n";
print "=" x 79 . "\n";
3 eq coin_change(\@denom,3) && print "3c takes 3 coins\n";
print "=" x 79 . "\n";
1 eq coin_change(\@denom,5) && print "5c takes 1 coin\n";
print "=" x 79 . "\n";
7 eq coin_change(\@denom,7) && print "7c takes 3 coins\n";
