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


	movq %rdi,   %r12  # Save the initial string table
	movq %rsi,   %r14  # Put first char in r14
	movq %rdx,   %r15  # Put the second char in r15
	movq $0,     %rbx  # Hold max counter
	movq %r12,   %r13  # Current string pointer
	movq %r13,   %r9   # Save max string pointer	

	loop:
		
		movq (%r13),    %rdi
		movq %r14,      %rsi
		movq %r15,      %rdx

		pushq %r9
		pushq %r9          # Maintain 16byte align
		
		call evaluate

		popq %r9
		popq %r9           # Maintain 16byte align

		cmpq %rax, %rbx    # Compare the running max to the max returned by evaluate
		cmovl %rax, %rbx   # If the running max is less than the one returned from evaluate, then store it
		cmovl %r13, %r9    # Same as above comment, lets just update the max string pointer as well

		addq $8,      %r13 # Get address of next string

		cmpq $0,      (%r13)

		jz done
		jmp loop

	
	done:
		movq %r9, %rax
		ret
		leave
