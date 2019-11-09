#include <stdio.h>

char *strings[] = {
"FIRST STRING IN THE LIST.",
	"That's all folks!", "Let's be careful out there." , 
"Well, to tell you the truth, in all this excitement I kind of lost track myself.",
"And gentlemen in England now a-bed shall think themselves accursed they were not here!",
"Use The Force, Luke!", "C is call by value.", "O-H!", "I-O!", "Go Bucks!",
"",
"I don't know about you but I just found /* inside a comment.", 
"Three to beam up.",
"4 I In thIs strIng.",
"last string in the list.",
NULL

};

char *search(char *strings[], char lower, char upper);

main()
{
	char *ptr, lower = 'A', upper = 'Z';

	ptr = search(strings, lower, upper);
printf("Lab6: '%s' has the most between '%c' and '%c'\n\n", ptr, lower, upper);

	lower = 'a'; upper = 'z';
	ptr = search(strings, lower, upper);
printf("Lab6: '%s' has the most between '%c' and '%c'\n\n", ptr, lower, upper);

	lower = ' '; upper = '@';
	ptr = search(strings, lower, upper);
printf("Lab6: '%s' has the most between '%c' and '%c'\n\n", ptr, lower, upper);
	

}


