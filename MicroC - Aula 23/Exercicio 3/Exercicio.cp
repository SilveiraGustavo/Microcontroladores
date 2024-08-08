#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 23/Exercicio 3/Exercicio.c"


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

void main() {
 int sensor;
 char texto[6];
 ADCON1 = 0b00001100;
 Lcd_Init();

 while(1){
 sensor = ADC_Read(2) / 2;
 WordtoStr(sensor,texto);
 Lcd_out(1,1, "Sensor :");
 Lcd_out(1,8,texto);
 }
}
