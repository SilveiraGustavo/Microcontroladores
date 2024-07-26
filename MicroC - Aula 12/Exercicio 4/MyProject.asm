
_main:

;MyProject.c,4 :: 		void main() {
;MyProject.c,5 :: 		TRISD = 0;
	CLRF        TRISD+0 
;MyProject.c,6 :: 		PORTD = 255;
	MOVLW       255
	MOVWF       PORTD+0 
;MyProject.c,7 :: 		delay_ms(1000);
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
;MyProject.c,8 :: 		PORTD = 0;
	CLRF        PORTD+0 
;MyProject.c,9 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
