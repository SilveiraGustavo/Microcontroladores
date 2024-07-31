
_main:

;Exercicio.c,8 :: 		void main() {
;Exercicio.c,9 :: 		int state = 0; // Variável para controlar qual porta está acesa
	CLRF        main_state_L0+0 
	CLRF        main_state_L0+1 
;Exercicio.c,10 :: 		TRISD = 0;    // Configura a porta D como saída
	CLRF        TRISD+0 
;Exercicio.c,11 :: 		TRISB = 0;    // Configura a porta B como saída
	CLRF        TRISB+0 
;Exercicio.c,13 :: 		while (1) {
L_main0:
;Exercicio.c,14 :: 		if (state == 0) {
	MOVLW       0
	XORWF       main_state_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main6
	MOVLW       0
	XORWF       main_state_L0+0, 0 
L__main6:
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;Exercicio.c,16 :: 		PORTD = 255;
	MOVLW       255
	MOVWF       PORTD+0 
;Exercicio.c,17 :: 		PORTB = 0;
	CLRF        PORTB+0 
;Exercicio.c,18 :: 		state = 1; // Altera o estado para o próximo ciclo
	MOVLW       1
	MOVWF       main_state_L0+0 
	MOVLW       0
	MOVWF       main_state_L0+1 
;Exercicio.c,19 :: 		} else {
	GOTO        L_main3
L_main2:
;Exercicio.c,21 :: 		PORTD = 0;
	CLRF        PORTD+0 
;Exercicio.c,22 :: 		PORTB = 255;
	MOVLW       255
	MOVWF       PORTB+0 
;Exercicio.c,23 :: 		state = 0; // Altera o estado para o próximo ciclo
	CLRF        main_state_L0+0 
	CLRF        main_state_L0+1 
;Exercicio.c,24 :: 		}
L_main3:
;Exercicio.c,26 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
	NOP
;Exercicio.c,27 :: 		}
	GOTO        L_main0
;Exercicio.c,28 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
