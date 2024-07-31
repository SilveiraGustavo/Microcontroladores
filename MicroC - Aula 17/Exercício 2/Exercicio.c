// 2- Fazer um programa que acenda os leds do
// conjunto 1 (LED1) de forma crescente e acenda os 1
// a 1 os leds do conjunto 2(LED2) de forma
// decrescente. Um aguardar o outro. Manter acesso

void main() {
    int i, j;
    TRISD = 0; // Configura a porta D como saída para o conjunto 1 (LED1)
    TRISB = 0; // Configura a porta B como saída para o conjunto 2 (LED2)
    PORTD = 0; // Inicializa todos os LEDs do conjunto 1 apagados
    PORTB = 0; // Inicializa todos os LEDs do conjunto 2 apagados

    while(1) {
        for (i = 0; i < 8; i++){
            PORTD |= 1 << i;
            delay_ms(100);
        }
        delay_ms(1000);
        for(i = 8; i >= 0; i--){
              PORTB |= 1 << i;
              delay_ms(100);
        }
        // Mantém os LEDs acesos indefinidamente
        while(1);
    }
}
