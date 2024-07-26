#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 12/Exercicio 5/MyProject.c"





void acender_leds(){
 PORTD = 255;
}
void apagar_leds(){
 PORTD = 0;
}
void acender_quatro_primeiros(){
 PORTD = 0b00001111;
}
void main() {
 TRISD = 0;
 acender_leds();
 delay_ms(2000);
 apagar_leds();
 delay_ms(3000);
 acender_quatro_primeiros();
 delay_ms(4000);
 apagar_leds();
}
