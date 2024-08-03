
_main:

;Exercicio5.c,16 :: 		void main() {
;Exercicio5.c,20 :: 		ADCON1 = 0b00001100;
	MOVLW       12
	MOVWF       ADCON1+0 
;Exercicio5.c,21 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Exercicio5.c,23 :: 		while(1){
L_main0:
;Exercicio5.c,24 :: 		POT1 = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       main_POT1_L0+0 
	MOVF        R1, 0 
	MOVWF       main_POT1_L0+1 
;Exercicio5.c,25 :: 		POT2 = ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       main_POT2_L0+0 
	MOVF        R1, 0 
	MOVWF       main_POT2_L0+1 
;Exercicio5.c,27 :: 		WordtoStr(POT1, texto);
	MOVF        main_POT1_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        main_POT1_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Exercicio5.c,28 :: 		lcd_out(1,1,texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio5.c,30 :: 		WordtoStr(POT2, texto);
	MOVF        main_POT2_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        main_POT2_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Exercicio5.c,31 :: 		lcd_out(2,2,texto);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio5.c,32 :: 		}
	GOTO        L_main0
;Exercicio5.c,33 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
