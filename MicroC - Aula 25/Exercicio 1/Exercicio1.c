// 1 – Ler o canal AN0 (potenciômetro 1) e configurar o
// PWM1 com o valor lido neste canal. Imprimir o valor do
// AN0 no LCD. Considerar uma frequência de 5kz para o
// PWM.

// Definições para o LCD
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
     int POT1;
     char texto[6];
     ADCON1 = 0b00001110;
     Lcd_Init();
     Pwm1_init(5000);
     PWM1_Start();
     
     while(1){
         POT1 = ADC_Read(0);
         PWM1_Set_Duty(POT1);
         WordtoStr(POT1, texto);
         Lcd_out(1,1,"Potênciometro" );
         Lcd_out(2,1,texto);
     }
}