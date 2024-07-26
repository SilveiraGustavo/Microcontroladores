
_main:

;MyProject.c,5 :: 		void main() {
;MyProject.c,6 :: 		TRISD = 0;   //Configurando a porta D como saída
	CLRF        TRISD+0 
;MyProject.c,7 :: 		while(1){
L_main0:
;MyProject.c,8 :: 		PORTD = 255;
	MOVLW       255
	MOVWF       PORTD+0 
;MyProject.c,9 :: 		delay_ms(2000);
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
;MyProject.c,10 :: 		PORTD = 0;
	CLRF        PORTD+0 
;MyProject.c,11 :: 		delaY_ms(2000);
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
;MyProject.c,12 :: 		}
	GOTO        L_main0
;MyProject.c,13 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
