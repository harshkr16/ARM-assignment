     area     appcode, CODE, READONLY
	 export __main	 
     export __sine
	 export __cosine
		 
	 ENTRY 
__sine  function
   
LOOP1	VADD.F32 S1,S1,S2;S1=2,4,6....
		VMUL.F32 S7,S7,S1;S7=1*2
		VADD.F32 S1,S2;S1=3,5,7...
		VMUL.F32 S7,S7,S1;S7=1*2*3
		VMUL.F32 S0,S0,S6;CONST---S0=X^2
		VMUL.F32 S0,S0,S6;CONST---S0=X^3
		VDIV.F32 S5,S0,S7;S5=X^3/3!
		VNEG.F32 S5,S5;S5=-(X^3/3!)
		VADD.F32 S8,S8,S5;S8=X-(X^3/3!)
		ADD R0,R0,R5		
		B LOOP2
LOOP2	VADD.F32 S1,S2;S1=4,6....
		VMUL.F32 S7,S7,S1;S7=1*2*3*4
		VADD.F32 S1,S2;S1=5,7...
		VMUL.F32 S7,S7,S1;S7=1*2*3*4*5
		VMUL.F32 S0,S0,S6;CONST---S0=X^4
		VMUL.F32 S0,S0,S6;CONST---S0=X^5
		VDIV.F32 S5,S0,S7;S5=X^5/5!
		VADD.F32 S8,S8,S5;S8=X-(X^3/3!)+(X^5/5!)
		ADD R0,R0,R5
		CMP R0,R2
		BEQ stop
		B LOOP1
	ENDFUNC	

__cosine function

LOOP3	VADD.F32 S11,S11,S11;S11=1,...
		VMUL.F32 S17,S17,S11;S17=1*1
		VADD.F32 S11,S11,S11;S11=2...
		VMUL.F32 S17,S17,S11;S17=1*2
		VMUL.F32 S10,S10,S16;CONST---S10=X
		VMUL.F32 S10,S10,S16;CONST---S10=X^2
		VDIV.F32 S15,S10,S17;S15=X^2/2!
		VNEG.F32 S15,S15;S15=-(X^2/2!)
		VADD.F32 S18,S18,S15;S18=1-(X^2/2!)
		ADD R10,R10,R15
		B LOOP4
LOOP4	VADD.F32 S11,S11,S11;S11=3,...
		VMUL.F32 S17,S17,S11;S17=1*2*3
		VADD.F32 S11,S11,S11;S11=4...
		VMUL.F32 S17,S17,S11;S17=1*2*3*4
		VMUL.F32 S10,S10,S16;CONST---S10=X^3
		VMUL.F32 S10,S10,S16;CONST---S10=X^4
		VDIV.F32 S15,S10,S17;S15=X^4/4!
		VADD.F32 S18,S18,S15;S18=1-(X^2/2!)+(X^4/4!)
		ADD R10,R10,R15
		CMP R10,R12
		BEQ stop
		B LOOP3	
	ENDFUNC	
__drawspiral FUNCTION ; takes x(s20),y(s21),r(s22) as parameter
		VLDR.F32 S23,=1.0	
		VLDR.F32 S24,=0.0
		VLDR.F32 S25,=360.0

LOOP5   VLDR.F32 S0,=0
		VMOV.F32 S5,S0;TEMP_RESULT
		VMOV.F32 S8,S0
		VMOV.F32 S6,S0;CONST
		VLDR.F32 S1,=1
		VLDR.F32 S2,=1;CONST
		VLDR.F32 S7,=1
		BL __sine						
		VMUL.F32 S26,S8,S22					;S26=r*sin(ANGLE)
		VADD.F32 S27,S21,S26				;S27= centre(y) +r(sin (ANGLE))
		VLDR.F32 S10,=1
		VLDR.F32 S15,=1;TEMP_RESULT
		VLDR.F32 S18,=1;RESULT
		VLDR.F32 S16,=0;CONST
		VLDR.F32 S11,=0
		VLDR.F32 S12,=1
		VLDR.F32 S17,=1
		BL __cosine
		VADD.F32 S22,S14;increment the register
		VMUL.F32 S26,S8,S22					;S26=  r*cos(ANGLE)
		VADD.F32 S28,S20,S26				;S28= centre(x) + r(cos(ANGLE))
		VADD.F32 S0,S29
		VCMP.F32 S0,S30					;repeat untill angle reaches the value to 2*pi
		VMRS APSR_nzcv, FPSCR
		BNE LOOP5
		ENDFUNC
	
	
__main  FUNCTION
		
		LDR R5,=1
		LDR R0,=1;COUNTER
		LDR R2,=9
		LDR R15,=1
		LDR R10,=1;COUNTER
		LDR R12,=9
		VLDR.F32 S20,=1000;CENTRE(X)
		VLDR.F32 S21,=1000;CENTRE(Y)
		VLDR.F32 S22,=100;RADIUS(R)
		VLDR.F32 S29,=0.005;increment to angle
		VMOV.F32 S9,S29
		VLDR.F32 S30,=1256.63706143;counter
		VLDR.F32 S13,=1000
		VLDR.F32 S14,=5
		
		B __drawspiral
		B __sine
		B __cosine
		B stop
		

stop    B stop                              ; stop program

     ENDFUNC
	 END
		
