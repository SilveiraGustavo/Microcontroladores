
_main:

;Exercicio1.c,22 :: 		void main() {
;Exercicio1.c,25 :: 		ADCON1 = 0b00001110;
	MOVLW       14
	MOVWF       ADCON1+0 
;Exercicio1.c,26 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Exercicio1.c,27 :: 		Pwm1_init(5000);
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;Exercicio1.c,28 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;Exercicio1.c,30 :: 		while(1){
L_main0:
;Exercicio1.c,31 :: 		POT1 = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       main_POT1_L0+0 
	MOVF        R1, 0 
	MOVWF       main_POT1_L0+1 
;Exercicio1.c,32 :: 		PWM1_Set_Duty(POT1);
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Exercicio1.c,33 :: 		WordtoStr(POT1, texto);
	MOVF        main_POT1_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        main_POT1_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Exercicio1.c,34 :: 		Lcd_out(1,1,"Potênciometro" );
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Exercicio1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Exercicio1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio1.c,35 :: 		Lcd_out(2,1,texto);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio1.c,38 :: 		}
	GOTO        L_main0
;Exercicio1.c,39 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
