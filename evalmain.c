
#include <stdio.h>

int evaluate( char *str, char lower, char upper);

main()
{
	int G = evaluate("Go Go Bucks!", 'B', 'G');
	printf("evalmain: %d found.\n", G);

	G = evaluate("JARED", 'A', 'Z');
	printf("evalmain: %d found .\n", G);
}

