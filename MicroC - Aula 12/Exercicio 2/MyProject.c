// 2 � Acender os 4 primeiros Leds.

void main() {
     TRISD = 0; // Configurando a porta D como sa�da
     PORTD = 0b00001111;
     delay_ms(1000);
}