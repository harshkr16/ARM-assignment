     area     appcode, CODE, READONLY
     export __main
	 ENTRY 
__main  function
       VLDR.F32   s12, =10	; any constant whose logarithmic series to be calculated
       VMOV.F32   s1, s12
	   VLDR.F32   s2,= 2
       VSQRT.F32   s2,s2  
       VDIV.F32    s3,s1,s2
       VFMS.F32   s1,s3,s3 ;result 
	   VMOV.F32 s9, s12
	   VMOV.F32 s4, s12
	   VLDR.F32   s5,= 3 ; this is the constant which is to be incremented for the denominator 
	   VSQRT.F32 s6,s5 ; storing square root of s5 in s6
	   VLDR.F32 s11,=1
LOOP1  VDIV.F32 s7,s4,s6
	   VMUL.F32 s8,s7,s7 ; squaring the value of s7 
       VFMA.F32 s1,s9,s8 ; result to be accumulated in s1
	   VADD.F32 s5,s5,s11 ;incrementing value of s5 by 1
	   VSQRT.F32 s6,s5
	   VMUL.F32 s9,s9,s12
	   B LOOP2
LOOP2  VDIV.F32 s7,s4,s6
       VMUL.F32 s8,s7,s7 ; squaring the value of s7
	   VFMS.F32 s1,s9,s10 ;result to be accumulated in s1
	   VADD.F32 s5,s5,s11 ;incrementing value of s5 by
	   VSQRT.F32 s6,s5 ; storing square root of s5 in s6
	   VMUL.F32 s9,s9,s12
	   B LOOP1
     endfunc
     end
