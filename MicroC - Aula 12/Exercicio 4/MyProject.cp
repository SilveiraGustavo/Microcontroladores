#line 1 "C:/Users/gugav/Desktop/Computa��o/7� Per�odo - Eng.Computa��o/Microcontroladores/MicroC - Aula 12/Exercicio 4/MyProject.c"



void main() {
 TRISD = 0;
 PORTD = 255;
 delay_ms(1000);
 PORTD = 0;
}
