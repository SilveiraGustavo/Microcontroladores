// 1- Fazer um programa que caso aperte o botão RB0
// conte 0 a 2 no disc 1. Ao apertar RB1 conte de 10 a
// 12 no disc 3 e 4. RB2 pisque o conjunto de LED1 4
// vezes. Considere atraso de meio segundo.

int* criar_Lista() {
    static int Lista[10] = {
        0b00111111, // 0
        0b00000110, // 1
        0b01011011, // 2
        0b01001111, // 3
        0b01100110, // 4
        0b01101101, // 5
        0b01111101, // 6
        0b00000111, // 7
        0b01111111, // 8
        0b01101111,  // 9
    };
    return Lista;
}

void main() {
    int i;
    int* Lista = criar_Lista();

    TRISD = 0;  // Configura a porta D como saída para os LEDs
    TRISB = 0b00100111;  // Configura RB0, RB1, e RB2 como entrada
    TRISA = 0;  // Configura a porta A como saída para os displays
    PORTD = 0;  // Inicializa todos os LEDs apagados
    PORTA = 0;  // Inicializa todos os displays apagados

    while (1) {
        if (Button(&PORTB, 0, 1, 0) == 255) {
            PORTA = 0b00000100;
            for (i = 0; i <= 2; i++) {
                PORTD = Lista[i];
                delay_ms(500);  // Atraso de meio segundo
            }
        }
        if(Button(&PORTB, 1,1,0) == 255){

            for(i = 1; i <= 1; i++){
                  PORTA = 0b00010000;
                  PORTD = Lista[i];
                  delay_ms(2);
            }
            for(i = 0; i<=0;i++){
                    PORTA = 0b00100000;
                    PORTD = Lista[i];
                    delay_ms(2);
            }
        }
        if(Button(&PORTB,2,1,0) == 255){
            for(i = 0; i <= 3; i++){
                PORTD = 0b11111111;
                delay_ms(400);
                PORTD = 0;
                delay_ms(400);
            }
        }
    }
}