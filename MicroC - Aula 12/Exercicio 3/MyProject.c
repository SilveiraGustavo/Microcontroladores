//  3 - Acender os 4 �ltimos Leds.


void main() {
       TRISD = 0;
       PORTD = 0b11110000;
       DELAY_MS(100);
}