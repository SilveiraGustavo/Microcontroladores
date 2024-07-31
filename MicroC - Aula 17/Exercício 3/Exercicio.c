// 3- Fazer um programa que acenda os leds do
// conjunto 1(LED1) de forma crescente e acenda os
// leds do conjunto 2(LED2) de forma decrescente.
// Simultâneos.


void main() {
     int i;
     TRISD = 0;
     TRISB = 0;
     PORTD = 0;
     PORTB = 0;
     
     while(1){
        for (i = 0; i < 8; i++){
            PORTD |= 1 << i;
            PORTB |= 1 << (7 - i);
            delay_ms(100);
        }
     }
}