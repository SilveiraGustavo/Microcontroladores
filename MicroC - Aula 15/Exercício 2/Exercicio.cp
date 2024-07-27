#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 15/Exercício 2/Exercicio.c"





int* cria_Lista() {
 static int lista[10] = {
 0b00111111,
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
 return lista;
}

void main() {
 int i = 0;
 int* lista = cria_Lista();
 TRISD = 0;
 TRISA = 0;
 PORTA = 0b00111100;


 while(1) {
 for (i = 0; i < 10; i++) {
 PORTD = lista[i];
 delay_ms(1000);
 }
 }
}
