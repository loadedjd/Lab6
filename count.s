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
	movq  %rsp, %rbp # Setup stack frame

	
	
	leave
	ret
