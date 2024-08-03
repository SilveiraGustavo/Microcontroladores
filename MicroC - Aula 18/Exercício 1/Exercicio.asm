
_criar_Lista:

;Exercicio.c,6 :: 		int* criar_Lista() {
;Exercicio.c,19 :: 		return Lista;
	MOVLW       criar_Lista_Lista_L0+0
	MOVWF       R0 
	MOVLW       hi_addr(criar_Lista_Lista_L0+0)
	MOVWF       R1 
;Exercicio.c,20 :: 		}
L_end_criar_Lista:
	RETURN      0
; end of _criar_Lista

_main:

;Exercicio.c,22 :: 		void main() {
;Exercicio.c,24 :: 		int* Lista = criar_Lista();
	CALL        _criar_Lista+0, 0
	MOVF        R0, 0 
	MOVWF       main_Lista_L0+0 
	MOVF        R1, 0 
	MOVWF       main_Lista_L0+1 
;Exercicio.c,26 :: 		TRISD = 0;  // Configura a porta D como saída para os LEDs
	CLRF        TRISD+0 
;Exercicio.c,27 :: 		TRISB = 0b00100111;  // Configura RB0, RB1, e RB2 como entrada
	MOVLW       39
	MOVWF       TRISB+0 
;Exercicio.c,28 :: 		TRISA = 0;  // Configura a porta A como saída para os displays
	CLRF        TRISA+0 
;Exercicio.c,29 :: 		PORTD = 0;  // Inicializa todos os LEDs apagados
	CLRF        PORTD+0 
;Exercicio.c,30 :: 		PORTA = 0;  // Inicializa todos os displays apagados
	CLRF        PORTA+0 
;Exercicio.c,32 :: 		while (1) {
L_main0:
;Exercicio.c,33 :: 		if (Button(&PORTB, 0, 1, 0) == 255) {
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;Exercicio.c,34 :: 		PORTA = 0b00000100;
	MOVLW       4
	MOVWF       PORTA+0 
;Exercicio.c,35 :: 		for (i = 0; i <= 2; i++) {
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
L_main3:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main24
	MOVF        main_i_L0+0, 0 
	SUBLW       2
L__main24:
	BTFSS       STATUS+0, 0 
	GOTO        L_main4
;Exercicio.c,36 :: 		PORTD = Lista[i];
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       main_Lista_L0+0, 0 
	MOVWF       FSR0L+0 
	MOVF        R1, 0 
	ADDWFC      main_Lista_L0+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Exercicio.c,37 :: 		delay_ms(500);  // Atraso de meio segundo
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;Exercicio.c,35 :: 		for (i = 0; i <= 2; i++) {
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;Exercicio.c,38 :: 		}
	GOTO        L_main3
L_main4:
;Exercicio.c,39 :: 		}
L_main2:
;Exercicio.c,40 :: 		if(Button(&PORTB, 1,1,0) == 255){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;Exercicio.c,42 :: 		for(i = 1; i <= 1; i++){
	MOVLW       1
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main8:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main25
	MOVF        main_i_L0+0, 0 
	SUBLW       1
L__main25:
	BTFSS       STATUS+0, 0 
	GOTO        L_main9
;Exercicio.c,43 :: 		PORTA = 0b00010000;
	MOVLW       16
	MOVWF       PORTA+0 
;Exercicio.c,44 :: 		PORTD = Lista[i];
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       main_Lista_L0+0, 0 
	MOVWF       FSR0L+0 
	MOVF        R1, 0 
	ADDWFC      main_Lista_L0+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Exercicio.c,45 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	NOP
;Exercicio.c,42 :: 		for(i = 1; i <= 1; i++){
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;Exercicio.c,46 :: 		}
	GOTO        L_main8
L_main9:
;Exercicio.c,47 :: 		for(i = 0; i<=0;i++){
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
L_main12:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main26
	MOVF        main_i_L0+0, 0 
	SUBLW       0
L__main26:
	BTFSS       STATUS+0, 0 
	GOTO        L_main13
;Exercicio.c,48 :: 		PORTA = 0b00100000;
	MOVLW       32
	MOVWF       PORTA+0 
;Exercicio.c,49 :: 		PORTD = Lista[i];
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       main_Lista_L0+0, 0 
	MOVWF       FSR0L+0 
	MOVF        R1, 0 
	ADDWFC      main_Lista_L0+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;Exercicio.c,50 :: 		delay_ms(2);
	MOVLW       6
	MOVWF       R12, 0
	MOVLW       48
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	NOP
;Exercicio.c,47 :: 		for(i = 0; i<=0;i++){
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;Exercicio.c,51 :: 		}
	GOTO        L_main12
L_main13:
;Exercicio.c,52 :: 		}
L_main7:
;Exercicio.c,53 :: 		if(Button(&PORTB,2,1,0) == 255){
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       2
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_main16
;Exercicio.c,54 :: 		for(i = 0; i <= 3; i++){
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
L_main17:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main27
	MOVF        main_i_L0+0, 0 
	SUBLW       3
L__main27:
	BTFSS       STATUS+0, 0 
	GOTO        L_main18
;Exercicio.c,55 :: 		PORTD = 0b11111111;
	MOVLW       255
	MOVWF       PORTD+0 
;Exercicio.c,56 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main20:
	DECFSZ      R13, 1, 1
	BRA         L_main20
	DECFSZ      R12, 1, 1
	BRA         L_main20
	DECFSZ      R11, 1, 1
	BRA         L_main20
;Exercicio.c,57 :: 		PORTD = 0;
	CLRF        PORTD+0 
;Exercicio.c,58 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main21:
	DECFSZ      R13, 1, 1
	BRA         L_main21
	DECFSZ      R12, 1, 1
	BRA         L_main21
	DECFSZ      R11, 1, 1
	BRA         L_main21
;Exercicio.c,54 :: 		for(i = 0; i <= 3; i++){
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;Exercicio.c,59 :: 		}
	GOTO        L_main17
L_main18:
;Exercicio.c,60 :: 		}
L_main16:
;Exercicio.c,61 :: 		}
	GOTO        L_main0
;Exercicio.c,62 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
