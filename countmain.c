#include <stdio.h>

int count( char *str, char lower, char upper);

int main()
{
	int G = count("Go Go, Bucks!!", 'B', 'G');
	printf("countmain: %d found.\n", G);
}

