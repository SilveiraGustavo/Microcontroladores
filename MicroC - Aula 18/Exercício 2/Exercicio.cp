#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 18/Exercício 2/Exercicio.c"




void main() {
 int i;
 int aux = 0b00000000;
 TRISB = 0b00100000;
 TRISD = 0;
 PORTD = 0;
 PORTA = 0;
 TRISA = 0b00111100;

 while(1){
 if(Button(&PORTB, 5,1,0) == 255){
 for (i = 0; i < 8; i += 2) {
 PORTD |= (1 << i);
 delay_ms(500);
 }
 }
 }
}
