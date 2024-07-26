// 4 – Fazer um programa que acenda todos LEDs espere 1
// segundo e apague todos LEDs.

void main() {
        TRISD = 0;  // configurando a porta D como saída
        PORTD = 255; // Aciona todo o conjunto de LED da porta D
        delay_ms(1000); // Espero 1 segundo
        PORTD = 0; // Desliga todo o conjunto de LED da porta D
}