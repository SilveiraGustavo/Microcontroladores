#line 1 "C:/Users/gugav/Desktop/Computa��o/7� Per�odo - Eng.Computa��o/Microcontroladores/MicroC - Aula 17/Exerc�cio 3/Exercicio.c"






void main() {
 int i;
 TRISD = 0;
 TRISB = 0;
 PORTD = 0;
 PORTB = 0;

 while(1){
 for (i = 0; i < 8; i++){
 PORTD |= 1 << i;
 PORTB |= 1 << (7 - i);
 delay_ms(100);
 }
 }
}
