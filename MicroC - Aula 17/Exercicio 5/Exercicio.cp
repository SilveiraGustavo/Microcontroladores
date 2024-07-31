#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 17/Exercicio 5/Exercicio.c"




void main() {
 int element = 0b01111111;
 int i;
 TRISD = 0;
 TRISA = 0;
 TRISB = 0b00100000;
 PORTA = 0b00111100;


 while(1){
 if(Button(&PORTB, 5,1,0) == 255){
 PORTD = element;
 delay_ms(1000);
 }
 }

}
