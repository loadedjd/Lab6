# Jared Williams (.5903)
# BY SUBMITTING THIS FILE AS PART OF MY LAB ASSIGNMENT, I CERTIFY THAT
# ALL OF THE CODE FOUND WITHIN THIS FILE WAS CREATED BY ME WITH NO
# ASSISTANCE FROM ANY PERSON OTHER THAN THE INSTRUCTOR OF THIS COURSE # OR ONE OF OUR UNDERGRADUATE GRADERS.


.file "count.s"
.section .rodata

.data
		 
.globl count
	.type count,@function

.text
count:

	
	
	pushq %rbp
	movq  %rsp,  %rbp  # Setup stack frame
	
	movq $0,     %rcx  # Clear rcx	

	movq %rdi,   %r8   # Hold on to the address of the first character
	movq $0,     %r9   # This will hold the current character
	
	loop:

		
		movb (%r8), %r9b # Put the first character in the lower byte of r9

		incq %r8         # Make r8 hold the address of the second char


		cmpq $0,    %r9b
		jz done          #Check for null terminating string ... I think

		cmpb %sil,  %r9b # Compare the second function param to the current character
		
		jl   loop        # If the current character is less than the second param its outside of the the range
		
		cmpb %dl,  %r9b  # Compare the first character to the 3rd function param  
		jg   loop        # If the first character is greater than the 3rd function param its outside of the range
		
		incq %rax        # Increment our count if the char is the range


	done:
		leave
		ret
