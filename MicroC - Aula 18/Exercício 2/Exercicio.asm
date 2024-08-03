
_main:

;Exercicio.c,5 :: 		void main() {
;Exercicio.c,7 :: 		int aux = 0b00000000;
;Exercicio.c,8 :: 		TRISB = 0b00100000;
	MOVLW       32
	MOVWF       TRISB+0 
;Exercicio.c,9 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Exercicio.c,10 :: 		PORTD = 0;
	CLRF        PORTD+0 
;Exercicio.c,11 :: 		PORTA = 0;
	CLRF        PORTA+0 
;Exercicio.c,12 :: 		TRISA = 0b00111100;
	MOVLW       60
	MOVWF       TRISA+0 
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
;Exercicio.c,16 :: 		for (i = 0; i < 8; i += 2) {  // LEDs pares: 0, 2, 4, 6
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
L_main3:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main8
	MOVLW       8
	SUBWF       main_i_L0+0, 0 
L__main8:
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;Exercicio.c,17 :: 		PORTD |= (1 << i);  // Acende o LED par
	MOVF        main_i_L0+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__main9:
	BZ          L__main10
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__main9
L__main10:
	MOVF        R0, 0 
	IORWF       PORTD+0, 1 
;Exercicio.c,18 :: 		delay_ms(500);  // Atraso de meio segundo
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;Exercicio.c,16 :: 		for (i = 0; i < 8; i += 2) {  // LEDs pares: 0, 2, 4, 6
	MOVLW       2
	ADDWF       main_i_L0+0, 1 
	MOVLW       0
	ADDWFC      main_i_L0+1, 1 
;Exercicio.c,19 :: 		}
	GOTO        L_main3
L_main4:
;Exercicio.c,20 :: 		}
L_main2:
;Exercicio.c,21 :: 		}
	GOTO        L_main0
;Exercicio.c,22 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
