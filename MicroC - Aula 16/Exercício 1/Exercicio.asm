
_main:

;Exercicio.c,6 :: 		void main() {
;Exercicio.c,7 :: 		int mask = 0b00000000;  // Máscara inicial para o bit mais significativo
	CLRF        main_mask_L0+0 
	CLRF        main_mask_L0+1 
;Exercicio.c,9 :: 		TRISD = 0;   // Configura a porta D como saída
	CLRF        TRISD+0 
;Exercicio.c,11 :: 		while(1) {
L_main0:
;Exercicio.c,13 :: 		for ( i = 0; i < 8; i++) {
	CLRF        R1 
	CLRF        R2 
L_main2:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main7
	MOVLW       8
	SUBWF       R1, 0 
L__main7:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;Exercicio.c,14 :: 		PORTD = mask;   // Atribui a máscara à porta D
	MOVF        main_mask_L0+0, 0 
	MOVWF       PORTD+0 
;Exercicio.c,15 :: 		delay_ms(500); // Atraso de meio segundo
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	NOP
;Exercicio.c,16 :: 		mask >>= 1;     // Desloca a máscara um bit para a direita
	RRCF        main_mask_L0+1, 1 
	RRCF        main_mask_L0+0, 1 
	BCF         main_mask_L0+1, 7 
	BTFSC       main_mask_L0+1, 6 
	BSF         main_mask_L0+1, 7 
;Exercicio.c,13 :: 		for ( i = 0; i < 8; i++) {
	INFSNZ      R1, 1 
	INCF        R2, 1 
;Exercicio.c,17 :: 		}
	GOTO        L_main2
L_main3:
;Exercicio.c,20 :: 		mask = 0b00000000;
	CLRF        main_mask_L0+0 
	CLRF        main_mask_L0+1 
;Exercicio.c,21 :: 		}
	GOTO        L_main0
;Exercicio.c,22 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
