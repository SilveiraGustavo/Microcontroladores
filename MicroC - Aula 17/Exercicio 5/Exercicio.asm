
_main:

;Exercicio.c,5 :: 		void main() {
;Exercicio.c,6 :: 		int element =  0b01111111; // 8
	MOVLW       127
	MOVWF       main_element_L0+0 
	MOVLW       0
	MOVWF       main_element_L0+1 
;Exercicio.c,8 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Exercicio.c,9 :: 		TRISA = 0;
	CLRF        TRISA+0 
;Exercicio.c,10 :: 		TRISB = 0b00100000;
	MOVLW       32
	MOVWF       TRISB+0 
;Exercicio.c,11 :: 		PORTA = 0b00111100;
	MOVLW       60
	MOVWF       PORTA+0 
;Exercicio.c,14 :: 		while(1){
L_main0:
;Exercicio.c,15 :: 		if(Button(&PORTB, 5,1,0) == 255){
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
;Exercicio.c,16 :: 		PORTD = element;
	MOVF        main_element_L0+0, 0 
	MOVWF       PORTD+0 
;Exercicio.c,17 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;Exercicio.c,18 :: 		}
L_main2:
;Exercicio.c,19 :: 		}
	GOTO        L_main0
;Exercicio.c,21 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
