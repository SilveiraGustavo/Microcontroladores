
_main:

;Exercicio3.c,4 :: 		void main() {
;Exercicio3.c,5 :: 		TRISB = 0b00100000;
	MOVLW       32
	MOVWF       TRISB+0 
;Exercicio3.c,6 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Exercicio3.c,8 :: 		while(1){
L_main0:
;Exercicio3.c,9 :: 		if(Button(&PORTB, 5,1,0) == 255) {
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
;Exercicio3.c,10 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;Exercicio3.c,11 :: 		}
L_main2:
;Exercicio3.c,12 :: 		}
	GOTO        L_main0
;Exercicio3.c,14 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
