
_main:

;Exercicio6.c,28 :: 		void main() {
;Exercicio6.c,32 :: 		int atuador_ligado = 0; // Variável para controlar o estado do atuador
	CLRF        main_atuador_ligado_L0+0 
	CLRF        main_atuador_ligado_L0+1 
;Exercicio6.c,34 :: 		TRISC = 0; // Configura a porta C como saída para o atuador
	CLRF        TRISC+0 
;Exercicio6.c,35 :: 		PORTC = 0; // Inicializa a porta C
	CLRF        PORTC+0 
;Exercicio6.c,36 :: 		ADCON1 = 0b00001100; // Configura o ADC
	MOVLW       12
	MOVWF       ADCON1+0 
;Exercicio6.c,37 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Exercicio6.c,38 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Exercicio6.c,39 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Exercicio6.c,41 :: 		while(1){
L_main0:
;Exercicio6.c,42 :: 		valorADC = ADC_Read(2); // Leitura do valor do sensor de temperatura
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;Exercicio6.c,43 :: 		temperatura = (valorADC * 5.0 / 1023.0) * 100.0; // Conversão do ADC para temperatura em °C
	CALL        _int2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       main_temperatura_L0+0 
	MOVF        R1, 0 
	MOVWF       main_temperatura_L0+1 
	MOVF        R2, 0 
	MOVWF       main_temperatura_L0+2 
	MOVF        R3, 0 
	MOVWF       main_temperatura_L0+3 
;Exercicio6.c,46 :: 		if (temperatura >= 40.0) {
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;Exercicio6.c,47 :: 		PORTC = 0b00000100; // Liga o atuador (cooler)
	MOVLW       4
	MOVWF       PORTC+0 
;Exercicio6.c,48 :: 		atuador_ligado = 1; // Marca que o atuador está ligado
	MOVLW       1
	MOVWF       main_atuador_ligado_L0+0 
	MOVLW       0
	MOVWF       main_atuador_ligado_L0+1 
;Exercicio6.c,49 :: 		}
L_main2:
;Exercicio6.c,52 :: 		if (temperatura <= 35.0) {
	MOVF        main_temperatura_L0+0, 0 
	MOVWF       R4 
	MOVF        main_temperatura_L0+1, 0 
	MOVWF       R5 
	MOVF        main_temperatura_L0+2, 0 
	MOVWF       R6 
	MOVF        main_temperatura_L0+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       12
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;Exercicio6.c,53 :: 		PORTC = 0; // Desliga o atuador (cooler)
	CLRF        PORTC+0 
;Exercicio6.c,54 :: 		atuador_ligado = 0; // Marca que o atuador está desligado
	CLRF        main_atuador_ligado_L0+0 
	CLRF        main_atuador_ligado_L0+1 
;Exercicio6.c,55 :: 		}
L_main3:
;Exercicio6.c,58 :: 		FloatToStr(temperatura, texto);
	MOVF        main_temperatura_L0+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        main_temperatura_L0+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        main_temperatura_L0+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        main_temperatura_L0+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Exercicio6.c,59 :: 		Lcd_Out(1, 1, "Temp:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Exercicio6+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Exercicio6+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio6.c,60 :: 		Lcd_Out(1, 6, texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_texto_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_texto_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio6.c,61 :: 		Lcd_Out(1, 12, "C");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Exercicio6+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Exercicio6+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio6.c,64 :: 		if (atuador_ligado) {
	MOVF        main_atuador_ligado_L0+0, 0 
	IORWF       main_atuador_ligado_L0+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;Exercicio6.c,65 :: 		Lcd_Out(2, 1, "Atuador: Ligado ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Exercicio6+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Exercicio6+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio6.c,66 :: 		} else {
	GOTO        L_main5
L_main4:
;Exercicio6.c,67 :: 		Lcd_Out(2, 1, "Atuador: Deslg ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_Exercicio6+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_Exercicio6+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Exercicio6.c,68 :: 		}
L_main5:
;Exercicio6.c,70 :: 		Delay_ms(500); // Aguarda 500ms antes da próxima leitura
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
;Exercicio6.c,71 :: 		}
	GOTO        L_main0
;Exercicio6.c,72 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
