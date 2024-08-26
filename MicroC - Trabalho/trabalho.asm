
_criar_Lista:

;trabalho.c,16 :: 		int* criar_Lista() {
;trabalho.c,29 :: 		return Lista_segmentos;
	MOVLW       criar_Lista_Lista_segmentos_L0+0
	MOVWF       R0 
	MOVLW       hi_addr(criar_Lista_Lista_segmentos_L0+0)
	MOVWF       R1 
;trabalho.c,30 :: 		}
L_end_criar_Lista:
	RETURN      0
; end of _criar_Lista

_CustomChar:

;trabalho.c,34 :: 		void CustomChar(char pos_row, char pos_char) {
;trabalho.c,36 :: 		Lcd_Cmd(72);
	MOVLW       72
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;trabalho.c,37 :: 		for (i = 0; i <= 7; i++) Lcd_Chr_CP(character[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar0:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar1
	MOVLW       _character+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTR+0 
	MOVLW       hi_addr(_character+0)
	MOVWF       TBLPTR+1 
	MOVLW       0
	ADDWFC      TBLPTR+1, 1 
	MOVLW       higher_addr(_character+0)
	MOVWF       TBLPTR+2 
	MOVLW       0
	ADDWFC      TBLPTR+2, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar0
L_CustomChar1:
;trabalho.c,38 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;trabalho.c,39 :: 		Lcd_Chr(pos_row, pos_char, 1);
	MOVF        FARG_CustomChar_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;trabalho.c,40 :: 		}
L_end_CustomChar:
	RETURN      0
; end of _CustomChar

_PWM_Cooler:

;trabalho.c,42 :: 		void PWM_Cooler() {
;trabalho.c,44 :: 		ADCON1 = 0b00001110; // Configurações do ADC para leitura do potenciômetro
	MOVLW       14
	MOVWF       ADCON1+0 
;trabalho.c,45 :: 		TRISC = 0; // Configura a PORTC como saída
	CLRF        TRISC+0 
;trabalho.c,46 :: 		PWM1_Init(5000); // Inicializa o PWM com frequência de 5kHz
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;trabalho.c,47 :: 		PWM1_Start(); // Inicia o PWM
	CALL        _PWM1_Start+0, 0
;trabalho.c,49 :: 		while (1) {
L_PWM_Cooler3:
;trabalho.c,50 :: 		POT1 = ADC_Read(0) / 10.23;
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       20
	MOVWF       R4 
	MOVLW       174
	MOVWF       R5 
	MOVLW       35
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2int+0, 0
;trabalho.c,51 :: 		PWM1_Set_Duty(POT1 * 2.55); // Ajusta o duty cycle do PWM de acordo com o valor do potenciômetro
	CALL        _int2double+0, 0
	MOVLW       51
	MOVWF       R4 
	MOVLW       51
	MOVWF       R5 
	MOVLW       35
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;trabalho.c,54 :: 		if (Button(&PORTB, 1, 1, 0) == 255) {
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
	GOTO        L_PWM_Cooler5
;trabalho.c,56 :: 		break; // Sai do loop
	GOTO        L_PWM_Cooler4
;trabalho.c,57 :: 		}
L_PWM_Cooler5:
;trabalho.c,58 :: 		}
	GOTO        L_PWM_Cooler3
L_PWM_Cooler4:
;trabalho.c,59 :: 		}
L_end_PWM_Cooler:
	RETURN      0
; end of _PWM_Cooler

_Resistencia:

;trabalho.c,61 :: 		void Resistencia() {
;trabalho.c,63 :: 		ADCON1 = 0b00001100; // Configurações do ADC
	MOVLW       12
	MOVWF       ADCON1+0 
;trabalho.c,64 :: 		TRISB = 0b00000011;
	MOVLW       3
	MOVWF       TRISB+0 
;trabalho.c,65 :: 		TRISC = 0; // Configura a PORTC como saída
	CLRF        TRISC+0 
;trabalho.c,67 :: 		while (1) {
L_Resistencia6:
;trabalho.c,68 :: 		PORTC.F5 = 1; // Liga a resistência
	BSF         PORTC+0, 5 
;trabalho.c,69 :: 		Leitura_resistencia_valor = ADC_Read(2);
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       Resistencia_Leitura_resistencia_valor_L0+0 
	MOVF        R1, 0 
	MOVWF       Resistencia_Leitura_resistencia_valor_L0+1 
;trabalho.c,70 :: 		Lcd_Out(3,-3, "Pressione B1");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       253
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_trabalho+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_trabalho+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;trabalho.c,71 :: 		Lcd_Out(4, -3, "Para sair!");
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       253
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_trabalho+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_trabalho+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;trabalho.c,73 :: 		if (Leitura_resistencia_valor >= 40.0) {
	MOVF        Resistencia_Leitura_resistencia_valor_L0+0, 0 
	MOVWF       R0 
	MOVF        Resistencia_Leitura_resistencia_valor_L0+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
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
	GOTO        L_Resistencia8
;trabalho.c,74 :: 		PWM_Cooler(); // Chama a função de controle do cooler
	CALL        _PWM_Cooler+0, 0
;trabalho.c,75 :: 		}
L_Resistencia8:
;trabalho.c,78 :: 		if (Button(&PORTB, 1, 1, 0) == 255) {
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
	GOTO        L_Resistencia9
;trabalho.c,79 :: 		break; // Sai do loop
	GOTO        L_Resistencia7
;trabalho.c,80 :: 		}
L_Resistencia9:
;trabalho.c,81 :: 		}
	GOTO        L_Resistencia6
L_Resistencia7:
;trabalho.c,82 :: 		}
L_end_Resistencia:
	RETURN      0
; end of _Resistencia

_decremento_display:

;trabalho.c,84 :: 		void decremento_display() {
;trabalho.c,86 :: 		int* Lista_Segmentos = criar_Lista();
	CALL        _criar_Lista+0, 0
	MOVF        R0, 0 
	MOVWF       decremento_display_Lista_Segmentos_L0+0 
	MOVF        R1, 0 
	MOVWF       decremento_display_Lista_Segmentos_L0+1 
;trabalho.c,88 :: 		TRISD = 0;
	CLRF        TRISD+0 
;trabalho.c,89 :: 		TRISA = 0;
	CLRF        TRISA+0 
;trabalho.c,90 :: 		PORTA = 0b00111100;
	MOVLW       60
	MOVWF       PORTA+0 
;trabalho.c,91 :: 		PORTB = 0;
	CLRF        PORTB+0 
;trabalho.c,93 :: 		for (decremento = 9; decremento >= 0; decremento--) {
	MOVLW       9
	MOVWF       decremento_display_decremento_L0+0 
	MOVLW       0
	MOVWF       decremento_display_decremento_L0+1 
L_decremento_display10:
	MOVLW       128
	XORWF       decremento_display_decremento_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__decremento_display37
	MOVLW       0
	SUBWF       decremento_display_decremento_L0+0, 0 
L__decremento_display37:
	BTFSS       STATUS+0, 0 
	GOTO        L_decremento_display11
;trabalho.c,94 :: 		PORTD = Lista_Segmentos[decremento];
	MOVF        decremento_display_decremento_L0+0, 0 
	MOVWF       R0 
	MOVF        decremento_display_decremento_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       decremento_display_Lista_Segmentos_L0+0, 0 
	MOVWF       FSR0L+0 
	MOVF        R1, 0 
	ADDWFC      decremento_display_Lista_Segmentos_L0+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;trabalho.c,95 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_decremento_display13:
	DECFSZ      R13, 1, 1
	BRA         L_decremento_display13
	DECFSZ      R12, 1, 1
	BRA         L_decremento_display13
	DECFSZ      R11, 1, 1
	BRA         L_decremento_display13
	NOP
	NOP
;trabalho.c,93 :: 		for (decremento = 9; decremento >= 0; decremento--) {
	MOVLW       1
	SUBWF       decremento_display_decremento_L0+0, 1 
	MOVLW       0
	SUBWFB      decremento_display_decremento_L0+1, 1 
;trabalho.c,96 :: 		}
	GOTO        L_decremento_display10
L_decremento_display11:
;trabalho.c,97 :: 		PORTA = 0;
	CLRF        PORTA+0 
;trabalho.c,98 :: 		}
L_end_decremento_display:
	RETURN      0
; end of _decremento_display

_Semafaro_de_transito:

;trabalho.c,100 :: 		void Semafaro_de_transito() {
;trabalho.c,103 :: 		ADCON1 = 00000110;
	MOVLW       72
	MOVWF       ADCON1+0 
;trabalho.c,105 :: 		TRISB = 0; // Configura PORTB como saída
	CLRF        TRISB+0 
;trabalho.c,106 :: 		TRISC = 0; // Configura PORTC como saída
	CLRF        TRISC+0 
;trabalho.c,107 :: 		TRISC.F0 = 0; // Configura pino RC0 como saída (relé 1)
	BCF         TRISC+0, 0 
;trabalho.c,108 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;trabalho.c,110 :: 		while (1) {
L_Semafaro_de_transito14:
;trabalho.c,111 :: 		if (PORTC.F0 == 0) { // Se o sinal estiver vermelho
	BTFSC       PORTC+0, 0 
	GOTO        L_Semafaro_de_transito16
;trabalho.c,112 :: 		PORTB = 255; // Liga todos os LEDs da porta B (vermelho)
	MOVLW       255
	MOVWF       PORTB+0 
;trabalho.c,113 :: 		Lcd_Out(3, 1, "Fechado");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_trabalho+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_trabalho+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;trabalho.c,114 :: 		for (tempo_sinal_fechado = 20; tempo_sinal_fechado >= 0; tempo_sinal_fechado--) {
	MOVLW       20
	MOVWF       Semafaro_de_transito_tempo_sinal_fechado_L0+0 
	MOVLW       0
	MOVWF       Semafaro_de_transito_tempo_sinal_fechado_L0+1 
L_Semafaro_de_transito17:
	MOVLW       128
	XORWF       Semafaro_de_transito_tempo_sinal_fechado_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Semafaro_de_transito39
	MOVLW       0
	SUBWF       Semafaro_de_transito_tempo_sinal_fechado_L0+0, 0 
L__Semafaro_de_transito39:
	BTFSS       STATUS+0, 0 
	GOTO        L_Semafaro_de_transito18
;trabalho.c,115 :: 		if (tempo_sinal_fechado == 9) {
	MOVLW       0
	XORWF       Semafaro_de_transito_tempo_sinal_fechado_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Semafaro_de_transito40
	MOVLW       9
	XORWF       Semafaro_de_transito_tempo_sinal_fechado_L0+0, 0 
L__Semafaro_de_transito40:
	BTFSS       STATUS+0, 2 
	GOTO        L_Semafaro_de_transito20
;trabalho.c,116 :: 		decremento_display(); // Atualiza o display com o tempo restante
	CALL        _decremento_display+0, 0
;trabalho.c,117 :: 		}
L_Semafaro_de_transito20:
;trabalho.c,118 :: 		delay_ms(1000); // Aguarda 1 segundo
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_Semafaro_de_transito21:
	DECFSZ      R13, 1, 1
	BRA         L_Semafaro_de_transito21
	DECFSZ      R12, 1, 1
	BRA         L_Semafaro_de_transito21
	DECFSZ      R11, 1, 1
	BRA         L_Semafaro_de_transito21
	NOP
	NOP
;trabalho.c,114 :: 		for (tempo_sinal_fechado = 20; tempo_sinal_fechado >= 0; tempo_sinal_fechado--) {
	MOVLW       1
	SUBWF       Semafaro_de_transito_tempo_sinal_fechado_L0+0, 1 
	MOVLW       0
	SUBWFB      Semafaro_de_transito_tempo_sinal_fechado_L0+1, 1 
;trabalho.c,119 :: 		}
	GOTO        L_Semafaro_de_transito17
L_Semafaro_de_transito18:
;trabalho.c,122 :: 		PORTC.F0 = 1; // Muda para o estado verde
	BSF         PORTC+0, 0 
;trabalho.c,123 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;trabalho.c,124 :: 		}
L_Semafaro_de_transito16:
;trabalho.c,125 :: 		if (PORTC.F0 == 1) {
	BTFSS       PORTC+0, 0 
	GOTO        L_Semafaro_de_transito22
;trabalho.c,126 :: 		Lcd_Out(3, 1, "Aberto");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_trabalho+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_trabalho+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;trabalho.c,127 :: 		PORTB = 0b11111000;
	MOVLW       248
	MOVWF       PORTB+0 
;trabalho.c,128 :: 		PORTC.F1 = 1; // Liga o Buzzer
	BSF         PORTC+0, 1 
;trabalho.c,129 :: 		delay_ms(1000); // Mantém o buzzer ligado por 2 segundos
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_Semafaro_de_transito23:
	DECFSZ      R13, 1, 1
	BRA         L_Semafaro_de_transito23
	DECFSZ      R12, 1, 1
	BRA         L_Semafaro_de_transito23
	DECFSZ      R11, 1, 1
	BRA         L_Semafaro_de_transito23
	NOP
	NOP
;trabalho.c,130 :: 		PORTC.F1 = 0; // Desliga o Buzzer
	BCF         PORTC+0, 1 
;trabalho.c,133 :: 		decremento_display();
	CALL        _decremento_display+0, 0
;trabalho.c,135 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;trabalho.c,136 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;trabalho.c,137 :: 		}
L_Semafaro_de_transito22:
;trabalho.c,140 :: 		if (Button(&PORTB, 1, 1, 0) == 255) {
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
	GOTO        L_Semafaro_de_transito24
;trabalho.c,141 :: 		break; // Sai do loop
	GOTO        L_Semafaro_de_transito15
;trabalho.c,142 :: 		}
L_Semafaro_de_transito24:
;trabalho.c,143 :: 		}
	GOTO        L_Semafaro_de_transito14
L_Semafaro_de_transito15:
;trabalho.c,144 :: 		}
L_end_Semafaro_de_transito:
	RETURN      0
; end of _Semafaro_de_transito

_main:

;trabalho.c,146 :: 		void main() {
;trabalho.c,147 :: 		int contagem_timer = 0;
	CLRF        main_contagem_timer_L0+0 
	CLRF        main_contagem_timer_L0+1 
;trabalho.c,148 :: 		TRISB = 0b00000011;
	MOVLW       3
	MOVWF       TRISB+0 
;trabalho.c,149 :: 		TRISD = 0;
	CLRF        TRISD+0 
;trabalho.c,150 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;trabalho.c,153 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;trabalho.c,154 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;trabalho.c,157 :: 		T0CON = 0b10000110; // DEFINIÇÃO DO PRESCALER
	MOVLW       134
	MOVWF       T0CON+0 
;trabalho.c,158 :: 		TMR0L = 0x47; // RESULTADO DA CONTA
	MOVLW       71
	MOVWF       TMR0L+0 
;trabalho.c,159 :: 		TMR0H = 0xC3; // RESULTADO DA CONTA
	MOVLW       195
	MOVWF       TMR0H+0 
;trabalho.c,160 :: 		INTCON.TMR0IF = 0; // Estouro do TIMER0
	BCF         INTCON+0, 2 
;trabalho.c,162 :: 		Lcd_Out(1, 5, "Bem-vindo");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_trabalho+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_trabalho+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;trabalho.c,163 :: 		Lcd_Out(2, 5, "a Bambui");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_trabalho+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_trabalho+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;trabalho.c,164 :: 		CustomChar(3, 5); // Chamada da função que desenha o caracter especial
	MOVLW       3
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       5
	MOVWF       FARG_CustomChar_pos_char+0 
	CALL        _CustomChar+0, 0
;trabalho.c,166 :: 		while (contagem_timer <= 2) {
L_main25:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_contagem_timer_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main42
	MOVF        main_contagem_timer_L0+0, 0 
	SUBLW       2
L__main42:
	BTFSS       STATUS+0, 0 
	GOTO        L_main26
;trabalho.c,167 :: 		if (INTCON.TMR0IF == 1) {
	BTFSS       INTCON+0, 2 
	GOTO        L_main27
;trabalho.c,168 :: 		TMR0L = 0x47;
	MOVLW       71
	MOVWF       TMR0L+0 
;trabalho.c,169 :: 		TMR0H = 0xC3;
	MOVLW       195
	MOVWF       TMR0H+0 
;trabalho.c,170 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;trabalho.c,171 :: 		contagem_timer++;
	INFSNZ      main_contagem_timer_L0+0, 1 
	INCF        main_contagem_timer_L0+1, 1 
;trabalho.c,172 :: 		}
L_main27:
;trabalho.c,173 :: 		}
	GOTO        L_main25
L_main26:
;trabalho.c,174 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;trabalho.c,176 :: 		while (1) {
L_main28:
;trabalho.c,177 :: 		if (Button(&PORTB, 0, 1, 0) == 255) {
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
	GOTO        L_main30
;trabalho.c,178 :: 		Resistencia(); // Chama a função de controle da resistência
	CALL        _Resistencia+0, 0
;trabalho.c,179 :: 		}
L_main30:
;trabalho.c,181 :: 		if (Button(&PORTB, 1, 1, 0) == 255) {
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
	GOTO        L_main31
;trabalho.c,182 :: 		Semafaro_de_transito(); // Chama a função do semáforo
	CALL        _Semafaro_de_transito+0, 0
;trabalho.c,183 :: 		}
L_main31:
;trabalho.c,184 :: 		}
	GOTO        L_main28
;trabalho.c,185 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
