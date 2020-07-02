.data
msgA:    .asciiz "Enter value for the value 'A': "
	.space 64
msgB:    .asciiz "Enter value for the value 'B': "
	.space 64	
resMsg:	.asciiz "A*B = "
	.space 64

	.text
	.globl main

# Main Function - Asks user for input, then calls the recursive exponent function, after function runs, it outputs the result
main:	
	# Ask user for input
	li $v0, 4			# 4 means cout
	la $a0, msgA		# msgA stored into $a0 
	li $a1, 64			# allocate memory for msg
	syscall				# print msg

	# Store user input as a ($t0)
	li $v0, 5			# 5 means cin
	syscall				# cin the input

	move $t0, $v0		# store a into $t0

	li $v0, 4			# 4 means cout
	la $a0, msgB		# msgB stored into $a0 
	li $a1, 64			# allocate memory for msg
	syscall				# print msg

	# Store user input as b ($t1)
	li $v0, 5			# 5 means cin
	syscall				# cin the input

	move $t1, $v0		# $t1 <= b

	li $v0, 4			# 4 means cout
	la $a0, resMsg		# print resMsg
	li $a1, 64			# allocate memory for message
	syscall				# return msg

	addi $t3, $0, 1		# $t3 <= result = 1

   	move $a0, $t0		# move value of $t1 into $a0 = a
   	move $a1, $t1		# move value of $t2 into $a1 = b

	jal rexp			# go to recursive exponent function
	
	li $v0, 1			# 1 means print int
	move $a0, $t3		# move result into $a0
	syscall				# return a*b

	li $v0, 10			# 10 means terminate program
	syscall				# end program

# Exponential Function - Input: $t0 (a) and $t1 (b), Output: $v0 (a^b)
# If b = 1, return a
# If b > 1, return rmult(a, rexp(a,b-1))
rexp:
	mul $t3, $a0, $t3	# result = a * result
	beq $a1, 1, rmult	# if b=1, go to rmult
	addi $sp, $sp, -4	# push stack
	sw $ra, 0($sp)		# store $ra in stack
	addi $a1, $a1, -1	# decrement b
	jal rexp			# recursive call

# Multiply Function - Input: $t0 (a) and $t1 (b), Output: $v0 (a*b)
# If b = 1, return a
# If b > 1, return (a + rmult(a, b-1))
	rmult:
		beq $a1, 1, done	# if b=1, done
		add $t3, $a0, $t3	# result = a + rmult(a,b-1)
		addi $sp, $sp, -4	# push stack
		sw $ra, 0($sp)		# store $ra in stack
		addi $a1, $a1, -1	# decrement b
		jal rmult			# recursive call

	done:
		lw $ra, 0($sp)	# load ra to stack
		addi $sp, $sp, 4# pop the stack
		jr $ra			# go to return address

