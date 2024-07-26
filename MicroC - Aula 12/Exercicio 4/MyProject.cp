#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 12/Exercicio 4/MyProject.c"



void main() {
 TRISD = 0;
 PORTD = 255;
 delay_ms(1000);
 PORTD = 0;
}
