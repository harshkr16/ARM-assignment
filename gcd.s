     AREA     appcode2, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		         
     mov r0,#4;a
	 mov r1,#17;b
loop cmp r0,r1	 
	 subgt r0,r0,r1
	 sublt r1,r1,r0
	 bne loop
stop	B stop; stop program	 
		 
     ENDFUNC
     END