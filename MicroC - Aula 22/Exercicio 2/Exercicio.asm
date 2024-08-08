
_main:

;Exercicio.c,21 :: 		void main() {
;Exercicio.c,22 :: 		int porcentagem = (40 * 100) / 1023 ;
	MOVLW       3
	MOVWF       main_porcentagem_L0+0 
	MOVLW       0
	MOVWF       main_porcentagem_L0+1 
;Exercicio.c,25 :: 		ADCON1 = 0b00001100;
	MOVLW       12
	MOVWF       ADCON1+0 
;Exercicio.c,26 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Exercicio.c,28 :: 		while(1){
L_main0:
;Exercicio.c,30 :: 		POT2 = (ADC_Read(1) * 100) / 1023;
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       255
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       main_POT2_L0+0 
	MOVF        R1, 0 
	MOVWF       main_POT2_L0+1 
;Exercicio.c,31 :: 		WordtoStr(POT2, texto);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Exercicio.c,32 :: 		Lcd_Out(1, 1, "POT: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Exercicio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Exercicio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio.c,33 :: 		Lcd_Out(1, 6, texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio.c,34 :: 		Lcd_Out(1, 11, "%");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Exercicio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Exercicio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio.c,36 :: 		if(POT2 < porcentagem){
	MOVLW       128
	XORWF       main_POT2_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       main_porcentagem_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main4
	MOVF        main_porcentagem_L0+0, 0 
	SUBWF       main_POT2_L0+0, 0 
L__main4:
	BTFSC       STATUS+0, 0 
	GOTO        L_main2
;Exercicio.c,37 :: 		Lcd_Out(2,1, "APROVADO" );
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Exercicio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Exercicio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio.c,38 :: 		Lcd_Out(3,1, "Reprovado");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_Exercicio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_Exercicio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio.c,39 :: 		}
L_main2:
;Exercicio.c,41 :: 		}
	GOTO        L_main0
;Exercicio.c,42 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
