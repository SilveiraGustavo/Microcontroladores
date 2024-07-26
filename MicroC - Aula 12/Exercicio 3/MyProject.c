//  3 - Acender os 4 últimos Leds.


void main() {
       TRISD = 0;
       PORTD = 0b11110000;
       DELAY_MS(100);
}