# Author: Jani H.
# Created 03.03.2023

# This assembly language example file demonstrates how you can call the printf function
# from the C standard library and do some basic floating point arithmetic.

# NOTE!: 
# WHEN YOU ARE COMPARING THE TIMES OF DIFFERENT ARITHMETIC INSTRUCTIONS (DIVSD, MULSD etc.),
# COMMENT THE PRINTING FUNCTIONALITY BECAUSE IT GIVES UNACCURATE TIMES

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

	# ------ Calculate a new value for x ------
	# Move the dividend N to xmm0
	movsd	N, %xmm0
	# Divide xmm0 with x
	divsd	x, %xmm0
	# Add x to xmm0
	addsd	x, %xmm0
	# Multiply xmm0 with p
	mulsd	p, %xmm0
	# Move the result back to x
	movsd	%xmm0, x

	# ----- print the value of x ----- 
	# First argument is given to rdi which is the printf's format
	movq	$printf_float_format, %rdi
	# Give the new value of x to printf as a floating point vararg
	movsd	x, %xmm0
	# Set rax to 1 because we give printf one floating point vararg
	movq	$1, %rax
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

printf_float_format:
	.string "%12.6f\n"
printf_string_format:
	.string "%s"

message:
	.string "x: "

N:
	.double 69.0
x:
	.double 4.20
p:
	.double 13.37
i:
	.quad 10
