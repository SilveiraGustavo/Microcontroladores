
_acender_leds:

;MyProject.c,6 :: 		void acender_leds(){
;MyProject.c,7 :: 		PORTD = 255;
	MOVLW       255
	MOVWF       PORTD+0 
;MyProject.c,8 :: 		}
L_end_acender_leds:
	RETURN      0
; end of _acender_leds

_apagar_leds:

;MyProject.c,9 :: 		void apagar_leds(){
;MyProject.c,10 :: 		PORTD = 0;
	CLRF        PORTD+0 
;MyProject.c,11 :: 		}
L_end_apagar_leds:
	RETURN      0
; end of _apagar_leds

_acender_quatro_primeiros:

;MyProject.c,12 :: 		void acender_quatro_primeiros(){
;MyProject.c,13 :: 		PORTD = 0b00001111;
	MOVLW       15
	MOVWF       PORTD+0 
;MyProject.c,14 :: 		}
L_end_acender_quatro_primeiros:
	RETURN      0
; end of _acender_quatro_primeiros

_main:

;MyProject.c,15 :: 		void main() {
;MyProject.c,16 :: 		TRISD = 0;
	CLRF        TRISD+0 
;MyProject.c,17 :: 		acender_leds();
	CALL        _acender_leds+0, 0
;MyProject.c,18 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;MyProject.c,19 :: 		apagar_leds();
	CALL        _apagar_leds+0, 0
;MyProject.c,20 :: 		delay_ms(3000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
	NOP
;MyProject.c,21 :: 		acender_quatro_primeiros();
	CALL        _acender_quatro_primeiros+0, 0
;MyProject.c,22 :: 		delay_ms(4000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
;MyProject.c,23 :: 		apagar_leds();
	CALL        _apagar_leds+0, 0
;MyProject.c,24 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
