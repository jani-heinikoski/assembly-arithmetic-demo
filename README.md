
# FoCS W11 Task 4 Examples

This code repository contains helpful Assembly language examples for the 2023 FoCS - week 11 task 4. 

fp_arithmetic.s contains floating point arithmetic examples and how to use printf when passing variadic floating point parameters.

int_arithmetic.s shows how similar calculations can be done with signed integers. Implementing addition, subtraction and multiplication with signed integers have been left for the students to figure out but because signed integer division requires a bit too much knowledge about x86-64 assembly, it has been implemented.

You can use both of them as a template for the task 4. When measuring times with floating point values, use fp_arithmetic.s and when measuring with signed integers, use int_arithmetic.s.

You can use the latter printing functionality to print out floating point values in fp_arithmetic.s and integer values in int_arithmetic.s. You can use them to make sure that your calculations work properly but comment the printing functionalities out when measuring execution times as they can be intermittent and give unaccurate measurements.

You may find the following links useful

x86 instructions: https://www.felixcloutier.com/x86/

System V ABI documentation: https://gitlab.com/x86-psABIs/x86-64-ABI


## Run the programs

Clone the files to any directory

Go to the directory

```bash
  cd directory
```

Compile with gcc

```bash
  gcc int_arithmetic.s -no-pie -o int_arithmetic
  gcc fp_arithmetic.s -no-pie -o fp_arithmetic
```

Execute

```bash
  ./int_arithmetic
  ./fp_arithmetic
```

Measure execution times

```bash
  time ./int_arithmetic
  time ./fp_arithmetic
```
