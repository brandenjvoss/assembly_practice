		        .data
		        .align  4
primearray:     	.space  80		//create primearray and allocate 80 bytes (will hold the prime numbers)
array:			.space	140	    	//create array and allocate 140 bytes (will hold the numbers flagged as non-prime)

// Start of ComputePrimes function

        		.text
        		.global		ComputePrimes
        		.func		ComputePrimes

ComputePrimes:
// Save registers

        	push		{r0,r1,r2,r3,r4,r5,r6,r7}
       		mov 		r4, lr
        	push		{r4}

// Insert your code to compute the first 20 prime numbers here.

		mov		r0,	#3		
		ldr		r7,	=primearray	//address of primearray is put into r7
		ldr		r4,	=array		//address of array is put into r4

for1:		mov		r2,	#12		//12 is placed into r2, this is where divisions by 3	
		cmp		r0,	#3
		beq		if1		        //branch to if1 if r0 contains 3
		mov		r2,	#44	        //44 is placed into r2, this is where divisions by 5 begin
		cmp		r0,	#5	
		beq		if2		        //branch to if2 if r0 contains 5
		mov		r2,	#92	        //92 is placed into r2, this is where divisions by 7 begin 
		cmp		r0,	#7
		beq		if3		        //branch to if3 if r0 contains 7
		bgt		endfor1		    	//r0 contains 9 so end the loop
return:
		add		r0,	#2	        //r0 increments by 2 to transition to the next switch case
		b		for1
endfor1:
		mov		r0,	#1	
		b		read

if1:
if1:		mov		r1,	r0	        //initailly 3 is placed into r1 
for2:		cmp		r1,	#24		//r1 is compared to 24 since 24 is where divisions by 3
		bgt		endfor2		
		str		r0,	[r2,r4]	    	//the value in r0 is put into the sum of r4 and r2 (array) 
		add		r2,	#12	        //12 is added to r2 indicating the location of the next number
		add		r1,	#2	        //r1 is incremented by 2 to test the next number for primality 
		b		for2		
endfor2:
		b		return

if2:
if2:		mov		r1,	r0	        //initailly 5 is placed into r1
for3:		cmp		r1,	#14		//r1 is compared to 14 since 14 is where divisions by 5
		bgt		endfor3		
		str		r0,	[r2,r4]	    	//the value in r0 is put into the sum of r4 and r2 (array)
		add		r2,	#20	        //20 is added to r2 indicating the location of the next number
		add		r1,	#2	        //r1 is incremented by 2 to test the next number for primality
		b		for3
endfor3:
if3:		b		return

if3:		mov		r1,	r0		 //initailly 7 is placed into r1
for4:  		cmp		r1,	#10		 //r1 is compared to 10 since 10 is where divisions by 7
		bgt		endfor4
		str		r0,	[r2,r4]	    	//the value in r0 is put into the sum of r4 and r2 (array)
		add		r2,	#28	        //28 is added to r2 indicating the location of the next number
		add		r1,	#2	        //r1 is incremented by 2 to test the next number for primality
		b		for4
endfor4:
		b		return

read:		mov		r6,	r0
		ldr		r5,	[r4]	    	//load address of number in array into r5
		cmp		r5,	#0	
		beq		store		    	//r5 contains a prime
		add		r4, #4		    	//increment array by one spot
		add		r0,	#1	        //increment index corresponding to the primearray by 1
		b		read

store:		lsl		r6,	#1	        //index multiplied by 2
		add		r6,	#1	        //add 1, in order to get odd number
		str		r6,	[r7]	    	//store the prime number in primearray
		cmp		r6, #73
		beq		done
		add		r7,	#4	        //increment primearray index by 1 spot
		add		r4, #4		    	//increment array by one spot
		add		r0,	#1	        //increment index corresponding to the primearray by 1
		b		read

                                        		// End of ComputePrimes function

done:		pop		{r4}
        	mov		lr, r4
        	pop		{r0,r1,r2,r3,r4,r5,r6,r7}
        	bx		lr

