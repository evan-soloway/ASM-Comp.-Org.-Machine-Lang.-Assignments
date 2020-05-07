# Programmer: Evan Soloway
# Date: 03/10/2020
# This program averages a set of test scores after dropping the lowest one.
# Each test score will need to be stored in a separate variable.

main:

# Display opening paragraph
li $v0, 4
la $a0, openingParagraph
syscall

# Receiving test1
jal getScore # Calling getScore
move $t1, $t7

# Receiving test2
jal getScore # Calling getScore
move $t2, $t7

# Receiving test3
jal getScore # Calling getScore
move $t3, $t7

# Receiving test4
jal getScore # Calling getScore
move $t4, $t7

# Receiving test4
jal getScore # Calling getScore
move $t5, $t7

jal findLowest # Calling getLowest
jal calcAverage # Calling calcAverage

#### Function listings

calcAverage:

# calculates total scores minus lowest
add $t6, $t1, $t2
add $t6, $t3, $t6
add $t6, $t4, $t6
add $t6, $t5, $t6
sub $t6, $t6, $t0

# Convert to double-precision floating point
mtc1.d $t6, $f10
cvt.d.w $f10, $f10

li $t8, 4
mtc1.d $t8, $f8
cvt.d.w $f8, $f8

# finds average by dividing by 4
div.d $f6, $f10, $f8

# Display average
li $v0, 4
la $a0, average
syscall

li $v0, 3
mov.d $f12, $f6
syscall

li $v0, 10
syscall

findLowest:

move $t0, $t1

# Series of conditional tests to find lowest score
blt $t2, $t0, test2Least
blt $t3, $t0, test3Least
blt $t4, $t0, test4Least
blt $t5, $t0, test5Least

jr $ra # return $t0/lowest score

# Series of conditional statements
test2Least:
move $t0, $t2

test3Least:
move $t0, $t3

test4Least:
move $t0, $t4

test5Least:
move $t0, $t5

jr $ra

getScore:

# Displays prompt
li $v0, 4
la $a0, getScorePrompt
syscall

# Receives score
li $v0, 5
syscall

move $t7, $v0

bgt, $t7, 100, exception
blt, $t7, 0, exception

# returns $t7
jr $ra

exception:

li $v0, 4
la $a0, exceptionMessage
syscall

li $v0, 5
syscall

move $t7, $v0

bgt, $t7, 100, exception
blt, $t7, 0, exception

# returns $t7
jr $ra

.data

# String statements
openingParagraph: .asciiz "When you enter 5 test scores, I will drop the lowest \none and find the average of the four highest ones.\n\n"
getScorePrompt: .asciiz "Enter a test score between 0 and 100: "
exceptionMessage: .asciiz "\nScore must be in range 0 - 100. \nPlease re-enter score: "
average: .asciiz "\nAfter dropping the lowest score, the average is "
lineBreak: .asciiz "\n"