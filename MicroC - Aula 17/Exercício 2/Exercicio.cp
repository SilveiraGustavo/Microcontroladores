#line 1 "C:/Users/gugav/Desktop/Computa��o/7� Per�odo - Eng.Computa��o/Microcontroladores/MicroC - Aula 17/Exerc�cio 2/Exercicio.c"





void main() {
 int i, j;
 TRISD = 0;
 TRISB = 0;
 PORTD = 0;
 PORTB = 0;

 while(1) {
 for (i = 0; i < 8; i++){
 PORTD |= 1 << i;
 delay_ms(100);
 }
 delay_ms(1000);

 for(i = 8; i >= 0; i--){
 PORTB |= 1 << i;
 delay_ms(100);
 }

 while(1);
 }
}
