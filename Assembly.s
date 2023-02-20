
#	Fatih GENÇ


.data 
	myArray: .space 400
	welcomeMsg : .asciiz "Welcome to our MIPS Project!\n"
	options : 	.asciiz "\nMain Menu:\n1. Base Converter\n2. Add Rational Number\n3.Text Parser  \n4.Mystery Matrix Operation\n5.Exit\nPlease select an option : "
	prmptQ1Input:	.asciiz "Input:"
	Q1UserInput: 	.space 16 
	prmptQ1Type:	.asciiz "Type: "
	prmptOutput:	.asciiz"Output: "
	outputMsg:	.asciiz "\nOutput: "
	ahmsg:	.asciiz "A"
	bhmsg:	.asciiz "B"
	chmsg:	.asciiz "C"
	dhmsg:	.asciiz "D"
	ehmsg:	.asciiz "E"
	fhmsg:	.asciiz "F"
	newLine: .asciiz "\n"
	promptq3: .asciiz "Enter a string: "
	inputq3: .space 100
	parserMsg: .asciiz "Parser characters: "
	parser: .space 100
	output: .asciiz "Output:\n"
	promptq4: .asciiz "Input: "
	inputq4: .space 100
	first_num: .asciiz "Enter the first numerator: "
	first_denum: .asciiz "Enter the first denumerator: "
	second_num: .asciiz "Enter the second numerator: "
	second_denum: .asciiz "Enter the second denumerator: "
	slash: .asciiz "/"
	plus: .asciiz "+"
	message: .asciiz "Output: "
	equal: .asciiz "="
	endbystring: .asciiz "Program ends. Bye :)"
	





.text
.globl main




main:
	li $v0, 4                						# Print the Welcome to our MIPS project!
	la $a0, welcomeMsg          
	syscall

		
	menu:#main menu of the project
		#reset all values to prevent errors
		move $t0,$zero
		move $t1,$zero
		move $t2,$zero
		move $t3,$zero
		move $t4,$zero
		move $t5,$zero								# Set all registers 0 in order to use them properly.
		move $t6,$zero
		move $t7,$zero
		move $t8,$zero
		move $t9,$zero
		move $s1,$zero
		move $s2,$zero
		move $s3,$zero
		move $s4,$zero
		move $s5,$zero
		move $s6,$zero
		move $s7,$zero
		move $a1,$zero
		move $a2,$zero
		move $a3,$zero
		
		li $v0, 4               
       		la $a0, options          
       		syscall
		
		li $v0, 5	
		syscall           
		move $t5, $v0
		beq $t5,1,Q1
		beq $t5,2,Q2							# Jump each part for different selection
		beq $t5,3,Q3
		beq $t5,4,Q4
		beq $t5,5,exit
		
		j menu
