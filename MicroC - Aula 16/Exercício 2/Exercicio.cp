#line 1 "C:/Users/gugav/Desktop/Computa��o/7� Per�odo - Eng.Computa��o/Microcontroladores/MicroC - Aula 16/Exerc�cio 2/Exercicio.c"




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
