# Programmer: Evan Soloway
# Date: 05/14/2020
# This program searches an array in memory and finds a value specified
# by the user in the array via linear search and binary search.

main:

li $a3, 80 # flag indicating initialization of 20-element array has completed; used for comparison
li $a1, 0 # 1st element in array at index 0
li $a2, 0 # index 0
jal initializingArray

li $v0, 4
la $a0, firstPrompt
syscall

li $v0, 5 # receive integer value from user for query
syscall

move $t9, $v0 # moves user value to $t9

### Pre-reqs for search
li $a3, 20 # flag indicating max number of comparisons have occurred and that number is not in array
li $t0, 0 # initializing index to zero for comparison count
li $a2, 0 # initializing index to zero for array
jal linear # call linear

### Pre-reqs for search
la $t1, ($t9)
li $t0, 0 # re-initializing index to zero for comparison count
li $t4, 10 # initializing in $t5 1st comparison value (length of array/2)
li $t6, 2 # for division
li $t7, 4 # for multiplication
li $t8, 0 # min value
li $t9, 20 # max value
jal binary

j terminate # terminate program

### Functions outside main ###

initializingArray:

sw $a1, array($a2)

beq $a3, $a2, returnToMain

addi $a1, $a1, 1 # increment value stored in index [x] by 1
addi $a2, $a2, 4 # increment index by 4

j initializingArray

linear: # linear search

addi $t0, $t0, 1 # increments number of comparisons 
lw $t2, array($a2)

beq $t2, $t9, linearFound
beq $t0, $a3, notFound

addi $a2, $a2, 4 # increments index of array comparison

j linear

binary: # binary search

addi $t0, $t0, 1 # increments number of comparisons 
mult $t4, $t7
mflo $t5 # index of comparison

lw $t2, array($t5) # load array value at current index into $t2

# comparisons
beq $t1, $t2, binaryFound
beq $t0, $a3, notFound

bgt $t1, $t2, greaterThan
blt $t1, $t2, lessThan

greaterThan:

la $t8, ($t4)
add $t4, $t4, $t9
div $t4, $t4, $t6

j binary

lessThan:

la $t9, ($t4)
add $t4, $t4, $t8
div $t4, $t4, $t6

j binary

terminate:

li $v0, 10
syscall

returnToMain:

jr $ra

linearFound:

li $t4, 4 # for division
div $t1, $a2, 4

li $v0, 4
la $a0, foundLinear
syscall

li $v0, 1
la $a0, ($t1)
syscall

li $v0, 4
la $a0, after
syscall

li $v0, 1
la $a0, ($t0)
syscall

li $v0, 4
la $a0, comparisons
syscall

li $v0, 4
la $a0, newLine
syscall

j returnToMain

binaryFound:

li $v0, 4
la $a0, foundBinary
syscall

li $v0, 1
la $a0, ($t4)
syscall

li $v0, 4
la $a0, after
syscall

li $v0, 1
la $a0, ($t0)
syscall

li $v0, 4
la $a0, comparisons
syscall

li $v0, 4
la $a0, newLine
syscall

j returnToMain

notFound:

li $v0, 4
la $a0, foundNot
syscall

li $v0, 4
la $a0, newLine
syscall

j returnToMain

.data

# strings
newLine: .asciiz "\n"
firstPrompt: .asciiz "Enter a number from 0 to 20: "
foundLinear: .asciiz "Number was found via linear search at index "
foundBinary: .asciiz "Number was found via binary search at index "
foundNot: .asciiz "Number was not found."
after: .asciiz " after "
comparisons: .asciiz " comparison(s)."

# arrays in memory
array: .space  20