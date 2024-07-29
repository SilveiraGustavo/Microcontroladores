
_main:

;Exercicio.c,5 :: 		void main() {
;Exercicio.c,7 :: 		TRISB = 0;   // Configura a porta B como saída
	CLRF        TRISB+0 
;Exercicio.c,9 :: 		while(1){
L_main0:
;Exercicio.c,11 :: 		PORTB = 0b00001111;
	MOVLW       15
	MOVWF       PORTB+0 
;Exercicio.c,12 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;Exercicio.c,13 :: 		PORTB = 0b11110000;
	MOVLW       240
	MOVWF       PORTB+0 
;Exercicio.c,14 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;Exercicio.c,15 :: 		}
	GOTO        L_main0
;Exercicio.c,26 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
