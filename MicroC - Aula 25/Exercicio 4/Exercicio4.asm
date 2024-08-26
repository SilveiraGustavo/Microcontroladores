
_main:

;Exercicio4.c,8 :: 		void main() {
;Exercicio4.c,9 :: 		TRISB = 0b00001111; // CONFIGURANDO OS BOTÕES UTILIZADOS
	MOVLW       15
	MOVWF       TRISB+0 
;Exercicio4.c,10 :: 		TRISC = 0; // CONFIGURANDO A PORTA C COMO SAÍDA.
	CLRF        TRISC+0 
;Exercicio4.c,11 :: 		PWM1_Init(5000);
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       99
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;Exercicio4.c,12 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;Exercicio4.c,14 :: 		while(1){
L_main0:
;Exercicio4.c,15 :: 		if(Button(&PORTB,0,1,0) == 255){
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
;Exercicio4.c,16 :: 		Pwm1_Set_Duty(63);
	MOVLW       63
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Exercicio4.c,17 :: 		}else if(Button(&PORTB,1,1,0) == 255){
	GOTO        L_main3
L_main2:
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
	GOTO        L_main4
;Exercicio4.c,18 :: 		Pwm1_Set_Duty(127);
	MOVLW       127
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Exercicio4.c,19 :: 		}else if(Button(&PORTB,2,1,0) == 255) {
	GOTO        L_main5
L_main4:
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
	GOTO        L_main6
;Exercicio4.c,20 :: 		Pwm1_Set_Duty(191);
	MOVLW       191
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Exercicio4.c,21 :: 		}else if(Button(&PORTB,3,1,0) == 255){
	GOTO        L_main7
L_main6:
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       3
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
;Exercicio4.c,22 :: 		Pwm1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Exercicio4.c,23 :: 		}
L_main8:
L_main7:
L_main5:
L_main3:
;Exercicio4.c,24 :: 		}
	GOTO        L_main0
;Exercicio4.c,26 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
