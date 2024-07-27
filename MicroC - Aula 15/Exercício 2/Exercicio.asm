
_cria_Lista:

;Exercicio.c,6 :: 		int* cria_Lista() {
;Exercicio.c,19 :: 		return lista;
	MOVLW       cria_Lista_lista_L0+0
	MOVWF       R0 
	MOVLW       hi_addr(cria_Lista_lista_L0+0)
	MOVWF       R1 
;Exercicio.c,20 :: 		}
L_end_cria_Lista:
	RETURN      0
; end of _cria_Lista

_main:

;Exercicio.c,22 :: 		void main() {
;Exercicio.c,23 :: 		int i = 0;
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
;Exercicio.c,24 :: 		int* lista = cria_Lista();  // Obtenha o ponteiro para a lista
	CALL        _cria_Lista+0, 0
	MOVF        R0, 0 
	MOVWF       main_lista_L0+0 
	MOVF        R1, 0 
	MOVWF       main_lista_L0+1 
;Exercicio.c,25 :: 		TRISD = 0;   // Configura a porta D como saída
	CLRF        TRISD+0 
;Exercicio.c,26 :: 		TRISA = 0;   // Configura a porta A como saída
	CLRF        TRISA+0 
;Exercicio.c,27 :: 		PORTA = 0b00111100;
	MOVLW       60
	MOVWF       PORTA+0 
;Exercicio.c,30 :: 		while(1) {
L_main0:
;Exercicio.c,31 :: 		for (i = 0; i < 10; i++) {
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
L_main2:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main8
	MOVLW       10
	SUBWF       main_i_L0+0, 0 
L__main8:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;Exercicio.c,32 :: 		PORTD = lista[i];  // Acessa o elemento i da lista e o atribui ao PORTD
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       main_lista_L0+0, 0 
	MOVWF       FSR0L+0 
	MOVF        R1, 0 
	ADDWFC      main_lista_L0+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Exercicio.c,33 :: 		delay_ms(1000);  // Espera 1 segundo
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
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
;Exercicio.c,31 :: 		for (i = 0; i < 10; i++) {
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;Exercicio.c,34 :: 		}
	GOTO        L_main2
L_main3:
;Exercicio.c,35 :: 		}
	GOTO        L_main0
;Exercicio.c,36 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
