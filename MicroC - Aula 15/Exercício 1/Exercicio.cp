#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 15/Exercício 1/Exercicio.c"









void main() {
 TRISA = 0;
 TRISD = 0;
 PORTD = 1;
 PORTA = 0b00000011;

 delay_ms(1000);
}
