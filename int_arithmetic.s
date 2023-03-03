# Author: Jani H.
# Created 03.03.2023

# This assembly language example file demonstrates how you can call the printf function
# from the C standard library and do some basic signed integer arithmetic.

# NOTE!: 
# WHEN YOU ARE COMPARING THE TIMES OF DIFFERENT ARITHMETIC INSTRUCTIONS (DIVQ, MULQ etc.),
# COMMENT THE PRINTING FUNCTIONALITY BECAUSE IT GIVES UNACCURATE TIMES

# Registers %rbp, %rbx and %r12 through %r15
# “belong” to the calling function, and the called function is
# required to preserve their values ==> we can use rcx freely for our calculations
# because we don't have to preserve its value.

# Instructions you need for signed integers are addq, subq, imulq and idivq.
# idivq has been given to you because it differs from the others significantly (register extending).

.text
	.global main
main:
	# Save the previous stack frame's address to the stack
	pushq	%rbp
	# Put the current stack frame's address to rbp
	movq	%rsp, %rbp

loop:
	# ----- print x: ----- 
	# First argument is given to rdi which is the printf's format
	movq	$printf_string_format, %rdi
	# Second argument is given to rsi which is the printf's message
	movq	$message, %rsi
	# Set rax to 0 because we don't give printf any floating point varargs
	movq	$0, %rax
	# Call the printf function
	call 	printf

	# IMPLEMENT THE CALCULATIONS HERE, YOU CAN USE THE PRINTING TO CHECK IF IT IS DONE CORRECTLY

	# Signed integer division
	# idivq divides %rdx:%rax with r64/m64. Quotient --> rax, remainder --> rdx
	# Zero out the register rdx so that signed division works properly
	xor     %rdx, %rdx
	movq    N, %rax
	idivq	x
	# Save the quotient to x
	movq    %rax, x


	# ----- print the value of x ----- 
	# First argument is given to rdi which is the printf's format
	movq	$printf_int_format, %rdi
	# Give the new value of x to printf as the second parameter
	movq	x, %rsi
	# Set rax to 0 because we give printf zero floating point varargs
	movq	$0, %rax
	# Call the printf function
	call 	printf

	# Jump back too loop label if i != 0
	movq	i, %rax
	subq	$1, %rax
	movq	%rax, i
	cmpq 	$0, i
	jnz 	loop

	# Restore the previously saved stack frame and return zero (OK) 
	leave
	ret	$0

# Data section for defining labels
.data

printf_int_format:
	.string "%d\n"
printf_string_format:
	.string "%s"

message:
	.string "x: "

N:
	.quad 69
x:
	.quad 2
i:
	.quad 100
