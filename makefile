
lab6.zip: count evaluate lab6 README makefile
	zip lab6.zip *.c *.s README makefile

%.o : %.c 
	gcc -ansi -pedantic -g -c $< -o $@ 

lab6: lab6main.o search.s evaluate.s count.s 
	gcc -g -m64 -o lab6 lab6main.o print.o count.s evaluate.s search.s
 			
count: countmain.o count.s
	gcc -g -m64 -o count countmain.o print.o count.s

evaluate: evalmain.o count.s evaluate.s
	gcc -g -m64 -o evaluate evalmain.o print.o count.s evaluate.s


