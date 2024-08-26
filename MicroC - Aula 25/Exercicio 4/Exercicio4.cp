#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 25/Exercicio 4/Exercicio4.c"







void main() {
 TRISB = 0b00001111;
 TRISC = 0;
 PWM1_Init(5000);
 PWM1_Start();

 while(1){
 if(Button(&PORTB,0,1,0) == 255){
 Pwm1_Set_Duty(63);
 }else if(Button(&PORTB,1,1,0) == 255){
 Pwm1_Set_Duty(127);
 }else if(Button(&PORTB,2,1,0) == 255) {
 Pwm1_Set_Duty(191);
 }else if(Button(&PORTB,3,1,0) == 255){
 Pwm1_Set_Duty(255);
 }
 }

}
