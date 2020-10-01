     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		         
     mov r2,#7
	 mov r7,#8
	 cmp r2,r7
	 ITTE NE
	 subne r2,r2,r7
	 movne r2,#0
	 addeq r2,r2,r4
	 moveq r4,#0
stop	B stop; stop program	 
		 
     ENDFUNC
     END
