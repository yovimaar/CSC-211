# Find the length of a given string 


        .text
        .globl main

main:                      

         la $a0,prompt       # load address of prompt into a0
         li $v0,4            # load call code number to display a prompt into v0
         syscall             # system call to print the prompt string

          
         la $a0,str          # load string into a0         
         li $a1,100          # set the length to 100
         li $v0,8            # load call code number to read a string
         syscall
          
          
          
          la $t2,str          # t2 points to the string
          li $t1,-1           # start the count at -1 and hold the count 
        
WHILE:    lb $t0,($t2)        # get a byte from the string
          beqz $t0,ENDWHILE   # zero means end of string
          add $t1,$t1,1       # increment count
          add $t2,1           # move pointer one character
          j WHILE             # go around the loop again

ENDWHILE: la $a0,ans          # display "length is "
          li $v0,4            # load call code number to display a pormpt into v0
          syscall             # system call to print the prompt string
  
          move $a0,$t1        # display the length  
          li $v0,1            # load call code number to print integer
          syscall             # system call to print integer

          la $a0,endl         # display new line
          li $v0,4
          syscall

          li,$v0,10            # exit
          syscall

######### data segment ############

.data
prompt:       .asciiz "Enter a string: "                          #prompt to enter a string
ans:          .asciiz "The length of the string is: "             #display the string length
endl:         .asciiz "\n"                                        #display a new line
str:          .space 100                                          #set str length to 100

###################### Output ##############
# Enter a string: I love assembly!         #
# The length of the string is: 16          #
############################################
