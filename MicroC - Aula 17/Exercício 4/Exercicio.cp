#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 17/Exercício 4/Exercicio.c"
void main(){
 TRISB = 0b00100000;
 TRISA = 0;
 PORTA = 0b00111100;

 while(1){

 if(Button(&PORTB, 5,1,0) == 255){
 PORTA = 0b01111111;
 delay_ms(1000);
 }
 }
}
