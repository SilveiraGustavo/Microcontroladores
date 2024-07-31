
_main:

;Exercicio.c,6 :: 		void main() {
;Exercicio.c,8 :: 		TRISD = 0; // Configura a porta D como saída para o conjunto 1 (LED1)
	CLRF        TRISD+0 
;Exercicio.c,9 :: 		TRISB = 0; // Configura a porta B como saída para o conjunto 2 (LED2)
	CLRF        TRISB+0 
;Exercicio.c,10 :: 		PORTD = 0; // Inicializa todos os LEDs do conjunto 1 apagados
	CLRF        PORTD+0 
;Exercicio.c,11 :: 		PORTB = 0; // Inicializa todos os LEDs do conjunto 2 apagados
	CLRF        PORTB+0 
;Exercicio.c,14 :: 		for (i = 0; i < 8; i++){
	CLRF        R2 
	CLRF        R3 
L_main2:
	MOVLW       128
	XORWF       R3, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main14
	MOVLW       8
	SUBWF       R2, 0 
L__main14:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;Exercicio.c,15 :: 		PORTD |= 1 << i;
	MOVF        R2, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__main15:
	BZ          L__main16
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__main15
L__main16:
	MOVF        R0, 0 
	IORWF       PORTD+0, 1 
;Exercicio.c,16 :: 		delay_ms(100);
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
;Exercicio.c,14 :: 		for (i = 0; i < 8; i++){
	INFSNZ      R2, 1 
	INCF        R3, 1 
;Exercicio.c,17 :: 		}
	GOTO        L_main2
L_main3:
;Exercicio.c,18 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
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
;Exercicio.c,20 :: 		for(i = 8; i >= 0; i--){
	MOVLW       8
	MOVWF       R2 
	MOVLW       0
	MOVWF       R3 
L_main7:
	MOVLW       128
	XORWF       R3, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main17
	MOVLW       0
	SUBWF       R2, 0 
L__main17:
	BTFSS       STATUS+0, 0 
	GOTO        L_main8
;Exercicio.c,21 :: 		PORTB |= 1 << i;
	MOVF        R2, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__main18:
	BZ          L__main19
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__main18
L__main19:
	MOVF        R0, 0 
	IORWF       PORTB+0, 1 
;Exercicio.c,22 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
;Exercicio.c,20 :: 		for(i = 8; i >= 0; i--){
	MOVLW       1
	SUBWF       R2, 1 
	MOVLW       0
	SUBWFB      R3, 1 
;Exercicio.c,23 :: 		}
	GOTO        L_main7
L_main8:
;Exercicio.c,25 :: 		while(1);
L_main11:
	GOTO        L_main11
;Exercicio.c,27 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
