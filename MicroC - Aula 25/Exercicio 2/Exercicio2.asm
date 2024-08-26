
_main:

;Exercicio2.c,24 :: 		void main() {
;Exercicio2.c,27 :: 		ADCON1 = 0b00001110;
	MOVLW       14
	MOVWF       ADCON1+0 
;Exercicio2.c,28 :: 		PWM1_Init(5000);
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;Exercicio2.c,29 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Exercicio2.c,30 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;Exercicio2.c,32 :: 		while(1){
L_main0:
;Exercicio2.c,33 :: 		POT1 = ADC_Read(0) / 10.23;
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       20
	MOVWF       R4 
	MOVLW       174
	MOVWF       R5 
	MOVLW       35
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       main_POT1_L0+0 
	MOVF        R1, 0 
	MOVWF       main_POT1_L0+1 
;Exercicio2.c,34 :: 		PWM1_Set_Duty(POT1 * 2.55);
	CALL        _int2double+0, 0
	MOVLW       51
	MOVWF       R4 
	MOVLW       51
	MOVWF       R5 
	MOVLW       35
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Exercicio2.c,35 :: 		WordtoStr(POT1, texto);
	MOVF        main_POT1_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        main_POT1_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Exercicio2.c,36 :: 		Lcd_out(1,1,"Potênciometro" );
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Exercicio2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Exercicio2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio2.c,37 :: 		Lcd_out(2,1,texto);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio2.c,39 :: 		}
	GOTO        L_main0
;Exercicio2.c,40 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
