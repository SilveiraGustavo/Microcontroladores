// 5 � Fazer um programa que ligue o cooler e mostre o
// valor da temperatura no LCD.

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

void main() {
     int aux;
     char texto[6];
     TRISC = 0;
     PORTC = 0b00100000; // Ligando a resistencia no pino C5
     ADCON1 = 0b11111100;
     Lcd_Init();

     while(1){
          PORTC = 0b00100100; // Ligando o resistencia  pino C5 e Cooler pino C2;
     }
}