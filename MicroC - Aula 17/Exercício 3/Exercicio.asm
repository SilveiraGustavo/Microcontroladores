
_main:

;Exercicio.c,7 :: 		void main() {
;Exercicio.c,9 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Exercicio.c,10 :: 		TRISB = 0;
	CLRF        TRISB+0 
;Exercicio.c,11 :: 		PORTD = 0;
	CLRF        PORTD+0 
;Exercicio.c,12 :: 		PORTB = 0;
	CLRF        PORTB+0 
;Exercicio.c,14 :: 		while(1){
L_main0:
;Exercicio.c,15 :: 		for (i = 0; i < 8; i++){
	CLRF        R2 
	CLRF        R3 
L_main2:
	MOVLW       128
	XORWF       R3, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main7
	MOVLW       8
	SUBWF       R2, 0 
L__main7:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;Exercicio.c,16 :: 		PORTD |= 1 << i;
	MOVF        R2, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__main8:
	BZ          L__main9
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__main8
L__main9:
	MOVF        R0, 0 
	IORWF       PORTD+0, 1 
;Exercicio.c,17 :: 		PORTB |= 1 << (7 - i);
	MOVF        R2, 0 
	SUBLW       7
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__main10:
	BZ          L__main11
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__main10
L__main11:
	MOVF        R0, 0 
	IORWF       PORTB+0, 1 
;Exercicio.c,18 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
;Exercicio.c,15 :: 		for (i = 0; i < 8; i++){
	INFSNZ      R2, 1 
	INCF        R3, 1 
;Exercicio.c,19 :: 		}
	GOTO        L_main2
L_main3:
;Exercicio.c,20 :: 		}
	GOTO        L_main0
;Exercicio.c,21 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
