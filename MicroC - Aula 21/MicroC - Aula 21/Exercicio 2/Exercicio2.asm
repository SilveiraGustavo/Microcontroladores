
_main:

;Exercicio2.c,19 :: 		void main() {
;Exercicio2.c,21 :: 		ADCON1 = 0b00001101;
	MOVLW       13
	MOVWF       ADCON1+0 
;Exercicio2.c,22 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Exercicio2.c,24 :: 		while(1){
L_main0:
;Exercicio2.c,25 :: 		POT2 = ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;Exercicio2.c,26 :: 		WordtoStr(POT2,texto);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Exercicio2.c,27 :: 		lcd_out(2,2, texto);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio2.c,29 :: 		}
	GOTO        L_main0
;Exercicio2.c,30 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
