#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 12/Exercicio 6/MyProject.c"




void main() {
 TRISD = 0;
 while(1){
 PORTD = 255;
 delay_ms(2000);
 PORTD = 0;
 delaY_ms(2000);
 }
}
