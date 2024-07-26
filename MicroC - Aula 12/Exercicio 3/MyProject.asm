
_main:

;MyProject.c,4 :: 		void main() {
;MyProject.c,5 :: 		TRISD = 0;
	CLRF        TRISD+0 
;MyProject.c,6 :: 		PORTD = 0b11110000;
	MOVLW       240
	MOVWF       PORTD+0 
;MyProject.c,7 :: 		DELAY_MS(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;MyProject.c,8 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
