// 2- Refazer o programa anterior configurando o canal AN0
// em porcentagem e de acordo com a porcentagem do
// canal passar o valor para o PWM1. Exemplo se o AN0
// estiver em 50%, o PWM1 ter� um duty cycle de 50%.
// Imprimir o valor da porcentagem no LCD. Considerar uma
// frequ�ncia de 5kz para o PWM.

// Defini��es para o LCD
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// Dire��o dos pinos do LCD
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
     PWM1_Init(5000);
     Lcd_Init();
     PWM1_Start();
     
     while(1){
         POT1 = ADC_Read(0) / 10.23;
         PWM1_Set_Duty(POT1 * 2.55);
         WordtoStr(POT1, texto);
         Lcd_out(1,1,"Pot�nciometro" );
         Lcd_out(2,1, texto );
         
     }
}