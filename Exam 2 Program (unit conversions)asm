# Programmer: Evan Soloway
# Date: 04/14/2020
# This program accepts a temperature in Fahrenheit from the user and
# converts that temp to celsius. A table displaying all the user's
# conversions is displayed at the end of the program.

main:

# First prompt
li $v0, 4
la $a0, initialPrompt
syscall 

li $v0, 4
la $a0, doubleNewLine
syscall 

# Loop target variable initialized to 0
li $t8, 0

jal receiveDataLoop # calling loop which receives data

li $v0, 4
la $a0, newLine
syscall 

# Preface to data display
li $v0, 4
la $a0, conclusion
syscall 

li $v0, 4
la $a0, doubleNewLine
syscall 

li $t8, 0 # re-initialize to 0

jal displayDataLoop # calling loop which outputs data

li $v0, 10
syscall

### FUNCTIONS

Celsius:

addi $t3, $0, 5 # Register for formula multiplicand
addi $t5, $0, 9 # Register for divisor

# Formula for conversion
subi $t2, $t1, 32 # F-32
mult $t2, $t3 # 5(F-32)
mflo $t4 # outputs previous mult line to $t4
div $t4, $t5 # 5(F-32) / 9
mflo $t6 # outputs final conversion to $t6

# Branches
beq $t8, 1, convert1
beq $t8, 2, convert2
beq $t8, 3, convert3
beq $t8, 4, convert4
beq $t8, 5, convert5
beq $t8, 6, convert6
beq $t8, 7, convert7
beq $t8, 8, convert8
beq $t8, 9, convert9
beq $t8, 10, convert10
beq $t8, 11, convert11

li $v0, 10
syscall

receiveDataLoop:

# Loop qualifier
slti $t7, $t8, 11 # set $t7 to 1 if $t8 less than 11; else, set $t7 to 0
beq $t7, $0, return # return to main function if $t7 equal to 0 (i.e. if $t8 !< 11)

addi $t8, $t8, 1 # increment $t8 by 1

li $v0, 4
la $a0, prompt
syscall 

# Receives fahrenheit value as integer
li $v0, 5
syscall 

# Move input to $t1
move $t1, $v0

j Celsius # Calling celsius

displayDataLoop:

# Loop qualifier
slti $t7, $t8, 11 # set $t7 to 1 if $t8 less than 11; else, set $t7 to 0
beq $t7, $0, return # return to main function if $t7 equal to 0 (i.e. if $t8 !< 11)

addi $t8, $t8, 1 # increment $t8 by 1

# Branches
beq $t8, 1, output1
beq $t8, 2, output2
beq $t8, 3, output3
beq $t8, 4, output4
beq $t8, 5, output5
beq $t8, 6, output6
beq $t8, 7, output7
beq $t8, 8, output8
beq $t8, 9, output9
beq $t8, 10, output10
beq $t8, 11, output11

li $v0, 10
syscall

return:

jr $ra

### BRANCHES

convert1:

sh $t1, fahr1 
sh $t6, cels1 

j receiveDataLoop

convert2:

sh $t1, fahr2
sh $t6, cels2 

j receiveDataLoop

convert3:

sh $t1, fahr3
sh $t6, cels3 

j receiveDataLoop

convert4:

sh $t1, fahr4
sh $t6, cels4 

j receiveDataLoop

convert5:

sh $t1, fahr5
sh $t6, cels5 

j receiveDataLoop

convert6:

sh $t1, fahr6
sh $t6, cels6 

j receiveDataLoop

convert7:

sh $t1, fahr7
sh $t6, cels7 

j receiveDataLoop

convert8:

sh $t1, fahr8
sh $t6, cels8 

j receiveDataLoop

convert9:

sh $t1, fahr9
sh $t6, cels9 

j receiveDataLoop

convert10:

sh $t1, fahr10
sh $t6, cels10 

j receiveDataLoop

convert11:

sh $t1, fahr11
sh $t6, cels11 

jr $ra

output1:

li $v0, 4
la $a0, formulaPart1
syscall

li $v0, 1
lh $a0, fahr1
syscall

li $v0, 4
la $a0, formulaPart2
syscall

li $v0, 1
lh $a0, cels1
syscall

li $v0, 4
la $a0, celsius
syscall

li $v0, 4
la $a0, newLine
syscall

j displayDataLoop

output2:

li $v0, 4
la $a0, formulaPart1
syscall

li $v0, 1
lh $a0, fahr2
syscall

li $v0, 4
la $a0, formulaPart2
syscall

li $v0, 1
lh $a0, cels2
syscall

