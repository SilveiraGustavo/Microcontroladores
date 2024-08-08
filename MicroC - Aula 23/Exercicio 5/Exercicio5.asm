
_main:

;Exercicio5.c,16 :: 		void main() {
;Exercicio5.c,19 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Exercicio5.c,20 :: 		PORTC = 0b00100000;
	MOVLW       32
	MOVWF       PORTC+0 
;Exercicio5.c,21 :: 		ADCON1 = 0b11111100;
	MOVLW       252
	MOVWF       ADCON1+0 
;Exercicio5.c,22 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Exercicio5.c,24 :: 		while(1){
L_main0:
;Exercicio5.c,25 :: 		PORTC = 0b00100100;
	MOVLW       36
	MOVWF       PORTC+0 
;Exercicio5.c,26 :: 		}
	GOTO        L_main0
;Exercicio5.c,27 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
