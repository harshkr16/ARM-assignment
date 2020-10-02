     AREA     appcode2, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		         
     mov r0,#4
	 mov r1,#17
	 mov r2,#7
	 cmp r1,r0
	 IT GT
	 movgt r8,r1
	 cmp r8,r2
	 ITE GT
	 movgt r8,r8
	 movle r8,r2
	 
stop	B stop; stop program	 
		 
     ENDFUNC
     END