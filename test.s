	.file	"test.c"
	.section	.rodata
.LC0:
	.string	"Go Go Bucks "
	.align 8
.LC1:
	.string	"The string is %s, and the two characters are %c and %c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$71, %ecx
	movl	$66, %edx
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-39)"
	.section	.note.GNU-stack,"",@progbits
