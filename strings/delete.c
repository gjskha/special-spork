#include <stdio.h>
#include <stdbool.h>
#include <string.h>

void remove_chars(char *str, char *remove) {

	/* create an array of false for the range of ascii characters */
	bool flags[128] = {false};

	int i,j = 0;

	/* set the elements corresponding to chars in remove to true */
	for(i = 0; i < strlen(remove); ++i) {
		flags[remove[i]] = true;
	}

	int slen = strlen(str);

	for (i = 0; i < slen; ++i) {
		if (!flags[str[i]]) {
			str[j++] = str[i];
		}
	}

	str[j] = '\0';

	printf("%s\n",str);
	
}

int main() {

	char str[] = "foobar";
	char *remove = "ob";
	remove_chars(str, remove);

	return 0;
}
