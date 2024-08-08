 // 7 - Fazer um programa que realize a leitura dos dois
// potenciômetros e apareça no LCD os valores em
// porcentagem arredondado.

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
     int porcentagem = (40 * 100) / 1023 ;
     int POT2;
     char texto[6];
     ADCON1 = 0b00001100;
     Lcd_Init();

     while(1){
     
            POT2 = (ADC_Read(1) * 100) / 1023;
            WordtoStr(POT2, texto);
            Lcd_Out(1, 1, "POT: ");
            Lcd_Out(1, 6, texto);
            Lcd_Out(1, 11, "%");
            
            if(POT2 < porcentagem){
                    Lcd_Out(2,1, "APROVADO" );
                    Lcd_Out(3,1, "Reprovado");
            }

     }
}