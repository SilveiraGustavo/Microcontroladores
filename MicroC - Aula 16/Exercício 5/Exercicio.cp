#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 16/Exercício 5/Exercicio.c"





void main() {
 int aux = 0;
 unsigned char end = 0b00000000;
 TRISD = 0;
 TRISB = 0b00100000;
 PORTD = 0b00000000;
 while (1) {

 if (Button(&PORTB, 5, 1, 0) == 255) {




 aux++;


 if (aux > 8) {
 aux = 8;
 }
 end |= (1 << (aux - 1));


 PORTD = end;
 delay_ms(200);
 }
 }
}
