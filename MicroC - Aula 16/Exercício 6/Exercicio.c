// 6 – Fazer um programa que quando:
// O botão RB5 for pressionado uma vez mostre 1 no
// display de 7 segmentos. Quando apertar a segunda
// vez mostre 2 no display segmentos. Fazer até 9.
// Depois zera e comece novamente.

const unsigned char Numeros[] = {
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

void main() {
      int clicks = 0;
      TRISD = 0;
      TRISA = 0;
      TRISB = 0b00100000;
      PORTA = 0b00111100;

      while (1) {
        // Verifica se o botão RB5 foi pressionado
        if (Button(&PORTB, 5, 1, 0) == 255) {
            // Aguarda o botão ser solto para evitar múltiplas detecções
            while (Button(&PORTB, 5, 1, 0) == 255);
            // Incrementa o contador ao detectar uma nova pressão do botão
            clicks++;

            PORTD = Numeros[clicks - 1];
            delay_ms(200);
        }
    }

}