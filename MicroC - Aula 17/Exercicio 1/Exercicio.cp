#line 1 "C:/Users/gugav/Desktop/Computa��o/7� Per�odo - Eng.Computa��o/Microcontroladores/MicroC - Aula 17/Exerc�cio 1/Exercicio.c"







void main() {
 int state = 0;
 TRISD = 0;
 TRISB = 0;

 while (1) {
 if (state == 0) {

 PORTD = 255;
 PORTB = 0;
 state = 1;
 } else {

 PORTD = 0;
 PORTB = 255;
 state = 0;
 }

 delay_ms(1000);
 }
}
