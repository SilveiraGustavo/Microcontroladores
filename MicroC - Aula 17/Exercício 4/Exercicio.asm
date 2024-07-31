
_main:

;Exercicio.c,1 :: 		void main(){
;Exercicio.c,2 :: 		TRISB = 0b00100000;
	MOVLW       32
	MOVWF       TRISB+0 
;Exercicio.c,3 :: 		TRISA = 0;
	CLRF        TRISA+0 
;Exercicio.c,4 :: 		PORTA = 0b00111100;
	MOVLW       60
	MOVWF       PORTA+0 
;Exercicio.c,6 :: 		while(1){
L_main0:
;Exercicio.c,8 :: 		if(Button(&PORTB, 5,1,0) == 255){
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
;Exercicio.c,9 :: 		PORTA = 0b01111111;
	MOVLW       127
	MOVWF       PORTA+0 
;Exercicio.c,10 :: 		delay_ms(1000);
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
;Exercicio.c,11 :: 		}
L_main2:
;Exercicio.c,12 :: 		}
	GOTO        L_main0
;Exercicio.c,13 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
