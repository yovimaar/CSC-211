# Takes 10 integers and computes the average

   .text
     .globl main

main:
    
    la $t0,array            # load address of array into $t0
    li $t1,10               # set size of array to 10 (0-9)
    li $t3,0                # initialize counter to zero
    
while: 

    la $a0,intPrompt        # prompt for integer
    li $v0,4                # load call code number to display a string 
    syscall                 # system call to display a string

    li $v0,5            
    syscall                 # system call to read integer
        
    add $s1,$s1,$v0
    
    sw $v0,($t0)            # store word from t0 in v0
    
    add $t0,$t0,4           # move pointer to next array element
    add $t3,$t3,1           # increment counter
    
    blt $t3,$t1,while       # if counter < size of array branch to while
    
wend: 

    la $a0,title            # load title string into a0
    li $v0,4                # load call code number to display 
    syscall                 # system call to display a string
    
    li $t0,0                # initialize array index value back to 0
    li $t3,0                # initialize size counter back to 0
    la $t0,array            # load address of array into $t0
    
startPrint:

    lw $t2,($t0)            # load word a[i] into temp (t2)
    move $a0,$t2            # move a[i] to a0 for display
    li $v0,1            
    syscall                 # system call to display a[1]
    
    la $a0,space            # load comma string into a0
    li $v0,4                # load call code number to display a string
    syscall                 # system call to display a string
    
    add $t0,$t0,4           # move pointer to next array element
    add $t3,$t3,1           # increment counter
    
    blt $t3,$t1,startPrint  # if counter < size of array branch to startPrint
    

    
    li $t5,10               # store 10 in t5
    syscall
        
    div $s1,$t5             # divide s1 by t5
    mfhi $t6                # move from hi to t6
    mflo $t7                # move from lo to t7
    
    la $a0,average          # load average string into a0
    li $v0,4                
    syscall                 # system call to print a string     
    
    move $a0,$t7            # move t7 into a0
    li $v0,1
    syscall                 # system call to print a integer
    
    la $a0,decimal          # load decimal string into a0
    li $v0,4
    syscall                 # system call to print a string
    
    move $a0,$t6            # move t6 into a0
    li $v0,1
    syscall                 # system call to print a integer
    
endPrint:    
        
    la $a0,crlf             # Display "cr/lf"
    li $v0,4                # a0 = address of message
    syscall                 # v0 = 4 which indicates display a string

    li $v0,10               # End Of Program
    syscall

    .data

intPrompt:  .asciiz   "Enter an Integer: "   # hold the prompt message for each int in the array  
title:      .asciiz   "\nArray: "
crlf:       .asciiz   "\n"
space:      .asciiz   " "
average:    .asciiz   "\nThe average is: "
decimal:    .asciiz   "."
array:      .word 40

################# Output ################
# Enter an Integer: 40                  #
# Enter an Integer: 53                  #
# Enter an Integer: 25                  #
# Enter an Integer: 93                  #
# Enter an Integer: 12                  #
# Enter an Integer: 103                 #
# Enter an Integer: 43                  #
# Enter an Integer: 27                  #
# Enter an Integer: 7                   #
# Enter an Integer: 58                  #
#                                       #
# Array: 40 53 25 93 12 103 43 27 7 58  #    
# The average is: 46.1                  #
#########################################
