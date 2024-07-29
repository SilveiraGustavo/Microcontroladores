#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 16/Exercício 2/Exercicio.c"




void main() {
 int i;
 TRISB = 0;

 while(1){

 PORTB = 0b00001111;
 delay_ms(2000);
 PORTB = 0b11110000;
 delay_ms(2000);
 }










}
