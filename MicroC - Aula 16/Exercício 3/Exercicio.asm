
_main:

;Exercicio.c,8 :: 		void main() {
;Exercicio.c,10 :: 		int aux = 0b10000000;
	MOVLW       128
	MOVWF       main_aux_L0+0 
	MOVLW       0
	MOVWF       main_aux_L0+1 
;Exercicio.c,11 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Exercicio.c,13 :: 		while(1){
L_main0:
;Exercicio.c,14 :: 		for(i = 0; i < 8; i++){
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
;Exercicio.c,15 :: 		PORTD = aux;
	MOVF        main_aux_L0+0, 0 
	MOVWF       PORTD+0 
;Exercicio.c,16 :: 		delay_ms(500);
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
;Exercicio.c,17 :: 		aux >>= 1;
	RRCF        main_aux_L0+1, 1 
	RRCF        main_aux_L0+0, 1 
	BCF         main_aux_L0+1, 7 
	BTFSC       main_aux_L0+1, 6 
	BSF         main_aux_L0+1, 7 
;Exercicio.c,14 :: 		for(i = 0; i < 8; i++){
	INFSNZ      R1, 1 
	INCF        R2, 1 
;Exercicio.c,18 :: 		}
	GOTO        L_main2
L_main3:
;Exercicio.c,19 :: 		aux = 0b10000000;
	MOVLW       128
	MOVWF       main_aux_L0+0 
	MOVLW       0
	MOVWF       main_aux_L0+1 
;Exercicio.c,20 :: 		}
	GOTO        L_main0
;Exercicio.c,21 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
