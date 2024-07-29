// 2 – Fazer um programa em que os leds 1, 2, 3, 4 acendam
// de forma alternada com os leds 5, 6, 7 e 8, infinitamente.
// Atraso de 2 segundos. Utilizar porta B.

void main() {
    int i;
    TRISB = 0;   // Configura a porta B como saída


    while(1) {
        for ( i = 0; i < 2; i++) {
            if (i == 0) {
                PORTB = 0b00001111;  // Acende os LEDs 1, 2, 3 e 4
            } else {
                PORTB = 0b11110000;  // Acende os LEDs 5, 6, 7 e 8
            }
            delay_ms(2000);        // Atraso de 2 segundos
        }
    }
}