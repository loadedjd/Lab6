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


	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	pushq %rbx
	pushq %rbx         # Save callee saved registers, extra push is to maitain 16byte align


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
		cmovlq %rax, %rbx   # If the running max is less than the one returned from evaluate, then store it
		cmovlq (%r13), %r9    # Same as above comment, lets just update the max string pointer as well

		addq $8,      %r13 # Get address of next string

		cmpq $0,      (%r13)

		jz done
		jmp loop

	
	done:
		

		movq $LC0, %rdi
		movq %r9,  %rsi
		movq %r14, %rdx
		movq %r15, %rcx
		movq %rbx, %r8    # Setup for print

		pushq %r9
		pushq %r9          # Save r9 since its a caller saved register and we are using it

		call print
		
		popq %r9
		popq %r9
		popq %rbx
		popq %rbx
		popq %r15
		popq %r14
		popq %r13
		popq %r12          # Return registers to original states, since they are callee saved

		movq %r9, %rax
		leave
		ret
