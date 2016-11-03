# Count up to any number given by the user

        .text
        .globl main

main:                      

         la $a0,prompt            # load address of prompt into a0
         li $v0,4                 # load call code number to display a string into v0
         syscall                  # system call to print the prompt string
         
         li $v0,5                 # load call code number to read an integer -> v0
         syscall                  # system call to read second integer and store in v0

         
         move $t2,$v0             # move integer from v0 -> t1 for safe keeping
        
            
         li $t1,0                 # set t1 to 0
          
Loop:    li $t3,10                # set t3 to 10
            
inLoop:  
         move $a0,$t1             # move t1 to a0
         li $v0,1                 # system call to print integer
         syscall
         
         li $a0,32                # load ASCII character for a whitespace into a0
         li $v0,11                 
         syscall                  # system call to print a whitespace 
         
         add $t1,$t1,1            # add 1 to t1 and store in t1
        
         sub $t3,$t3,1            # subtract 1 from t3 and store in t3
         
         beq $t1,$t2,End          # if t1 == t2 then branch to End
         beq $t3,0,newline        # if t3 == 0 then branch to newline
         j inLoop                 # repeat loop

newline: la $a0,newLine           # load address of newLine into a0
         li $v0,4                 # load call code number to display a string into v0
         syscall                  # system call to print a newLine
         j Loop

         
End: 
          move $a0,$t2            # move t2 to a0 to print integer
          li $v0,1                # system call to print integer
          syscall
          
          la $a0,endl             # display new line
          li $v0,4
          syscall

          li,$v0,10               # exit
          syscall

######### data segment ############

.data
prompt:       .asciiz "Enter a number: "  #prompt user for a number
number:       .asciiz " "                 #print a number 
newLine:      .asciiz "\n"                #print a newline
endl:         .asciiz "\n"                #end line

############## Output ###############
# Enter a number: 58                #
# 0 1 2 3 4 5 6 7 8 9               #
# 10 11 12 13 14 15 16 17 18 19     #
# 20 21 22 23 24 25 26 27 28 29     #
# 30 31 32 33 34 35 36 37 38 39     #
# 40 41 42 43 44 45 46 47 48 49     # 
# 50 51 52 53 54 55 56 57 58        #
#####################################
