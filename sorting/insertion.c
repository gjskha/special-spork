/* Find the median price in an array of prices.
 * Compile with: gcc -Wall -std=c99 -lm
 * */
#include <stdio.h>
#include <math.h>

/* sort the prices with the insert sort algorithm */
void sort_prices(double* prices, int size) {

        double value;
        int j,i;

        for (i = 1; i < size; i++) {

                value = prices[i];

                // compare each element to the ones before it
                // and exchange places accordingly
                j = i - 1;
                while (j >= 0 && prices[j] > value) {
                        prices[j + 1] = prices[j];
                        j--;
                }

                prices[j + 1] = value;
        }
}

int main() {
        
        //double prices[1] = {2};
        //double prices[2] = {6,2};
        //double prices[9] = {1,6,3,5,8,9,4,10,2};
        double prices[10] = {1,6,3,5,8,9,4,10,2,7};

        int size = (sizeof(prices)/sizeof(double));

        sort_prices(prices,size);

        int mid = floor(size / 2.0);

        // if there are an odd number of elements in the price array, then take
        // the midmost element. Otherwise, take the mid two and average them.
        double price = (size % 2) ? prices[mid] : (prices[mid-1] + prices[mid]) / 2;

        printf("price is %.2f\n",price);

        return 0;
}
