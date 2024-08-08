//6 – Desenvolver um controlador ON/OFF (liga/desliga)
// para um sistema. Considere que, no sistema tem um
// aumento constante de temperatura (resistência). Logo,
// a resistência deve ser ligada o tempo inteiro. Quando a
// temperatura atingir 40°C, um atuador deve ser ligado.
// Este atuador (cooler) tem função de diminuir a
// temperatura. Quando a temperatura atingir 35 °C
// deve-se desligar o atuador. Mostrar o valor da
// temperatura na tela e indicar no LCD quando o atuador
// estiver ligado.

// Definições dos pinos do LCD
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// Direção dos pinos do LCD
sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

void main() {
    int valorADC;
    float temperatura;
    char texto[16];
    int atuador_ligado = 0; // Variável para controlar o estado do atuador

    TRISC = 0; // Configura a porta C como saída para o atuador
    PORTC = 0; // Inicializa a porta C
    ADCON1 = 0b00001100; // Configura o ADC
    Lcd_Init();
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);

    while(1){
        valorADC = ADC_Read(2); // Leitura do valor do sensor de temperatura
        temperatura = (valorADC * 5.0 / 1023.0) * 100.0; // Conversão do ADC para temperatura em °C

        // Verifica se a temperatura está acima de 40°C e liga o atuador
        if (temperatura >= 40.0) {
            PORTC = 0b00000100; // Liga o atuador (cooler)
            atuador_ligado = 1; // Marca que o atuador está ligado
        }

        // Verifica se a temperatura está abaixo ou igual a 35°C e desliga o atuador
        if (temperatura <= 35.0) {
            PORTC = 0; // Desliga o atuador (cooler)
            atuador_ligado = 0; // Marca que o atuador está desligado
        }

        // Exibe a temperatura no LCD
        FloatToStr(temperatura, texto);
        Lcd_Out(1, 1, "Temp:");
        Lcd_Out(1, 6, texto);
        Lcd_Out(1, 12, "C");

        // Indica no LCD se o atuador está ligado
        if (atuador_ligado) {
            Lcd_Out(2, 1, "Atuador: Ligado ");
        } else {
            Lcd_Out(2, 1, "Atuador: Deslg ");
        }

        Delay_ms(500); // Aguarda 500ms antes da próxima leitura
    }
}
