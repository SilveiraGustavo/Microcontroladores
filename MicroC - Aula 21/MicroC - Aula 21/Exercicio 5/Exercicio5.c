// 5 - Fazer um programa que mostre no LCD, os valores
// dos canais analógicos dos 2 potenciômetros.

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
     int POT1;
     int POT2;
     char texto[6];
     ADCON1 = 0b00001100;
     Lcd_Init();
     
     while(1){
              POT1 = ADC_Read(0);
              POT2 = ADC_Read(1);
              
              WordtoStr(POT1, texto);
              lcd_out(1,1,texto);
              
              WordtoStr(POT2, texto);
              lcd_out(2,2,texto);
     }
}