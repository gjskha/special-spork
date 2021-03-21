/* Algorithm for deleting specified characters from a string. */
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

void remove_chars(char *str, char *remove) {

	/* create an array of false for the range of ascii characters */
	bool flags[128] = {false};
	int src,dst = 0;

	/* set the elements corresponding to chars in remove to true */
	for(src = 0; src < strlen(remove); ++src) {
		flags[remove[src]] = true;
	}

	/* skip anything set to true in flags */
	for (src = 0; src < strlen(str); ++src) {
		if (!flags[str[src]]) {
			str[dst++] = str[src];
		}
	}

	str[dst] = '\0';

	printf("%s\n",str);
	
}

int main() {

	char str[] = "foobar";
	char *remove = "ob";
	remove_chars(str, remove);

	return 0;
}
