# Adapted from https://hop.perl.plover.com/book/pdf/01RecursionAndCallbacks.pdf

#This procedure will work for any number. To compute the binary expansion of a number
#n we proceed as follows:
#1.    If n is 1, its binary expansion is 1, and we may ignore the rest of the procedure.
#Similarly, if n is 0, the expansion is simply 0. Otherwise:
#2.    Compute k and b so that n = 2k + b and b = 0 or 1. To do this, simply divide n by 2;
#k is the quotient, and b is the remainder, 0 if n
#was even, and 1 if n was odd.
#3.    Compute  the  binary  expansion  of k ,  using  this  same  method.  Call the result E.
#4.   The binary expansion for n is Eb.

function binary() {
    n=$1
    if [[ $n -eq 0 || $n -eq 1 ]]; then
        answer=`echo -n $n; echo -n $answer`
        return
      
    fi
    k=$(( $n / 2 ))
    b=$(( $n % 2 ))
    answer=`echo -n $b; echo -n $answer`
    binary $k 
}

unset answer
binary 25; echo $answer
unset answer
binary 4; echo $answer 
unset answer
binary 7; echo $answer 
unset answer
binary 1; echo $answer 
unset answer
binary 3; echo $answer 
