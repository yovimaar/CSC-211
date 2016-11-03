# Find the largest integer from three integers given by the user

.text
.globl main

main:

la $a0,prompt1           # load address of prompt into a0
li $v0,4                 # load call code number to display a string into v0
syscall                  # system call to print the prompt for 1st integer

li $v0,5                 # load call code number to read first integer -> v0
syscall                  # system call to read first integer and store in v0

move $t0,$v0             # move integer from v0 -> t0 for safe keeping
                         # t0 holds first integer

la $a0,prompt2           # load address of prompt into a0
li $v0,4                 # load call code number to display a string into v0
syscall                  # system call to print the prompt for 2nd integer

li $v0,5                 # load call code number to read an integer -> v0
syscall                  # system call to read second integer and store in v0

move $t1,$v0             # move integer from v0 -> t1 for safe keeping
                         # t1 holds second integer

la $a0,prompt3           # load address of prompt into a0
li $v0,4                 # load call code number to display a string into v0
syscall                  # system call to print the prompt for 3rd integer

li $v0,5                 # load call code number to read an integer -> v0
syscall                  # system call to read second integer and store in v0

move $t2,$v0             # move integer from v0 -> t2 for safe keeping
                         # t2 holds second integer


la $a0, output           # load address of output message into a0
li $v0,4                 # load call code number to display a string into v0
syscall                  # system call to print output string

blt $t1, $t0, L1         # IF t0 > t1 then Branch to L1
blt $t0, $t1, L2         # IF t1 > t0 then Branch to L2

L1:
blt $t2, $t0, L3         # IF t0 > t2 then Branch to L3
move $a0,$t2             # IF t0 < t2 then move t2 to a0
li $v0,1                 # system call to print t2 as largest
syscall

li $v0,10                # Exit
syscall


L2:
blt $t2,$t1,L4           # IF t1 > t2 then Branch to L4
move $a0,$t2             # IF t1 < t2 then move t2 to a0
li $v0,1                 # Load call code number to display integer into v0
syscall                  # system call to print t2 as largest

li $v0,10                # Exit
syscall


L3:
move $a0,$t0             # move t1 to a0
li $v0,1                 # Load call code number to display integer into v0
syscall                  # system call to print t0 as largest

li $v0,10                # Exit
syscall


L4:
move $a0,$t1             # Move t1 to a0
li $v0,1                 # Load call code number to display integer into v0
syscall                  # system call to print t1 as largest



la $a0,endl              # load the new line character into a0
li $v0,4                 # load the call code number to display the string into v0
syscall                  # system call to print the new line character

li $v0,10                # Exit
syscall

#####data section######

.data

prompt1: .asciiz "Enter the first Integer: "        #prompt for the 1st integer
prompt2: .asciiz "Enter the second Integer: "       #prompt for the 2nd integer
prompt3: .asciiz "Enter the third Integer: "    #prompt for the 3rd integer
output:  .asciiz "The largest integer is "      #output message
endl:    .asciiz "\n"                           #new line

###################### Output ########################
# Enter the first integer: 5                         #
# Enter the second Integer: 8                        #
# Enter the third Integer: 4                         #
# The largest Integer is 8                           #
######################################################