Q1:
	li	$v0, 4	
	la	$a0, prmptQ1Input	
	syscall			#we take needen inputs
	la	$a0, Q1UserInput	
	li	$a1,16
	li	$v0, 8
	syscall
	li $v0, 4
    	la $a0, prmptQ1Type
    	syscall
    	li $v0, 5
    	syscall 
    	move $a1,$v0
	beq $a1,1,type1
	type2:		#if 2 is given as a type
		la $s0,Q1UserInput
		li $t9, 16
		sub $t8,$t8,$t8
		addi $t8,$t8,4
		sub $t9,$t9,$t9 
		addi $t9,$t9,0
		sub $t7,$t7,$t7 #counter of 4 bits
		addi $t7,$t7,3
		sub $t6,$t6,$t6 #Sum of 4 bits
		addi $t6,$t6,0
		sub $t5,$t5,$t5 #Holder
		addi $t5,$t5,0	
		loopQ1: #loop for taking binary numbers in length of 4
    			lb $a0, 0($s0)
    			beq $t9, $t8, increaseTempQ1 #when length of it equal 4
    			subi $t2, $a0, 48 #ascii to int
			sllv $t5, $t2, $t7  #sllv to get real value
			add $t6,$t6,$t5 #sum with total sum
			sub $t7,$t7,1 #decrease the 10's power
			beq $a0,$zero,menu
			addi $s0, $s0, 1 
			addi $t9,$t9,1
    			j loopQ1
    		increaseTempQ1:			#increase the temperory
    			move $a0, $t4      
 			li $v0, 1 
    			addi $t8,$t8,4
    			sub $t7,$t7,$t7 #counter of 4 bits
			addi $t7,$t7,3
    			j spaceq1 #to convert ascii versions
  		spaceq1:	#checks ascii values
  			beq $t6,10,ah
  			beq $t6,11,bh
  			beq $t6,12,ch
  			beq $t6,13,dh
  			beq $t6,14,eh
  			beq $t6,15,fh
  			li $v0,1
			move $a0,$t6
			syscall
    			sub $t6,$t6,$t6 #reset sum
			addi $t6,$t6,0
    			j loopQ1
		ah:
			li $v0,4
			la $a0,ahmsg
			syscall
			sub $t6,$t6,$t6 #reset sum
			addi $t6,$t6,0
			j loopQ1
		bh:	
			li $v0,4
			la $a0,bhmsg
			syscall
			sub $t6,$t6,$t6 #reset sum
			addi $t6,$t6,0
			j loopQ1
		ch:
			li $v0,4
			la $a0,chmsg
			syscall
			sub $t6,$t6,$t6 #reset sum
			addi $t6,$t6,0
			j loopQ1
		dh:
			li $v0,4
			la $a0,dhmsg
			syscall
			sub $t6,$t6,$t6 #reset sum
			addi $t6,$t6,0
			j loopQ1
		eh:
			li $v0,4
			la $a0,ehmsg
			syscall
			sub $t6,$t6,$t6 #reset sum
			addi $t6,$t6,0
			j loopQ1
		fh:
			li $v0,4
			la $a0,fhmsg
			syscall
			sub $t6,$t6,$t6 #reset sum
			addi $t6,$t6,0
			j loopQ1
		j menu	
	type1: #If type is given as 1
		li $t4, 01
		la $t1, Q1UserInput
  		li $t9, 16
  		firstBit: #checks first bit
  		lb $a0, ($t1)
  		lb $s3,($t1)
  		blt $a0, 48, printSumQ1     
  		addi $t1, $t1, 1         
  		subi $a0, $a0, 48
  		subi $s3, $s3, 48        
  		subi $t9, $t9, 1         
  		beq $a0, 0, isZero #for positive
  		beq $a0, 1, FirstIsOne#for negative
  		j printSumQ1     
  		contBit: #for next bits
  		lb $a0, ($t1)      
  		blt $a0, 48, printSumQ1     
  		addi $t1, $t1, 1          
  		subi $a0, $a0, 48         
  		subi $t9, $t9, 1         
  		beq $a0, 0, isZero #for 0
  		beq $a0, 1, isOne#for 1
  		j printSumQ1    
		isZero: #if it is zero do nothing
   		j contBit
 		FirstIsOne:   #if first bit is one make it negative        
		li $t8, 1               
		sllv $t5, $t8, $t9    
		add $t4, $t4, $t5 
		add $s4,$s3,$t5         
   		j contBit   	
   		isOne:  #if next bits are 1 make them positive               
		li $t8, 1               
		sllv $t5, $t8, $t9   
		add $t4, $t4, $t5         
   		j contBit
		printSumQ1:
		srlv $t4, $t4, $t9
		srlv $s4, $s4, $t9
		bne $s3,$zero,firstIsOneTwosComp
 	
		firstIsOneTwosComp:#Do two's complement when first one is 1
		sub $t4,$t4,$s4 
		sub $s4,$s4,$t4
		nor $s4, $s4, $s4
		addi $s4, $s4,1
		sub $t4,$t4,$t4
		add $t4,$t4,$s4
	
 		la $a0, outputMsg #print output message
 		li $v0, 4
 		syscall

 		move $a0, $t4      
 		li $v0, 1      	#print answer
 		syscall
 		move $v0,$t4
 		j menu

