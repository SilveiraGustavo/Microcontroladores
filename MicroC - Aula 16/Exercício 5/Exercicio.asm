
_main:

;Exercicio.c,6 :: 		void main() {
;Exercicio.c,7 :: 		int aux = 0;                    // Variável para contar o número de pressões do botão
	CLRF        main_aux_L0+0 
	CLRF        main_aux_L0+1 
	CLRF        main_end_L0+0 
;Exercicio.c,9 :: 		TRISD = 0;                      // Configura a porta D como saída
	CLRF        TRISD+0 
;Exercicio.c,10 :: 		TRISB = 0b00100000;             // Configura o pino RB5 como entrada
	MOVLW       32
	MOVWF       TRISB+0 
;Exercicio.c,11 :: 		PORTD = 0b00000000;             // Inicializa todos os LEDs apagados
	CLRF        PORTD+0 
;Exercicio.c,12 :: 		while (1) {
L_main0:
;Exercicio.c,14 :: 		if (Button(&PORTB, 5, 1, 0) == 255) {
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       5
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;Exercicio.c,19 :: 		aux++;
	INFSNZ      main_aux_L0+0, 1 
	INCF        main_aux_L0+1, 1 
;Exercicio.c,22 :: 		if (aux > 8) {
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_aux_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main6
	MOVF        main_aux_L0+0, 0 
	SUBLW       8
L__main6:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;Exercicio.c,23 :: 		aux = 8;
	MOVLW       8
	MOVWF       main_aux_L0+0 
	MOVLW       0
	MOVWF       main_aux_L0+1 
;Exercicio.c,24 :: 		}
L_main3:
;Exercicio.c,25 :: 		end |= (1 << (aux - 1)); // Acende o LED correspondente
	DECF        main_aux_L0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__main7:
	BZ          L__main8
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__main7
L__main8:
	MOVF        main_end_L0+0, 0 
	IORWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       main_end_L0+0 
;Exercicio.c,28 :: 		PORTD = end;
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;Exercicio.c,29 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
;Exercicio.c,30 :: 		}
L_main2:
;Exercicio.c,31 :: 		}
	GOTO        L_main0
;Exercicio.c,32 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
