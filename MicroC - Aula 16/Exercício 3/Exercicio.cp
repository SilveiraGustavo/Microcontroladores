#line 1 "C:/Users/gugav/Desktop/Computa��o/7� Per�odo - Eng.Computa��o/Microcontroladores/MicroC - Aula 16/Exerc�cio 3/Exercicio.c"







void main() {
 int i;
 int aux = 0b10000000;
 TRISD = 0;

 while(1){
 for(i = 0; i < 8; i++){
 PORTD = aux;
 delay_ms(500);
 aux >>= 1;
 }
 aux = 0b10000000;
 }
}
