// 1- Fazer um pisca-pisca. Este pisca-pisca deve ser
// alternado entre porta B e D, ou seja, quando estiver
// tudo acesso em uma porta, na outra estar� tudo
// apagada, e vice-versa.
// IMPORTANTE: MUDAR AS CHAVES, PARA ACIONAR
// OS LEDs e RB0.

void main() {
    int state = 0; // Vari�vel para controlar qual porta est� acesa
    TRISD = 0;    // Configura a porta D como sa�da
    TRISB = 0;    // Configura a porta B como sa�da

    while (1) {
        if (state == 0) {
            // Acende LEDs na porta D e apaga LEDs na porta B
            PORTD = 255;
            PORTB = 0;
            state = 1; // Altera o estado para o pr�ximo ciclo
        } else {
            // Acende LEDs na porta B e apaga LEDs na porta D
            PORTD = 0;
            PORTB = 255;
            state = 0; // Altera o estado para o pr�ximo ciclo
        }
        // Delay entre alterna��es
        delay_ms(1000);
    }
}