Q2:
	#getting the numbers from users.
	li $v0, 4
	la $a0, first_num
	syscall
	li $v0, 5
	syscall 
	move $t1,$v0
	li $v0, 4
	la $a0, first_denum
	syscall
	li $v0, 5
	syscall 
	move $t2,$v0
	li $v0, 4
	la $a0, second_num
	syscall
	li $v0, 5
	syscall 
	move $t3,$v0
	li $v0, 4
	la $a0, second_denum
	syscall
	li $v0, 5
	syscall 
	move $t4,$v0
	#printing the result
	li $v0, 4
	la $a0, message
	syscall
	li $v0, 1
	move $a0,$t1
	syscall
	li $v0, 4
	la $a0, slash
	syscall
	li $v0, 1
	move $a0,$t2
	syscall
	li $v0, 4
	la $a0, plus
	syscall
	li $v0, 1
	move $a0,$t3
	syscall
	li $v0, 4
	la $a0, slash
	syscall
	li $v0, 1
	move $a0,$t4
	syscall
	li $v0, 4
	la $a0, equal
	syscall
	mult $t1, $t4
	mflo $s0
	add $t6,$t6,$s0
	mult $t2, $t3
	mflo $s0
	add $t7,$t7,$s0
	add $s0,$t7,$t6
	mult $t2, $t4
	mflo $s1
	add $t5,$t5,$s1
	add $a1,$s0,0
	add $a2,$s1,0
	jal function
	div $s5,$s0,$v0
	div $s6,$s1,$v0
	li $v0, 1
	move $a0,$s5
	syscall
	li $v0, 4
	la $a0, slash
	syscall
	li $v0, 1
	move $a0,$s6
	syscall
	j menu
function:
	blt $a1,0,function1
	blt $a2,0,function2
	#gcd algorithm
	beq $a1,$a2,finish
	bge $a1,$a2,gcd
	sub $a2,$a2,$a1
	j function 
	gcd:
	sub $a1,$a1,$a2
	j function
	finish:
	add $v0,$zero,$a1
	jr $ra
function1: #we need to take a1 as positive if it is given as negative to calculate gcd
	mul $a1,$a1,-1
    	j function
function2:#we need to take a2 as positive if it is given as negative to calculate gcd
   	mul $a2,$a2,-1
	j function

Q3:
	li $v0, 4
    	la $a0, promptq3
    	syscall
    	li $v0, 8
    	la $a0, inputq3
    	li $a1, 100
    	syscall		#We take needed inputs
   	move $s0, $a0
   	li $v0, 4
    	la $a0, parserMsg
    	syscall
    	li $v0, 8
    	la $a0, parser
    	li $a1, 100
    	syscall
    	move $s1, $a0
    	li $v0, 4
    	la $a0, output
    	syscall
	addi $t1,$zero,0
	loopQ3Start:		#Start to check given input for pre parsers
		move $s3,$s1	#to not lose given parser input
		lb $a0, 0($s0)		
    		parserloopstart:	#iterating parser input
    			lb $a2, 0($s3)
    			addi $s3, $s3,1
    			beq $a0, $a2,increasearrayloopq3Start
    			bne $a2,10, parserloopstart
    			j loopQ3
    	increasearrayloopq3Start: #if pre parser is found
    		addi $s0, $s0, 1
    		j loopQ3Start
	loopQ3:			#main loop that we iterate to find parser values in given input sentence
    		lb $a0, 0($s0)
    		addi $s0, $s0, 1
    		beq $a0, 32, spaceq3 #to not lose given parser input
    		beq $a0, 10, menu
    		move $s3,$s1
    		parserloop: #iterating parser input
    			lb $a2, 0($s3)
    			addi $s3, $s3, 1  
    			beq $a0, $a2, checkparsercounter #compares given sentence with parser
    			beq $a2, 10, printval
    			j parserloop	
    		j loopQ3
	printval:  #if not space and not in parser print value
		li $v0, 11
    		syscall
    		addi $t1,$zero,0
    		j loopQ3
	spaceq3: #to create new line when iterated value is space or parser
    		li $v0, 4
    		la $a0, newLine
    		syscall
    		addi $t1,$t1,1
    		j loopQ3
	checkparsercounter:#to not creating new line for parsers that are in a row
		addi $t1,$t1,1
		beq $t1,1,spaceq3
		j loopQ3
		
	
		
		

