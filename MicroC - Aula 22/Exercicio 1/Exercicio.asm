
_main:

;Exercicio.c,17 :: 		void main() {
;Exercicio.c,18 :: 		int POT1, POT2, aux = 0;
;Exercicio.c,20 :: 		int soma_realizada = 0;
	CLRF        main_soma_realizada_L0+0 
	CLRF        main_soma_realizada_L0+1 
;Exercicio.c,21 :: 		ADCON1 = 0b00001100;
	MOVLW       12
	MOVWF       ADCON1+0 
;Exercicio.c,22 :: 		TRISB = 0b00000111;
	MOVLW       7
	MOVWF       TRISB+0 
;Exercicio.c,23 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Exercicio.c,24 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Exercicio.c,25 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Exercicio.c,27 :: 		while(1) {
L_main0:
;Exercicio.c,29 :: 		if (Button(&PORTB, 0, 1, 0) == 255) {
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;Exercicio.c,30 :: 		if(soma_realizada == 0){
	MOVLW       0
	XORWF       main_soma_realizada_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main12
	MOVLW       0
	XORWF       main_soma_realizada_L0+0, 0 
L__main12:
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;Exercicio.c,31 :: 		POT1 = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       main_POT1_L0+0 
	MOVF        R1, 0 
	MOVWF       main_POT1_L0+1 
;Exercicio.c,32 :: 		WordToStr(POT1, texto);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Exercicio.c,33 :: 		Lcd_Out(1, 1, "POT1:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Exercicio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Exercicio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio.c,34 :: 		Lcd_Out(1, 7, texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio.c,35 :: 		soma_realizada = 1;
	MOVLW       1
	MOVWF       main_soma_realizada_L0+0 
	MOVLW       0
	MOVWF       main_soma_realizada_L0+1 
;Exercicio.c,36 :: 		}
L_main3:
;Exercicio.c,37 :: 		}
L_main2:
;Exercicio.c,39 :: 		if (Button(&PORTB, 1, 1, 0) == 255) {
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;Exercicio.c,40 :: 		if(soma_realizada == 1){
	MOVLW       0
	XORWF       main_soma_realizada_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main13
	MOVLW       1
	XORWF       main_soma_realizada_L0+0, 0 
L__main13:
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;Exercicio.c,41 :: 		POT2 = ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       main_POT2_L0+0 
	MOVF        R1, 0 
	MOVWF       main_POT2_L0+1 
;Exercicio.c,42 :: 		WordToStr(POT2, texto);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Exercicio.c,43 :: 		Lcd_Out(2, 1, "POT2:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Exercicio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Exercicio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio.c,44 :: 		Lcd_Out(2, 7, texto);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio.c,45 :: 		soma_realizada = 0;
	CLRF        main_soma_realizada_L0+0 
	CLRF        main_soma_realizada_L0+1 
;Exercicio.c,46 :: 		}
L_main5:
;Exercicio.c,47 :: 		}
L_main4:
;Exercicio.c,50 :: 		if (Button(&PORTB, 2, 1, 0) == 255 && !soma_realizada) {
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       2
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
	MOVF        main_soma_realizada_L0+0, 0 
	IORWF       main_soma_realizada_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
L__main10:
;Exercicio.c,51 :: 		aux = POT1 + POT2;
	MOVF        main_POT2_L0+0, 0 
	ADDWF       main_POT1_L0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        main_POT2_L0+1, 0 
	ADDWFC      main_POT1_L0+1, 0 
	MOVWF       FARG_WordToStr_input+1 
;Exercicio.c,52 :: 		WordToStr(aux, texto);
	MOVLW       main_texto_L0+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;Exercicio.c,53 :: 		Lcd_Out(2, 1, "SOMA:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Exercicio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Exercicio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio.c,54 :: 		Lcd_Out(2, 7, texto);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio.c,55 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
;Exercicio.c,56 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Exercicio.c,58 :: 		}
L_main8:
;Exercicio.c,61 :: 		}
	GOTO        L_main0
;Exercicio.c,62 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
