#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 18/Exercício 1/Exercicio.c"





int* criar_Lista() {
 static int Lista[10] = {
 0b00111111,
 0b00000110,
 0b01011011,
 0b01001111,
 0b01100110,
 0b01101101,
 0b01111101,
 0b00000111,
 0b01111111,
 0b01101111,
 };
 return Lista;
}

void main() {
 int i;
 int* Lista = criar_Lista();

 TRISD = 0;
 TRISB = 0b00100111;
 TRISA = 0;
 PORTD = 0;
 PORTA = 0;

 while (1) {
 if (Button(&PORTB, 0, 1, 0) == 255) {
 PORTA = 0b00000100;
 for (i = 0; i <= 2; i++) {
 PORTD = Lista[i];
 delay_ms(500);
 }
 }
 if(Button(&PORTB, 1,1,0) == 255){

 for(i = 1; i <= 1; i++){
 PORTA = 0b00010000;
 PORTD = Lista[i];
 delay_ms(2);
 }
 for(i = 0; i<=0;i++){
 PORTA = 0b00100000;
 PORTD = Lista[i];
 delay_ms(2);
 }
 }
 if(Button(&PORTB,2,1,0) == 255){
 for(i = 0; i <= 3; i++){
 PORTD = 0b11111111;
 delay_ms(400);
 PORTD = 0;
 delay_ms(400);
 }
 }
 }
}
