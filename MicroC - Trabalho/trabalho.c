sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

int* criar_Lista() {
    static int Lista_segmentos[10] = {
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
    return Lista_segmentos;
}

const char character[] = {27,31,14,4,0,0,0,0};

void CustomChar(char pos_row, char pos_char) {
    char i;
    Lcd_Cmd(72);
    for (i = 0; i <= 7; i++) Lcd_Chr_CP(character[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 1);
}

void PWM_Cooler() {
    int POT1; // Potenciômetro 1
    ADCON1 = 0b00001110; // Configurações do ADC para leitura do potenciômetro
    TRISC = 0; // Configura a PORTC como saída
    PWM1_Init(5000); // Inicializa o PWM com frequência de 5kHz
    PWM1_Start(); // Inicia o PWM

    while (1) {
        POT1 = ADC_Read(0) / 10.23;
        PWM1_Set_Duty(POT1 * 2.55); // Ajusta o duty cycle do PWM de acordo com o valor do potenciômetro

        // Verifica se o botão RB1 foi pressionado para sair do loop
        if (Button(&PORTB, 1, 1, 0) == 255) {
            //PWM1_Stop(); // Para o PWM
            break; // Sai do loop
        }
    }
}

void Resistencia() {
    int Leitura_resistencia_valor;
    ADCON1 = 0b00001100; // Configurações do ADC
    TRISB = 0b00000011;
    TRISC = 0; // Configura a PORTC como saída

    while (1) {
        PORTC.F5 = 1; // Liga a resistência
        Leitura_resistencia_valor = ADC_Read(2);
        Lcd_Out(3,-3, "Pressione B1");
        Lcd_Out(4, -3, "Para sair!");

        if (Leitura_resistencia_valor >= 40.0) {
            PWM_Cooler(); // Chama a função de controle do cooler
        }

        // Verifica se o botão RB1 foi pressionado para sair do loop
        if (Button(&PORTB, 1, 1, 0) == 255) {
            break; // Sai do loop
        }
    }
}

void decremento_display() {
    int decremento;
    int* Lista_Segmentos = criar_Lista();

    TRISD = 0;
    TRISA = 0;
    PORTA = 0b00111100;
    PORTB = 0;

    for (decremento = 9; decremento >= 0; decremento--) {
        PORTD = Lista_Segmentos[decremento];
        delay_ms(1000);
    }
    PORTA = 0;
}

void Semafaro_de_transito() {
    int tempo_sinal_fechado;
    
    ADCON1 = 00000110;

    TRISB = 0; // Configura PORTB como saída
    TRISC = 0; // Configura PORTC como saída
    TRISC.F0 = 0; // Configura pino RC0 como saída (relé 1)
    Lcd_Init();

    while (1) {
        if (PORTC.F0 == 0) { // Se o sinal estiver vermelho
            PORTB = 255; // Liga todos os LEDs da porta B (vermelho)
            Lcd_Out(3, 1, "Fechado");
            for (tempo_sinal_fechado = 20; tempo_sinal_fechado >= 0; tempo_sinal_fechado--) {
                if (tempo_sinal_fechado == 9) {
                    decremento_display(); // Atualiza o display com o tempo restante
                }
                delay_ms(1000); // Aguarda 1 segundo
            }

            // Transição para o próximo estado
            PORTC.F0 = 1; // Muda para o estado verde
            Lcd_Cmd(_LCD_CLEAR);
        }
        if (PORTC.F0 == 1) {
            Lcd_Out(3, 1, "Aberto");
            PORTB = 0b11111000;
            PORTC.F1 = 1; // Liga o Buzzer
            delay_ms(1000); // Mantém o buzzer ligado por 2 segundos
            PORTC.F1 = 0; // Desliga o Buzzer


            decremento_display();

            PORTC.F0 = 0;
            Lcd_Cmd(_LCD_CLEAR);
        }

        // Verifica se o botão RB1 foi pressionado para sair do loop
        if (Button(&PORTB, 1, 1, 0) == 255) {
            break; // Sai do loop
        }
    }
}

void main() {
    int contagem_timer = 0;
    TRISB = 0b00000011;
    TRISD = 0;
    Lcd_Init();

    // Inicializando o display todo apagado
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);

    // Configuração do TIMER0
    T0CON = 0b10000110; // DEFINIÇÃO DO PRESCALER
    TMR0L = 0x47; // RESULTADO DA CONTA
    TMR0H = 0xC3; // RESULTADO DA CONTA
    INTCON.TMR0IF = 0; // Estouro do TIMER0

    Lcd_Out(1, 5, "Bem-vindo");
    Lcd_Out(2, 5, "a Bambui");
    CustomChar(3, 5); // Chamada da função que desenha o caracter especial

    while (contagem_timer <= 2) {
        if (INTCON.TMR0IF == 1) {
            TMR0L = 0x47;
            TMR0H = 0xC3;
            INTCON.TMR0IF = 0;
            contagem_timer++;
        }
    }
    Lcd_Cmd(_LCD_CLEAR);

    while (1) {
        if (Button(&PORTB, 0, 1, 0) == 255) {
            Resistencia(); // Chama a função de controle da resistência
        }

        if (Button(&PORTB, 1, 1, 0) == 255) {
            Semafaro_de_transito(); // Chama a função do semáforo
        }
    }
}