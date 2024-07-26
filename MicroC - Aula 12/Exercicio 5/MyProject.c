//5 – Fazer um programa que acenda todos LEDs, espere
//2 segundos, apague todos LEDs, espere 3 segundos,
//acender 4 primeiros LEDs, espere 4 segundos e
//apague todos LEDs.

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
     TRISD = 0; // Configurando a Porta D como saída
     acender_leds();
     delay_ms(2000);
     apagar_leds();
     delay_ms(3000);
     acender_quatro_primeiros();
     delay_ms(4000);
     apagar_leds();
}