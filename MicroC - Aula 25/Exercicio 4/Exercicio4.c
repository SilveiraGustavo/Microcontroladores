//4 � Fazer um programa que:
// � apertar o bot�o RB0 o cooler liga em 25%;
// � apertar o bot�o RB1 o cooler liga em 50%;
// � apertar o bot�o RB2 o cooler liga em 75%;
// � apertar o bot�o RB3 o cooler liga em 100%;
// � Se o cooler ficar ligado por mais de 5 segundos no
// 100% um alarme sonoro deve ser ativado.
void main() {
     int aux = 0;
     TRISB = 0b00001111; // CONFIGURANDO OS BOT�ES UTILIZADOS
     TRISC = 0; // CONFIGURANDO A PORTA C COMO SA�DA.
     PWM1_Init(5000);
     PWM1_Start();
     
     while(1){
          if(Button(&PORTB,0,1,0) == 255){
               Pwm1_Set_Duty(63);
          }else if(Button(&PORTB,1,1,0) == 255){
                Pwm1_Set_Duty(127);
          }else if(Button(&PORTB,2,1,0) == 255) {
                Pwm1_Set_Duty(191);
          }else if(Button(&PORTB,3,1,0) == 255){
                Pwm1_Set_Duty(255);
          }
     }
     
}