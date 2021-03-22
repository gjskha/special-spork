#!/bin/bash

BLACK="\033[1;30m"
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
LIGHT_BLUE="\033[1;34m"
VIOLET="\033[1;35m"
TURQUIOSE="\033[1;36m"
WHITE="\033[1;37m"
NO_COLOUR="\033[0m"

# When a new sort is added, update this line
ALGORITHMS="Bubble Insertion Quit"

# hard-coded for now
declare -a the_array=(8 4 2 1 7 11)
a_count=0

#for elem in "${the_array[@]}"; do
#     echo -n "$elem "
#done

function bubblesort() {

    echo "Bubble Sort"

    # weird hacky stuff to pass array in bash
    name=$1[@]
    the_array=("${!name}")
    n=$2

    # subshell only
    if [ $n -eq 1 ]; then
        echo -n "Round $n, final ordering: "
 
        for elem in "${the_array[@]}" ; do
            echo -n "$elem "
        done
        echo

        return
    fi

    this_iteration=0
    while [ $this_iteration -lt ${#the_array[@]} ]; do
        next_cell_up=$(($this_iteration+1))
        echo -n "Round $n, iteration $this_iteration. Is ${the_array[$this_iteration]} less than ${the_array[$next_cell_up]}?"

        if [[ ${the_array[$this_iteration]} -lt ${the_array[$next_cell_up]} ]]; then
            echo -e "$RED Yes. Switching places $NO_COLOUR "
            tmp=${the_array[$this_iteration]}
            the_array[$this_iteration]=${the_array[$next_cell_up]} 
            the_array[$next_cell_up]=$tmp 

        else
       
          echo " No, keeping them in place."

      fi
  
        this_iteration=$(( $this_iteration + 1))
    done 

    echo -n "Result: "
    for elem in "${the_array[@]}" ; do
        echo -n "$elem "
    done
    echo

    n=$(( $n - 1 ))
    bubblesort the_array $n
}

function insertionsort() {

    echo "Insertion Sort"

    # weird hacky stuff to pass array in bash
    name=$1[@]
    the_array=("${!name}")
    array_length=$2
    
    this_iteration=1; 
    next_cell_down=0; 
    #this_iterations_value=0;

    while [ $this_iteration -lt $array_length ]; do
    
        this_iterations_value=${the_array[$this_iteration]};
	next_cell_down=$(($this_iteration - 1));

        echo "Iteration $this_iteration of $array_length. Value of $this_iterations_value"

	# move elements of array less than this_iteration that are greater than this_iterations_value 
	# one position ahead of their current position
        # convert to if/else for clarity
	while [ $next_cell_down -ge 0 ] && [ ${the_array[$next_cell_down]} -lt $this_iterations_value ] ; do
	#while [ $next_cell_down -ge 0 ] && [ ${the_array[$next_cell_down]} -lt ${the_array[$this_iteration]} ] ; do
      
            echo -e "at outer iteration $this_iteration and inner iteration $next_cell_down : $RED $this_iterations_value is greater than ${the_array[$next_cell_down]} $NO_COLOUR "

            k=$(($next_cell_down + 1))
	    tmp=${the_array[$k]}
	    
	    the_array[$k]=${the_array[$next_cell_down]}
	    the_array[$next_cell_down]=$tmp

	    next_cell_down=$(($next_cell_down - 1))  
	done

        this_iteration=$(( $this_iteration + 1 ))	
    done

    echo -n "After sorting the array:"
    for elem in "${the_array[@]}" ; do
        echo -n "$elem "
    done
    echo 

}

#declare -a the_array=(10 9 8 7 6 5 4 3 2 1 11)
#insertionsort the_array 11

function accept_nums() {

    echo "Enter a number to sort, or Q for quit:"

    while [[ true ]]; do
        read REPLY
        if [[ $REPLY ==	[Qq] ]]; then
            break
        else
            # grab input
            a_count=$(( a_count + 1 ))
        fi
    done

}

function main_loop() {

    echo "A program for illustrating sort algorithms."

    accept_nums

    echo "Select an algorithm:"

    until [[ "$choice" == [Qq] ]]; do
        select choice in $ALGORITHMS; do
            case $choice in
                Bubble)
                    # temporarily hard coded
                    bubblesort the_array 6
                ;;
                Insertion)
                    insertionsort the_array 6
                ;;
                *)
                    : 
                ;;
            esac
            break
        done
    done
}

main_loop
