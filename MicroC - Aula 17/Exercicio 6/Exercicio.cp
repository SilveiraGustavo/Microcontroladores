#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 17/Exercicio 6/Exercicio.c"






void main() {
 int clicks = 0;
 TRISD = 0;
 TRISA = 0;
 TRISB = 0b00100000;


 while(1){
 if(Button(&PORTB,5,1,0) == 255){
 clicks++;
 if(clicks == 1){
 PORTA = 0b00000100;
 PORTD = 0b00111111;
 }else if ( clicks == 2){
 PORTA = 0b00001100;
 PORTD = 0b00111111;
 }
 delay_ms(1000);
 }

 }

}
