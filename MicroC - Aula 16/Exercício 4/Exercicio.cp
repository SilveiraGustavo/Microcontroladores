#line 1 "C:/Users/gugav/Desktop/Computa��o/7� Per�odo - Eng.Computa��o/Microcontroladores/MicroC - Aula 16/Exerc�cio 4/Exercicio.c"







void main() {
 int i, j;
 int aux = 0b10000000;
 int aux2 = 0b00000001;
 TRISD = 0;

 while(1) {
 for (i = 0; i < 8; i++){
 PORTD = aux;
 delay_ms(500);
 aux >>= 1;

 if ( i == 7) {
 for (j = 0 ; j <8 ; j++){
 PORTD = aux2;
 delay_ms(500);
 aux2 <<= 1;
 }
 }
 }
 }
}
