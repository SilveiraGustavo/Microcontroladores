// 5 - Fazer um programa que quando o bot�o RB5 for
// pressionado o primeiro led acenda, ao apertar pela
// segunda vez RB5 o segundo led acenda, e assim por
// diante.

void main() {
    int aux = 0;                    // Vari�vel para contar o n�mero de press�es do bot�o
    unsigned char end = 0b00000000; // Vari�vel para armazenar o estado dos LEDs
    TRISD = 0;                      // Configura a porta D como sa�da
    TRISB = 0b00100000;             // Configura o pino RB5 como entrada
    PORTD = 0b00000000;             // Inicializa todos os LEDs apagados
    while (1) {
        // Verifica se o bot�o RB5 foi pressionado
        if (Button(&PORTB, 5, 1, 0) == 255) {
            // Aguarda o bot�o ser solto para evitar m�ltiplas detec��es
            while (Button(&PORTB, 5, 1, 0) == 255);
            // Incrementa o contador ao detectar uma nova press�o do bot�o
            aux++;
            // Limita aux a 8 para n�o ultrapassar o tamanho de end (1 byte)
            if (aux > 8) {
                aux = 8;
            }
            end |= (1 << (aux - 1)); // Acende o LED correspondente
            // Atualiza a porta D com o valor de 'end'
            PORTD = end;
            delay_ms(200);
        }
    }
}

