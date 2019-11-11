# Jared Williams (.5903)
# BY SUBMITTING THIS FILE AS PART OF MY LAB ASSIGNMENT, I CERTIFY THAT
# ALL OF THE CODE FOUND WITHIN THIS FILE WAS CREATED BY ME WITH NO
# ASSISTANCE FROM ANY PERSON OTHER THAN THE INSTRUCTOR OF THIS COURSE # OR ONE OF OUR UNDERGRADUATE GRADERS.


.file "search.s"
.section .rodata

.data

	LC0:
		.string "search: %s has the most characters between %c and %c, with %d found\n"
		 
.globl search
	.type search,@function

.text
search:

	
	
	pushq %rbp
	movq  %rsp,  %rbp  # Setup stack frame
	
	movq (%rdi), %r12  # Save the starting address of the string table
	movq %rsi,   %r13  # Save the first char param
	movq %rdx,   %r14  # Save the second char param
	movq $0,     %r15  # Save the max count
	movq %r12,   %rbx  # Save the pointer to the max string


	loop:
		
		movq %r12,  %rdi  # Move string pointer to first param of evaluate
		cmpq %r15,  %rax  # Compare the running max count to what was returned by evaluate
		
		call evaluate

		cmovg %rax, %r15  # If the result from evaluate is greater than the running max, than the running max will be equal to the result from evaluate	
		cmovg %r12, %rbx  # If we have found a new max string, update the max pointer register
		
		addq $8,    %r12  # r12 holds the address of the current string, by adding 8 bytes we shluld get the next string pointer

		jz done           # If the add results in a zero, we have reached the null terminating string
		
		jmp loop
		

	done:

		
		
		movq $LC0, %rdi
		movq %rbx, %rsi
		movq %r13, %rdx
		movq %r14, %rcx
		movq %r15, %r8  # Setup for print
	
		call print
		
		movq %rbx, %rax  # Return pointer to string


		leave
		ret
