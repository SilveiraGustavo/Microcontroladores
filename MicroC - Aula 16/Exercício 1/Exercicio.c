// 1 � Fazer um programa que acenda os leds um a um do
// mais significativo para o menos significativo, com um
// batraso de meio segundo. Utilizar apenas uma vez o
// comando PORT. Utilizar porta D.

void main() {
     int aux = 0b00000000;  // M�scara inicial para o bit mais significativo
     int i;
     TRISD = 0;   // Configura a porta D como sa�da

    while(1) {
        // Loop para acender os LEDs do mais significativo ao menos significativo
        for ( i = 0; i < 8; i++) {
            PORTD = aux;   // Atribui a m�scara � porta D
            delay_ms(500); // Atraso de meio segundo
            aux >>= 1;     // Desloca a m�scara um bit para a direita
        }

        // Reinicializa a m�scara para o pr�ximo ciclo
        aux = 0b00000000;
    }
}