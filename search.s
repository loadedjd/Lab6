# Jared Williams (.5903)
# BY SUBMITTING THIS FILE AS PART OF MY LAB ASSIGNMENT, I CERTIFY THAT
# ALL OF THE CODE FOUND WITHIN THIS FILE WAS CREATED BY ME WITH NO
# ASSISTANCE FROM ANY PERSON OTHER THAN THE INSTRUCTOR OF THIS COURSE # OR ONE OF OUR UNDERGRADUATE GRADERS.


.file "search.s"
.section .rodata

.data

	LC0:
		.string "search: %s has the most characters between %c and %c, with %d found\n"
		 

	LCTest:
		.string "ECHO: %s \n"	

.globl search
	.type search,@function

.text
search:

	
	
	pushq %rbp
	movq  %rsp,  %rbp  # Setup stack frame
	
	movq $0,     %rax	
	movq %rdi,   %r12    # Current String Pointer register
	movq $0,     %r13    # Current max count register
	movq (%r12), %r14    # Current max String pointer register
	movq %rsi,   %r15    # Save first char param
	movq %rdx,   %rbx    # Save the second char param

	#Lets try and read all of the strings
	tableLoop:
		movq (%r12),    %rdi  # Put the current string pointer as the first param to evaluate
		movq %r15,    %rsi  # Put first char back
		movq %rbx,    %rdx  # Put second char back
	
		
		call evaluate

		cmp   %rax, %r13      # Compare the output of evaluate to the running max
		cmovlq %rax, %r13      # If the value returned by evaluate is greater than the running max we need to update
		cmovlq (%r12), %r14      # Same as above comment but we are updating the max string pointer


		addq 8(%r12), %r12  # Add 8 to get to the address of the next string
		cmpq $0x0,    %r12

		jz done
		jmp tableLoop
	

	done:


		movq $LC0,   %rdi
		movq %r14,   %rsi
		movq %r15,   %rdx
		movq %rbx,   %rcx
		movq %r13,   %r8   # Setup for print

		call print


		movq %r14, %rax     # Return max string pointer
		ret
		leave
