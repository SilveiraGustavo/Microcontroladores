#line 1 "C:/Users/gugav/Desktop/Computa��o/7� Per�odo - Eng.Computa��o/Microcontroladores/MicroC - Aula 25/Exercicio 3/Exercicio3.c"



void main() {
 TRISB = 0b00100000;
 TRISC = 0;

 while(1){
 if(Button(&PORTB, 5,1,0) == 255) {
 PORTC.F1 = 1;
 }
 }

}
