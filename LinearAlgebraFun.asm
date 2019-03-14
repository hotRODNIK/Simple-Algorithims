# Program Name: LinearAlgebraFun.asm (I'm sorry but I really like Linear Algebra)
# Programmer Name: Nick Eekhof
# Program Description: This program sums and multiplies two, 2D arrays
# using row and column access sub-routines 
# note the for the column access sum routine, the resulting matrix
# is printed out by individual column vectors
# The following code is ~1300 lines - good luck!
.data
arrOne: 
.word 2, 1, 9, 2
.word 7, 9, 10, 10
.word 3, 4, 4, 4
.word 2, 5, 4, 4
arrTwo: 
.word 8, 7, 1, 2
.word 2, 7, 8, 6
.word 7, 5, 6, 8
.word 9, 4, 8, 9
strOne: .asciiz "The sum is \n"
strTwo: .asciiz "The product is \n"
newLine: .asciiz "\n"
space: .asciiz "  "

.text
main:
# Invoke the sumRow procedure
li $t3, 0
la $a0, strOne
li $v0, 4
syscall
jal sumRow

# Invoke the sumCol procedure
li $t3, 0
la $a0, strOne
li $v0, 4
syscall
jal sumCol

# Invoke the multiply procedure
li $t3, 0
li $t4, 0
la $a0, strTwo
li $v0, 4
syscall
jal multiply

# Done
li $v0, 10
syscall

# Multiply Procedure which uses Row-Access and Column-Access
multiply:
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
# reset accessers
li $t3, 0
li $t4, 4
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
# reset accessers
li $t3, 0
li $t4, 8
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
# reset accessers
li $t3, 0
li $t4, 12
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, newLine
syscall
# reset accessers
li $t3, 16
li $t4, 0
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
# reset accessers
li $t3, 16
li $t4, 4
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
# reset accessers
li $t3, 16
li $t4, 8
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
# reset accessers
li $t3, 16
li $t4, 12
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, newLine
syscall
# reset accessers
li $t3, 32
li $t4, 0
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
# reset accessers
li $t3, 32
li $t4, 4
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
# reset accessers
li $t3, 32
li $t4, 8
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
# reset accessers
li $t3, 32
li $t4, 12
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, newLine
syscall
# reset acessers
li $t3, 48
li $t4, 0
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
# reset accessers
li $t3, 48
li $t4, 4
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
# reset accessers
li $t3, 48
li $t4, 8
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
li $t3, 48
li $t4, 12
# start storing values to multiply
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t4)
# multiply
mul $t5, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t6, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t7, $t0, $t1
# increment accessers
addi $t3, $t3, 4
addi $t4, $t4, 16
# load next terms
lw $t0, arrOne($t3)
lw $t1, arrTwo($t4)
# multiply
mul $t8, $t0, $t1
# calculate term by summing products
add $t9, $t5, $t6
add $t9, $t9, $t7
add $t9, $t9, $t8
# print out term
li $v0, 1
move $a0, $t9
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, newLine
syscall
# Jump back to the main method
jr $ra

# Sum Procedure with Row-Access
sumRow:
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum and new line
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum and new line
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
# Jump back to the main method
jr $ra

# Summation by column-access
sumCol:
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 16
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 16
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 16
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
li $t3, 4
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 16
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 16
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 16
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
li $t3, 8
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 16
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 16
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 16
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
li $t3, 12
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 16
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 16
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 16
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, space
syscall
# start summing values at the base address
lw $t0, arrOne($t3) 
lw $t1, arrTwo($t3)
# increment accesser (for lack of a better word (it's late at night (and these are brackets within brackets within brackets)))
# that previous comment was really dumb (comment about a comment)
addi $t3, $t3, 16
# do the math
add $t2, $t0, $t1
# print out sum
li $v0, 1
move $a0, $t2
syscall
li $v0, 4
la $a0, newLine
syscall
# Go back to the main method
jr $ra