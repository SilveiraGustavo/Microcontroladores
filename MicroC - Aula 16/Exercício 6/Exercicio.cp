#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 16/Exercício 6/Exercicio.c"






const unsigned char Numeros[] = {
 0b00000110,
 0b01011011,
 0b01001111,
 0b01100110,
 0b01101101,
 0b01111101,
 0b00000111,
 0b01111111,
 0b01101111
};

void main() {
 int clicks = 0;
 TRISD = 0;
 TRISA = 0;
 TRISB = 0b00100000;
 PORTA = 0b00111100;

 while (1) {

 if (Button(&PORTB, 5, 1, 0) == 255) {

 while (Button(&PORTB, 5, 1, 0) == 255);

 clicks++;


 PORTD = Numeros[clicks - 1];
 delay_ms(200);
 }
 }

}
