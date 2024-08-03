
_main:

;Exercicio.c,25 :: 		void main() {
;Exercicio.c,27 :: 		ADCON1 = 0b00001110;
	MOVLW       14
	MOVWF       ADCON1+0 
;Exercicio.c,28 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Exercicio.c,30 :: 		while(1){
L_main0:
;Exercicio.c,31 :: 		POT1 = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;Exercicio.c,32 :: 		WordToStr(POT1,texto);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Exercicio.c,33 :: 		Lcd_out(1,1,texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio.c,34 :: 		}
	GOTO        L_main0
;Exercicio.c,37 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
