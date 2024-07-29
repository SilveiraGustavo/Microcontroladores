
_main:

;Exercicio.c,19 :: 		void main() {
;Exercicio.c,20 :: 		int clicks = 0;
	CLRF        main_clicks_L0+0 
	CLRF        main_clicks_L0+1 
;Exercicio.c,21 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Exercicio.c,22 :: 		TRISA = 0;
	CLRF        TRISA+0 
;Exercicio.c,23 :: 		TRISB = 0b00100000;
	MOVLW       32
	MOVWF       TRISB+0 
;Exercicio.c,24 :: 		PORTA = 0b00111100;
	MOVLW       60
	MOVWF       PORTA+0 
;Exercicio.c,26 :: 		while (1) {
L_main0:
;Exercicio.c,28 :: 		if (Button(&PORTB, 5, 1, 0) == 255) {
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       5
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;Exercicio.c,30 :: 		while (Button(&PORTB, 5, 1, 0) == 255);
L_main3:
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       5
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
	GOTO        L_main3
L_main4:
;Exercicio.c,32 :: 		clicks++;
	INFSNZ      main_clicks_L0+0, 1 
	INCF        main_clicks_L0+1, 1 
;Exercicio.c,35 :: 		PORTD = Numeros[clicks - 1];
	MOVLW       1
	SUBWF       main_clicks_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      main_clicks_L0+1, 0 
	MOVWF       R1 
	MOVLW       _Numeros+0
	ADDWF       R0, 0 
	MOVWF       TBLPTR+0 
	MOVLW       hi_addr(_Numeros+0)
	ADDWFC      R1, 0 
	MOVWF       TBLPTR+1 
	MOVLW       higher_addr(_Numeros+0)
	MOVWF       TBLPTR+2 
	MOVLW       0
	BTFSC       R1, 7 
	MOVLW       255
	ADDWFC      TBLPTR+2, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTD+0
;Exercicio.c,36 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
;Exercicio.c,37 :: 		}
L_main2:
;Exercicio.c,38 :: 		}
	GOTO        L_main0
;Exercicio.c,40 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
