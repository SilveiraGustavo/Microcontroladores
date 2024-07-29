#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 16/Exercício 1/Exercicio.c"





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
