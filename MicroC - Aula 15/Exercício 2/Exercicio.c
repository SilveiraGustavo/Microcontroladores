// 2 - Mostrar os valores no display de 0 a 9 com
// intervalo de 1 segundo. Faça para o display 1. Caso
// queira mudar o display o que deve ser feito? E se
// quiser mais de um display?

int* cria_Lista() {
    static int lista[10] = {
        0b00111111, // 0
        0b00000110, // 1
        0b01011011, // 2
        0b01001111, // 3
        0b01100110, // 4
        0b01101101, // 5
        0b01111101, // 6
        0b00000111, // 7
        0b01111111, // 8
        0b01101111  // 9
    };
    return lista;
}

void main() {
    int i = 0;
    int* lista = cria_Lista();  // Obtenha o ponteiro para a lista
    TRISD = 0;   // Configura a porta D como saída
    TRISA = 0;   // Configura a porta A como saída
    PORTA = 0b00111100;


    while(1) {
        for (i = 0; i < 10; i++) {
            PORTD = lista[i];  // Acessa o elemento i da lista e o atribui ao PORTD
            delay_ms(1000);  // Espera 1 segundo
        }
    }
}