li $v0, 4
la $a0, celsius
syscall

li $v0, 4
la $a0, newLine
syscall

j displayDataLoop

output3:

li $v0, 4
la $a0, formulaPart1
syscall

li $v0, 1
lh $a0, fahr3
syscall

li $v0, 4
la $a0, formulaPart2
syscall

li $v0, 1
lh $a0, cels3
syscall

li $v0, 4
la $a0, celsius
syscall

li $v0, 4
la $a0, newLine
syscall

j displayDataLoop

output4:

li $v0, 4
la $a0, formulaPart1
syscall

li $v0, 1
lh $a0, fahr4
syscall

li $v0, 4
la $a0, formulaPart2
syscall

li $v0, 1
lh $a0, cels4
syscall

li $v0, 4
la $a0, celsius
syscall

li $v0, 4
la $a0, newLine
syscall

j displayDataLoop

output5:

li $v0, 4
la $a0, formulaPart1
syscall

li $v0, 1
lh $a0, fahr5
syscall

li $v0, 4
la $a0, formulaPart2
syscall

li $v0, 1
lh $a0, cels5
syscall

li $v0, 4
la $a0, celsius
syscall

li $v0, 4
la $a0, newLine
syscall

j displayDataLoop

output6:

li $v0, 4
la $a0, formulaPart1
syscall

li $v0, 1
lh $a0, fahr6
syscall

li $v0, 4
la $a0, formulaPart2
syscall

li $v0, 1
lh $a0, cels6
syscall

li $v0, 4
la $a0, celsius
syscall

li $v0, 4
la $a0, newLine
syscall

j displayDataLoop

output7:

li $v0, 4
la $a0, formulaPart1
syscall

li $v0, 1
lh $a0, fahr7
syscall

li $v0, 4
la $a0, formulaPart2
syscall

li $v0, 1
lh $a0, cels7
syscall 

li $v0, 4
la $a0, celsius
syscall

li $v0, 4
la $a0, newLine
syscall

j displayDataLoop

output8:

li $v0, 4
la $a0, formulaPart1
syscall

li $v0, 1
lh $a0, fahr8
syscall

li $v0, 4
la $a0, formulaPart2
syscall

li $v0, 1
lh $a0, cels8
syscall

li $v0, 4
la $a0, celsius
syscall

li $v0, 4
la $a0, newLine
syscall

j displayDataLoop

output9:

li $v0, 4
la $a0, formulaPart1
syscall

li $v0, 1
lh $a0, fahr9
syscall

li $v0, 4
la $a0, formulaPart2
syscall

li $v0, 1
lh $a0, cels9
syscall

li $v0, 4
la $a0, celsius
syscall

li $v0, 4
la $a0, newLine
syscall

j displayDataLoop

output10:

li $v0, 4
la $a0, formulaPart1
syscall

li $v0, 1
lh $a0, fahr10
syscall

li $v0, 4
la $a0, formulaPart2
syscall

li $v0, 1
lh $a0, cels10
syscall 

li $v0, 4
la $a0, celsius
syscall

li $v0, 4
la $a0, newLine
syscall

j displayDataLoop

output11:

li $v0, 4
la $a0, formulaPart1
syscall

li $v0, 1
lh $a0, fahr11
syscall

li $v0, 4
la $a0, formulaPart2
syscall

li $v0, 1
lh $a0, cels11
syscall 

li $v0, 4
la $a0, celsius
syscall

li $v0, 4
la $a0, newLine
syscall

j displayDataLoop

### DATA SECTION

.data

# Strings
initialPrompt: .asciiz "Enter 10 temperatures in Fahrenheit"
prompt: .asciiz "Enter Temp: "
newLine: .asciiz "\n"
doubleNewLine: .asciiz "\n\n"
conclusion: .asciiz "Here are the conversions for your inputs: "
formulaPart1: .asciiz "C = 5 ("
formulaPart2: .asciiz " degrees Fahrenheit - 32) / 9 = "
celsius: .asciiz " degrees Celsius"

# Info stored in memory
fahr1:.half 0
cels1:.half 0
fahr2:.half 0
cels2:.half 0
fahr3:.half 0
cels3:.half 0
fahr4:.half 0
cels4:.half 0
fahr5:.half 0
cels5:.half 0
fahr6:.half 0
cels6:.half 0
fahr7:.half 0
cels7:.half 0
fahr8:.half 0
cels8:.half 0
fahr9:.half 0
cels9:.half 0
fahr10:.half 0
cels10:.half  0
fahr11: .half 0
cels11:.half  0
