     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		         
     mov r0,#0
	 mov r1,#1
	 mov r3,r0
	 mov r3,r1
loop add r3,r0,r1
	 mov r0,r1
	 mov r1,r3
	 b loop
	 
stop	B stop; stop program	 
		 
     ENDFUNC
     END