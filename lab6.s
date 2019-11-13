# Jared Williams (.5903)
# BY SUBMITTING THIS FILE AS PART OF MY LAB ASSIGNMENT, I CERTIFY THAT
# ALL OF THE CODE FOUND WITHIN THIS FILE WAS CREATED BY ME WITH NO
# ASSISTANCE FROM ANY PERSON OTHER THAN THE INSTRUCTOR OF THIS COURSE # OR ONE OF OUR UNDERGRADUATE GRADERS.


.file "lab6.s"
.section .rodata

.data

	LC0:
		.string "FIRST STRING IN THE LIST"
	LC1:
		.string "That's all folks"
	LC2:
		.string "Let's be careful out there."
	LC3:
		.string "Well, to tell you the truth, in all this excitement I kind of lost track myself."
	
	LC4:
		.string "And gentlemen in England now a-bed shall think themselves accursed they were not here!"

	LC5:
		.string "Use The Force, Luke!"

	LC6:
		.string "C is call by value."
	
	LC7:
		.string "O-H!"

	LC8:
		.string "I-O!"

	LC9:
		.string "Go Bucks!"

	LC10: 
		.string "I don't know about you but I just found /**/ inside a comment" # Modified this string a little, was messing with vim's formatting

	LC11:
		.string "Three to beam up."

	LC12: 
		.string "4 I In thIs strIng."

	LC13:
		.string "last string in the list."
	LC14:
		.quad 0x0	

.globl main
	.type main,@function

.text
main:

	
	
	pushq %rbp
	movq  %rsp,  %rbp  # Setup stack frame

	
		pushq $LC0
		pushq $LC1
		pushq $LC2
		pushq $LC3
		pushq $LC4
		pushq $LC5
		pushq $LC6
		pushq $LC7
		pushq $LC8
		pushq $LC9
		pushq $LC10
		pushq $LC11
		pushq $LC12
		pushq $LC13
		pushq $LC14
		pushq $LC14  # Maintain 16byte align

		movq %rsp,  %rdi  # Move address of string table into first param
		movq $0x41, %rsi  # Move char 'A' into second param
		movq $0x5a, %rdx  # Move char 'Z' into third param

		popq %r12
		popq %r12
		popq %r12
		popq %r12
		popq %r12
		popq %r12
		popq %r12
		popq %r12
		popq %r12
		popq %r12
		popq %r12
		popq %r12
		popq %r12
		popq %r12
		popq %r12
		popq %r12
		
	leave
	ret


