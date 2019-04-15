# Programmer Name: Nick Eekhof 
# Program Name: MergeTwoArrays.asm
# Program Description: This program will take two sorted arrays, merge them into
# a single large array, then sort the larger array. 
.data
arrOne: .space 24
arrTwo: .space 24
mergedArr: .space 48
space: .asciiz " " 

.macro done 
# macro which when called ends execution
li $v0, 10
syscall
.end_macro

.text
main:
jal loadArrOne
jal loadArrTwo
jal mergeArr
jal sort
jal print
done

loadArrOne:
# Load data into registers to be stored
li $t0, 0
addi $s0, $zero, 1
addi $s1, $zero, 22 
addi $s2, $zero, 33
addi $s3, $zero, 41
addi $s4, $zero, 49
addi $s5, $zero, 75
# Start storing data
sw $s0, arrOne($t0)
addi $t0, $t0, 4
sw $s1, arrOne($t0)
addi $t0, $t0, 4
sw $s2, arrOne($t0)
addi $t0, $t0, 4
sw $s3, arrOne($t0)
addi $t0, $t0, 4
sw $s4, arrOne($t0)
addi $t0, $t0, 4
sw $s5, arrOne($t0)
jr $ra # return when done

loadArrTwo:
# Load data into registers to be stored
li $t0, 0
addi $s0, $zero, 11
addi $s1, $zero, 24 
addi $s2, $zero, 43
addi $s3, $zero, 88 
addi $s4, $zero, 1654
addi $s5, $zero, 323434
# Start loading values into the array
sw $s0, arrTwo($t0)
addi $t0, $t0, 4
sw $s1, arrTwo($t0)
addi $t0, $t0, 4
sw $s2, arrTwo($t0)
addi $t0, $t0, 4
sw $s3, arrTwo($t0)
addi $t0, $t0, 4
sw $s4, arrTwo($t0)
addi $t0, $t0, 4
sw $s5, arrTwo($t0)
jr $ra # return when done

mergeArr:
# Array pointers
la $t0, arrOne
la $t1, arrTwo
la $t2, mergedArr
# load registers with data from arrOne
lw $s0, 0($t0)
lw $s1, 4($t0)
lw $s2, 8($t0)
lw $s3, 12($t0)
lw $s4, 16($t0)
lw $s5, 20($t0)
# load first half of mergedArr
sw $s0, 0($t2)
sw $s1, 4($t2)
sw $s2, 8($t2)
sw $s3, 12($t2)
sw $s4, 16($t2)
sw $s5, 20($t2)
# load registers with data from arrTwo
lw $s0, 0($t1)
lw $s1, 4($t1)
lw $s2, 8($t1)
lw $s3, 12($t1)
lw $s4, 16($t1)
lw $s5, 20($t1)
# load second half of mergedArr
sw $s0, 24($t2)
sw $s1, 28($t2)
sw $s2, 32($t2)
sw $s3, 36($t2)
sw $s4, 40($t2)
sw $s5, 44($t2)
jr $ra # return when done

sort:
li $s0, 0
li $s1, 0
# Setting values
li $t0, 0 # sentinel value
li $t1, 0 # counter
li $t2 0 # accessor
# Some C# I wrote which will sort a merged array, now to implement in MIPS assembly!
# while (sentinel != 11)
# {
#    sentinel = 0;
#    for (int i = 0; i < 11; ++i)
#    {
#        min = merged[i];
#        max = merged[i + 1];
#        ++sentinel;
#        if (min > max)
#        {
#           // if the one term is larger, swap them out
#           merged[i] = max;
#           merged[i + 1] = min;
#           sentinel = 0;
#       }
#    }
# }
loopOne:
beq $t0, 11, end
# reset all values
li $t0, 0 
li $t1, 0
li $t2, 0
b loopTwo
loopTwo:
beq $t1, 11, loopOne
addi $t1, $t1, 1 # increment counter and sentinel
addi $t0, $t0, 1
lw $s0, mergedArr($t2) # min
addi $t2, $t2, 4 # increment accessor
lw $s1, mergedArr($t2) # max
bgt $s0, $s1, swap # if min > max, swap them out if not, reiterate
b loopTwo
swap:
# swap min and max
addi $t2, $t2, -4
sw $s1, mergedArr($t2) 
addi $t2, $t2, 4
sw $s0, mergedArr($t2)
li $t0, 0 # reset sentinel
b loopTwo
end:
jr $ra # return when done

print:
# Set access register
li $t0, 0
# Print out values
li $v0, 1
lw $a0, mergedArr($t0)
syscall
addi $t0, $t0, 4
li $v0, 4
la $a0, space
syscall
li $v0, 1
lw $a0, mergedArr($t0)
syscall
addi $t0, $t0, 4
li $v0, 4
la $a0, space
syscall
li $v0, 1
lw $a0, mergedArr($t0)
syscall
addi $t0, $t0, 4
li $v0, 4
la $a0, space
syscall
li $v0, 1
lw $a0, mergedArr($t0)
syscall
addi $t0, $t0, 4
li $v0, 4
la $a0, space
syscall
li $v0, 1
lw $a0, mergedArr($t0)
syscall
addi $t0, $t0, 4
li $v0, 4
la $a0, space
syscall
li $v0, 1
lw $a0, mergedArr($t0)
syscall
addi $t0, $t0, 4
li $v0, 4
la $a0, space
syscall
li $v0, 1
lw $a0, mergedArr($t0)
syscall
addi $t0, $t0, 4
li $v0, 4
la $a0, space
syscall
li $v0, 1
lw $a0, mergedArr($t0)
syscall
addi $t0, $t0, 4
li $v0, 4
la $a0, space
syscall
li $v0, 1
lw $a0, mergedArr($t0)
syscall
addi $t0, $t0, 4
li $v0, 4
la $a0, space
syscall
li $v0, 1
lw $a0, mergedArr($t0)
syscall
addi $t0, $t0, 4
li $v0, 4
la $a0, space
syscall
li $v0, 1
lw $a0, mergedArr($t0)
syscall
addi $t0, $t0, 4
li $v0, 4
la $a0, space
syscall
li $v0, 1
lw $a0, mergedArr($t0)
syscall
jr $ra # return when done
