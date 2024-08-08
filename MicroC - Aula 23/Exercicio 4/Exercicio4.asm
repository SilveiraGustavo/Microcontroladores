
_main:

;Exercicio4.c,17 :: 		void main() {
;Exercicio4.c,20 :: 		TRISC = 0b11011111;
	MOVLW       223
	MOVWF       TRISC+0 
;Exercicio4.c,21 :: 		ADCON1 = 0b11111100;
	MOVLW       252
	MOVWF       ADCON1+0 
;Exercicio4.c,23 :: 		while(1){
L_main0:
;Exercicio4.c,24 :: 		PORTC = 255;
	MOVLW       255
	MOVWF       PORTC+0 
;Exercicio4.c,25 :: 		aux = ADC_Read(2);
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;Exercicio4.c,26 :: 		WordtoStr(aux, texto);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Exercicio4.c,27 :: 		Lcd_out(1,1,texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio4.c,28 :: 		}
	GOTO        L_main0
;Exercicio4.c,29 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
