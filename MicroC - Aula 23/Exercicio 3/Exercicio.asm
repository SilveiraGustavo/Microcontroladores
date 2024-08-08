
_main:

;Exercicio.c,18 :: 		void main() {
;Exercicio.c,21 :: 		ADCON1 = 0b00001100;
	MOVLW       12
	MOVWF       ADCON1+0 
;Exercicio.c,22 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Exercicio.c,24 :: 		while(1){
L_main0:
;Exercicio.c,25 :: 		sensor = ADC_Read(2) / 2;
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	RRCF        FARG_WordToStr_input+1, 1 
	RRCF        FARG_WordToStr_input+0, 1 
	BCF         FARG_WordToStr_input+1, 7 
;Exercicio.c,26 :: 		WordtoStr(sensor,texto);
	MOVLW       main_texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Exercicio.c,27 :: 		Lcd_out(1,1, "Sensor :");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Exercicio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Exercicio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio.c,28 :: 		Lcd_out(1,8,texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio.c,29 :: 		}
	GOTO        L_main0
;Exercicio.c,30 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
