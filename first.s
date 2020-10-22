     area     appcode, CODE, READONLY
     export __main
	 ENTRY 
__main  function
       VLDR.F32   s12, =10	
       VMOV.F32   s1, s12
	   VLDR.F32   s2,= 2
       VSQRT.F32   s2,s2  
       VDIV.F32    s3,s1,s2
       VFMS.F32   s1,s3,s3
	   VMOV.F32 s9, s12
	   VMOV.F32 s4, s12
	   VLDR.F32   s5,= 3
	   VSQRT.F32 s6,s5
	   VLDR.F32 s11,=1
LOOP1  VDIV.F32 s7,s4,s6
	   VMUL.F32 s8,s7,s7
       VFMA.F32 s1,s9,s8
	   VADD.F32 s5,s5,s11
	   VSQRT.F32 s6,s5
	   VMUL.F32 s9,s9,s12
	   BX LOOP2
LOOP2  VDIV.F32 s7,s4,s6
       VMUL.F32 s8,s7,s7
	   VFMS.F32 s1,s9,s10
	   VADD.F32 s5,s5,s11
	   VSQRT.F32 s6,s5
	   VMUL.F32 s9,s9,s12
	   BX LOOP1
     endfunc
     end
