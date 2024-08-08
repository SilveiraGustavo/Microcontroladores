#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 23/Exercicio 6/Exercicio6.c"
#line 13 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/MicroC - Aula 23/Exercicio 6/Exercicio6.c"
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
 int valorADC;
 float temperatura;
 char texto[16];
 int atuador_ligado = 0;

 TRISC = 0;
 PORTC = 0;
 ADCON1 = 0b00001100;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 while(1){
 valorADC = ADC_Read(2);
 temperatura = (valorADC * 5.0 / 1023.0) * 100.0;


 if (temperatura >= 40.0) {
 PORTC = 0b00000100;
 atuador_ligado = 1;
 }


 if (temperatura <= 35.0) {
 PORTC = 0;
 atuador_ligado = 0;
 }


 FloatToStr(temperatura, texto);
 Lcd_Out(1, 1, "Temp:");
 Lcd_Out(1, 6, texto);
 Lcd_Out(1, 12, "C");


 if (atuador_ligado) {
 Lcd_Out(2, 1, "Atuador: Ligado ");
 } else {
 Lcd_Out(2, 1, "Atuador: Deslg ");
 }

 Delay_ms(500);
 }
}
