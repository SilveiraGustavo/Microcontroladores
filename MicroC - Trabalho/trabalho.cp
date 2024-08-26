#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Trabalho/trabalho.c"
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;


sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

int* criar_Lista() {
 static int Lista_segmentos[10] = {
 0b00111111,
 0b00000110,
 0b01011011,
 0b01001111,
 0b01100110,
 0b01101101,
 0b01111101,
 0b00000111,
 0b01111111,
 0b01101111
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
 int POT1;
 ADCON1 = 0b00001110;
 TRISC = 0;
 PWM1_Init(5000);
 PWM1_Start();

 while (1) {
 POT1 = ADC_Read(0) / 10.23;
 PWM1_Set_Duty(POT1 * 2.55);


 if (Button(&PORTB, 1, 1, 0) == 255) {

 break;
 }
 }
}

void Resistencia() {
 int Leitura_resistencia_valor;
 ADCON1 = 0b00001100;
 TRISB = 0b00000011;
 TRISC = 0;

 while (1) {
 PORTC.F5 = 1;
 Leitura_resistencia_valor = ADC_Read(2);
 Lcd_Out(3,-3, "Pressione B1");
 Lcd_Out(4, -3, "Para sair!");

 if (Leitura_resistencia_valor >= 40.0) {
 PWM_Cooler();
 }


 if (Button(&PORTB, 1, 1, 0) == 255) {
 break;
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

 TRISB = 0;
 TRISC = 0;
 TRISC.F0 = 0;
 Lcd_Init();

 while (1) {
 if (PORTC.F0 == 0) {
 PORTB = 255;
 Lcd_Out(3, 1, "Fechado");
 for (tempo_sinal_fechado = 20; tempo_sinal_fechado >= 0; tempo_sinal_fechado--) {
 if (tempo_sinal_fechado == 9) {
 decremento_display();
 }
 delay_ms(1000);
 }


 PORTC.F0 = 1;
 Lcd_Cmd(_LCD_CLEAR);
 }
 if (PORTC.F0 == 1) {
 Lcd_Out(3, 1, "Aberto");
 PORTB = 0b11111000;
 PORTC.F1 = 1;
 delay_ms(1000);
 PORTC.F1 = 0;


 decremento_display();

 PORTC.F0 = 0;
 Lcd_Cmd(_LCD_CLEAR);
 }


 if (Button(&PORTB, 1, 1, 0) == 255) {
 break;
 }
 }
}

void main() {
 int contagem_timer = 0;
 TRISB = 0b00000011;
 TRISD = 0;
 Lcd_Init();


 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);


 T0CON = 0b10000110;
 TMR0L = 0x47;
 TMR0H = 0xC3;
 INTCON.TMR0IF = 0;

 Lcd_Out(1, 5, "Bem-vindo");
 Lcd_Out(2, 5, "a Bambui");
 CustomChar(3, 5);

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
 Resistencia();
 }

 if (Button(&PORTB, 1, 1, 0) == 255) {
 Semafaro_de_transito();
 }
 }
}
