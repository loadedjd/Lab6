	.file	"lab6main.c"
	.globl	strings
	.section	.rodata
.LC0:
	.string	"FIRST STRING IN THE LIST."
.LC1:
	.string	"That's all folks!"
.LC2:
	.string	"Let's be careful out there."
	.align 8
.LC3:
	.string	"Well, to tell you the truth, in all this excitement I kind of lost track myself."
	.align 8
.LC4:
	.string	"And gentlemen in England now a-bed shall think themselves accursed they were not here!"
.LC5:
	.string	"Use The Force, Luke!"
.LC6:
	.string	"C is call by value."
.LC7:
	.string	"O-H!"
.LC8:
	.string	"I-O!"
.LC9:
	.string	"Go Bucks!"
.LC10:
	.string	""
	.align 8
.LC11:
	.string	"I don't know about you but I just found /* inside a comment."
.LC12:
	.string	"Three to beam up."
.LC13:
	.string	"4 I In thIs strIng."
.LC14:
	.string	"last string in the list."
	.data
	.align 32
	.type	strings, @object
	.size	strings, 128
strings:
	.quad	.LC0
	.quad	.LC1
	.quad	.LC2
	.quad	.LC3
	.quad	.LC4
	.quad	.LC5
	.quad	.LC6
	.quad	.LC7
	.quad	.LC8
	.quad	.LC9
	.quad	.LC10
	.quad	.LC11
	.quad	.LC12
	.quad	.LC13
	.quad	.LC14
	.quad	0
	.globl	strings2
	.section	.rodata
.LC15:
	.string	"HI"
	.data
	.align 8
	.type	strings2, @object
	.size	strings2, 8
strings2:
	.quad	.LC15
	.section	.rodata
	.align 8
.LC16:
	.string	"Lab6: '%s' has the most between '%c' and '%c'\n\n"
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
	subq	$16, %rsp
	movb	$65, -1(%rbp)
	movb	$90, -2(%rbp)
	movsbl	-2(%rbp), %edx
	movsbl	-1(%rbp), %eax
	movl	%eax, %esi
	movl	$strings2, %edi
	call	search
	movq	%rax, -16(%rbp)
	movsbl	-2(%rbp), %ecx
	movsbl	-1(%rbp), %edx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC16, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-39)"
	.section	.note.GNU-stack,"",@progbits
