
     area     appcode, CODE, READONLY
     export __main
	 ENTRY 

__main  function
       VLDR.F32 S0,=20
	   LDR R5,=0;COUNTER
	   LDR R6,=1
	   LDR R7,=25
	   
	   VMOV.F32 S5,S0
	   VMOV.F32 S6,S0;CONST X
	   VLDR.F32 S1,=1
	   VMOV.F32 S2,S1
LOOP1	VADD.F32 S2,S2,S1;S2=2,4....
		VMUL.F32 S0,S0,S6;S0=X^2
		VDIV.F32 S3,S0,S2;S3=X^2/2
		VNEG.F32 S3,S3;S3=-(X^2)/2
		VADD.F32 S5,S5,S3;S5=X-(X^2)/2
		ADD R5,R5,R6
		CMP R5,R7
		BGE STOP
LOOP2	VMUL.F32 S0,S0,S6;S0=X^3
		VADD.F32 S2,S2,S1;S2=3,5...
		VDIV.F32 S3,S0,S2;S3=X^3/3
		VADD.F32 S5,S5,S3;S5=X-(X^2)/2+(X^3)/3
		ADD R5,R5,R6
		CMP R5,R7
		BGE STOP
		B LOOP1
STOP 	B STOP		
	   

     endfunc
     end
