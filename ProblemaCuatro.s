	AREA codigo, CODE, READONLY, ALIGN=2
	THUMB
	EXPORT Start

Start
	VLDR.F32 S0, =0    
	VLDR.F32 S2, =10	; Cant números a promediar
	VLDR.F32 S3, =0	   
	; Ingresar valor de los 10 dígitos en este caso
	VLDR.F32 S4,  =0000
	VLDR.F32 S5,  =3312
	VLDR.F32 S6,  =2301
	VLDR.F32 S7,  =2222
	VLDR.F32 S8,  =1111
	VLDR.F32 S9,  =2223
	VLDR.F32 S10, =3333
	VLDR.F32 S11, =4444
	VLDR.F32 S12, =7777
	VLDR.F32 S13, =99999
	;Finaliza ingreso de datos
	VADD.F32 S0, S0, S4
	VADD.F32 S0, S0, S5
	VADD.F32 S0, S0, S6
	VADD.F32 S0, S0, S7
	VADD.F32 S0, S0, S8
	VADD.F32 S0, S0, S9
	VADD.F32 S0, S0, S10
	VADD.F32 S0, S0, S11
	VADD.F32 S0, S0, S12
	VADD.F32 S0, S0, S13

	VMOV.F32 S14, S0 ; Respuesta de suma en S14

	VDIV.F32 S15, S0, S2 ; Respuesta de promedio en S15	

Loop
	B Loop  

	ALIGN
	END