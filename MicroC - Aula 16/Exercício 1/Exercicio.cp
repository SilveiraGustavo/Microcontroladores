#line 1 "C:/Users/gugav/Desktop/Computa��o/7� Per�odo - Eng.Computa��o/Microcontroladores/MicroC - Aula 16/Exerc�cio 1/Exercicio.c"





void main() {
 int mask = 0b00000000;
 int i;
 TRISD = 0;

 while(1) {

 for ( i = 0; i < 8; i++) {
 PORTD = mask;
 delay_ms(500);
 mask >>= 1;
 }


 mask = 0b00000000;
 }
}
