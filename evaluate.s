# Jared Williams (.5903)
# BY SUBMITTING THIS FILE AS PART OF MY LAB ASSIGNMENT, I CERTIFY THAT
# ALL OF THE CODE FOUND WITHIN THIS FILE WAS CREATED BY ME WITH NO
# ASSISTANCE FROM ANY PERSON OTHER THAN THE INSTRUCTOR OF THIS COURSE # OR ONE OF OUR UNDERGRADUATE GRADERS.


.file "evaluate.s"
.section .rodata

.data

	formatString:
		.string "evaluate: Evaluating %s looking for letter between %c and %c .\n "
	
	formatString2:
		.string "evaluate: Found %d letters between %c and %c in %s \n"

		 
.globl evaluate
	.type evaluate,@function

.text
evaluate:

	
	
	pushq %rbp
	movq  %rsp,  %rbp  # Setup stack frame



	movq %rdi, %r12    # Save initial string, will have to move back to second arg
	movq %rsi, %r13    # Store our second arg
	movq %rdx, %r14    # Store our third arg
	

	movq $formatString, %rdi  # Put format string as first param to printf
	movq %r12,          %rsi  # Put the initial string as the second param to printf
	movq %r13,          %rdx  # Put first character as third param to printf
	movq %r14,          %rcx  # Put second character as fourth param to printf

	


	call printf
	
	movq %r12, %rdi
	movq %r13, %rsi
	movq %r14, %rdx # Move the initial string and chars back

	call count
	
	movq %rax, %r15 # Save the result of the call to count

	movq $formatString2, %rdi
	movq %rax, %rsi		       # Number of letters found
	movq %r13, %rdx                # First Char
	movq %r14, %rcx                # Second Char
	movq %r12, %r8                 # Initial String

	call printf

	movq %r15, %rax                # Move result of count back into rax

	done:
		leave
		ret