Q4:
    li $v0, 4
    la $a0, promptq4
    syscall

    li $v0, 8
    la $a0, inputq4
    li $a1, 100
    syscall
			#needed inputs are taken
    move $s0, $a0
    move $s1,$s0
    move $s2,$s0   
    
    
    move $t2,$zero #counter
    loopCounter: #to find length of input
    	lb $a0, 0($s1)
    	addi $s1, $s1, 1
    	beq $a0, 32, count
    	beq $a0, 10, doneCounting #when we hit last element done counting
    	j loopCounter
    
    count:	#increase the count value
    	addi $t2,$t2,1
    	j loopCounter
    doneCounting:# finish counting
    	addi $t2,$t2,1
    	move $t3,$zero #t3 holds square root
	addi $t3,$t3,1 
    	move $t5,$zero
    	squarerootloop: #to calculate square root of given input size by using the formula  
    		div $t4,$t2, $t3 
    		add $t5, $t3,$t4
    		srl $t5,$t5,1		#x = (x + n/x) /2 (x is root, n is the input value )
    		beq $t3,$t5,doneSquareRoot
    		addi $t3,$t3,1
    		j squarerootloop
    
    createArr: #create array without spaceces to do calculations in better way
    	lb $a0,0($s2)
    	move $s3,$s2
   	move $s4,$s2
    	beq $a0,45,minusq4 #if '-' is seen in the given input, we increase counter by one, increase the input counter by 1 and jump createArr again
    	beq $a0,10,doneCreatingArray    #when elements are finished jump to start calculating given values
    	beq $a0,32,spaceaddcounter #if space add 1 to pass the space
    	j notspaceaddcounter #if not space convert the given value
    
        
    							
    notspaceaddcounter: #if not space convert the given value
    	addi $s3,$s3,1				
    	lb $a0,0($s3)
    	beq $a0,32,calculateint#if space calculate value of the given input
    	beq $a0,10,calculateint#if end of string calculate value of the given input
    	addi $t2,$t2,1
    	j notspaceaddcounter #jump itself to determine size of the given number 
																																																						
    spaceaddcounter:#if space add 1 to pass the space
    	addi $s2,$s2,1
    	j createArr
    
    minusq4:#if '-' is seen in the given input, we increase counter by one, increase the input counter by 1 and jump createArr again
    	addi $s2,$s2,1
    	addi $s7,$s7,1
    	j createArr
												
    calculateint: #calculate the given input number by correct size
    	lb $a0,0($s4) 	
    	addi $t1,$t1,1
    	sub $t4,$t2,$t1 
    	move $t5,$t4
    	beq $t5,0,summation #if the number size is 1 go to the summation directly
    	j multiplybyten #to multiply iterated number by ten to get its correct value
    		
    			
    	
    multiplybyten:#to multiply iterated number by ten to get its correct value
    	mul  $s5,$s5,10
    	subi $t5,$t5,1
    	beq $t5,0,summation#if the number size is 1 go to the summation directly
    	j multiplybyten
    summation:#sum the iterated values and get final value    	
    	subi $a0,$a0,48
    	mul $s5,$s5,$a0
    	add $t6,$t6,$s5
    	move $s5,$zero
    	addi $s5,$s5,1
    	beq $t1,$t2,changeplace
    	addi $s4,$s4,1
    	j calculateint
    changeplace:#add array and change it place holder by size of added input
   	addi $t8,$zero,0
   	move $t8,$t9
   	addi $t7,$t7,4
  	mul $t8,$t8,$t7
  	beq $s7,1,changeplaceforminus#if the number counter is 1 we need to change the sign of the number
  	sw $t6, myArray($t8)
   	subi $t7,$t7,4
   	addi $t9,$t9,1
  	move $t6,$zero
    	addi $t6,$t6,0
    	add $s2,$s2,$t2
    	move $s6,$zero
    	addi $s6,$s6,1
    	move $s5,$zero
    	addi $s5,$s5,1		#reset the values
    	move $t1,$zero
    	addi $t1,$t1,0
    	move $t2,$zero
    	addi $t2,$t2,1
    	move $t4,$zero
    	addi $t4,$t4,1
    	move $t5,$zero
    	add $t5,$t5,$zero
    	
    	j createArr
    changeplaceforminus: #add value in to array by multiplying by -1 if it is negative
    	mul $t6,$t6,-1
    	sw $t6, myArray($t8)
   	subi $t7,$t7,4
   	addi $t9,$t9,1
  	move $t6,$zero
    	addi $t6,$t6,0
    	add $s2,$s2,$t2
    	move $s6,$zero
    	addi $s6,$s6,1 		#reset the values
    	move $s5,$zero
    	addi $s5,$s5,1
    	move $t1,$zero
    	addi $t1,$t1,0
    	move $t2,$zero
    	addi $t2,$t2,1
    	move $t4,$zero
    	addi $t4,$t4,1
    	move $t5,$zero
    	add $t5,$t5,$zero
    	subi $s7,$s7,1
    	
    	j createArr
  																																																										
    doneCreatingArray: #after creating array values are reset and jump to calculate mystery operation
    
    	addi $a1,$zero,0
    	addi $t1,$zero,1
    	addi $t2,$zero,0
    	addi $t4,$zero,0
    	addi $t5,$zero,0	#reset the values
    	addi $t6,$zero,0
    	addi $t7,$zero,0
    	addi $t8,$zero,0
    	addi $t9,$zero,0
    	addi $s5,$zero,0
    	addi $s6,$zero,0
    	
    	j lefttoright #start calculating left to rigth part
    	
    
    lefttoright: #to calculate left to rigth part
    	lw $a0,myArray($t5)#loading the first value of the array
      	beq $t2,0,adding #tracing the calculation path
    	beq $t2,1,substract #tracing the calculation path
    	
    	
    									#ilk 2 lik 0. eleman?n de?eri �arp? 0 art?  n+1 �arp? 4 kadar ileri gidip o eleman?n de?eriyle �arp?cak 									#sonra n-1 kadar geri gidip o eleman?n de?eriyle �arp?cak n-1 kadar d�necek loop sonra n �arp? - 1 inci elamana gidip i?leme n b�l� 2 tur kadar devam edicek
    adding:# goes N+1 in NxN matrix and reset the path counter
    	addi $t2,$t2,1
    	mul $t1,$t1,$a0 #to calculate path $t1 holds product of the path
    	addi $t4,$t4,1
    	beq $t3,$t4,finishturn #if counter $t4 equals to N
    	add $t8,$t8,$t3
    	addi $t8,$t8,1
    	mul $t8,$t8,4
    	add $t5,$t5,$t8 
    	addi $t8,$zero,0
    	j lefttoright
    substract:#goes N-1 in NxN matrix and reset the path counter
    	subi $t2,$t2,1
    	mul $t1,$t1,$a0#to calculate path $t1 holds product of the path
    	addi $t4,$t4,1
    	beq $t3,$t4,finishturn#if counter $t4 equals to N
    	
    	mul $t8,$t3,4
    	subi $t8,$t8,4
    	sub $t5,$t5,$t8
    	addi $t8,$zero,0
    	
    	j lefttoright
    finishturn:#finishes the first part and do N/2 part 
    	addi $t4,$zero,0
    	li $v0,1
    	move $a0,$t1
    	syscall
    	li $a0, 32
	li $v0, 11
    	syscall
    	div $t7,$t3,2
    	addi $t6,$t6,1
    	addi $t1,$zero,1
    	beq $t7,$t6,reset #if $t6 equals N/2 which means N/2 turns are completed then finish the left to rigth part
    	addi $t5,$t5,4
 
    	j lefttoright
    reset: #resets the values and create new line
    	addi $a1,$zero,0
    	addi $t1,$zero,1
    	addi $t2,$zero,0
    	addi $t4,$zero,0
    	addi $t5,$zero,4
    	addi $t6,$zero,0
    	addi $t7,$zero,0
    	addi $t8,$zero,0
    	addi $t9,$zero,4
    	addi $s5,$zero,0
    	addi $s6,$zero,0
    	j spaceq4
    	
    uptodown: #to calculate up to down part
    	lw $a0,myArray($t5) #takes second element of the array 
      	beq $t2,0,subN1 #goes N-1 in NxN matrix and reset the path counter
    	beq $t2,1,addN1
    	
    subN1:#goes N-1 in NxN matrix and reset the path counter
    	addi $t2,$t2,1
    	mul $t1,$t1,$a0
    	addi $t4,$t4,1
    	beq $t3,$t4,finishturnsecond #if counter $t4 equals to N
    	add $t8,$t8,$t3
    	subi $t8,$t8,1
    	mul $t8,$t8,4
    	add $t5,$t5,$t8
    	addi $t8,$zero,0
    	j uptodown
    
    addN1:#goes N+1 in NxN matrix and reset the path counter
    	subi $t2,$t2,1
    	mul $t1,$t1,$a0
    	addi $t4,$t4,1
    	beq $t3,$t4,finishturnsecond#if counter $t4 equals to N
    	add $t8,$t8,$t3
    	addi $t8,$t8,1
    	mul $t8,$t8,4
    	add $t5,$t5,$t8
    	addi $t8,$zero,0
    	j uptodown
    	
    finishturnsecond:#finishes the first part of second part of the question and do N/2 part
    	addi $t4,$zero,0
    	li $v0,1
    	move $a0,$t1
    	syscall
    	li $a0, 32
	li $v0, 11
    	syscall
    	div $t7,$t3,2
    	addi $t6,$t6,1
    	addi $t1,$zero,1
    	beq $t7,$t6,finishq4 #if $t6 equals N/2 which means N/2 turns are completed then finish the q4
    	addi $t9,$t9,8
    	move $t5,$t9
    	j uptodown
    finishq4:#finishes the q4
    	j menu
    	
    	
    spaceq4: #create new line
    	li $v0, 4
    	la $a0, newLine
    	syscall
    	j uptodown #goes to second part of the question which is up to down
    doneSquareRoot: #when square root is finished
    	addi $t7,$zero,0
    	move $t8,$zero
    	
    	move $s6,$zero
    	addi $s6,$s6,1
    	move $s5,$zero
    	addi $s5,$s5,1
    	
    	move $t1,$zero
    	addi $t1,$t1,0
    	move $t2,$zero	#reset the values
    	addi $t2,$t2,1
    	
    	move $t4,$zero
    	addi $t4,$t4,1
    	move $t5,$zero
    	add $t5,$t5,$zero
    	move $t6,$zero
    	addi $t6,$t6,0
    	
    	addi $t9,$zero,0
    	
    	move $s2,$s0
    	addi $s7,$zero,0
    
    	j createArr #and jump to create array
exit: #exit call

   li $v0, 4                						# Print the Welcome to our MIPS project!
   la $a0, endbystring          
   syscall
   li $v0, 10       
   syscall 
