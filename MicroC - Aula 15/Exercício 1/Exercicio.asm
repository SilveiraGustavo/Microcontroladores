
_main:

;Exercicio.c,10 :: 		void main() {
;Exercicio.c,11 :: 		TRISA = 0;     // configurando a portA como saída para utilizar o display 7
	CLRF        TRISA+0 
;Exercicio.c,12 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Exercicio.c,13 :: 		PORTD = 1;
	MOVLW       1
	MOVWF       PORTD+0 
;Exercicio.c,14 :: 		PORTA = 0b00000011;
	MOVLW       3
	MOVWF       PORTA+0 
;Exercicio.c,16 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
	NOP
;Exercicio.c,17 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
