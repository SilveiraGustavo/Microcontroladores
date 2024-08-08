#line 1 "C:/Users/gugav/Desktop/Computação/7º Período - Eng.Computação/Microcontroladores/Aula/Exercicio 1/Exercicio.c"

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
 int POT1, POT2, aux = 0;
 char texto[6];
 int soma_realizada = 0;
 ADCON1 = 0b00001100;
 TRISB = 0b00000111;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 while(1) {

 if (Button(&PORTB, 0, 1, 0) == 255) {
 if(soma_realizada == 0){
 POT1 = ADC_Read(0);
 WordToStr(POT1, texto);
 Lcd_Out(1, 1, "POT1:");
 Lcd_Out(1, 7, texto);
 soma_realizada = 1;
 }
 }

 if (Button(&PORTB, 1, 1, 0) == 255) {
 if(soma_realizada == 1){
 POT2 = ADC_Read(1);
 WordToStr(POT2, texto);
 Lcd_Out(2, 1, "POT2:");
 Lcd_Out(2, 7, texto);
 soma_realizada = 0;
 }
 }


 if (Button(&PORTB, 2, 1, 0) == 255 && !soma_realizada) {
 aux = POT1 + POT2;
 WordToStr(aux, texto);
 Lcd_Out(2, 1, "SOMA:");
 Lcd_Out(2, 7, texto);
 delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);

 }


 }
}
