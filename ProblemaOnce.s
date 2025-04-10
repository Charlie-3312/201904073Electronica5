        AREA    EJERCICIO11, CODE, READONLY, ALIGN=2
        THUMB
        EXPORT  Start

Start
        ; Constantes a ingresar
        VLDR.F32 S0, =8        ; f_1 (mm)
        VLDR.F32 S1, =40       ; f_2 (mm)
        VLDR.F32 S2, =200      ; d (mm)
        VLDR.F32 S3, =250      ; -250(mm)
        
        ; ecuacuoin de los lentas desepejada
        VLDR.F32 S4, =1        ; Constante 1
        VNEG.F32 S5, S3        ; - signo neg de imagen virtual -250
        ;Hallando P_2
        VMUL.F32 S6, S5, S1    ; 40*-250
        VSUB.F32 S7, S5, s1    ; -250-40
        VDIV.F32 S8, S6, S7    ; P_2 = 34.4827
        
        ; Hallando q_1
        VSUB.F32 S9, S2, S8  ; q_1  debe dar aprox 165.5173mm
        
        ; Hallando p_1
		VMUL.F32 S10, S0, S9    ; 8*165.5173
        VSUB.F32 S11, S9, s0    ; 165.5173-8
        VDIV.F32 S12, S10, S11    ; P_1 QUE ES LA RESPUESTA 1 = 8.4073 aprox ******************* S12
				 
        ; Cálculo de la amplificación total que es u_1 * u_2
        VDIV.F32 S13, S9, S12 ; division de u_1
		VNEG.F32 S14, S13 ; se le saca el negativo - u_1
		
		VDIV.F32 S15, S5, S8 ; division de u_2
		VNEG.F32 S16, S15 ; se le saca el negativo - u_2
        
        ; Amplificación TOTAL
		
		VMUL.F32 s17, s14, s16 ; u_total que es RESPUESTA 2 ******************* S17
		
		;Respuestas aisladas
		VMOV.F32 s25, s12 ; R1 = Distancia entre el Objeto y objectivo
		VMOV.F32 s27, s17 ; R2 = Amplificación Total
		
		
        
Loop
        B       Loop
        
        ALIGN
        END