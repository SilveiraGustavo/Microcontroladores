// 6 - Fazer um programa que ao apertar o botão RB5
// pela primeira vez, acenda o display 1 com o
// numero 0. Ao apertar o botão RB5 pela segunda
// vez, acenda o display 1 e 2 com o numero 0. Tempo
// de 1segundo

void main() {
   int clicks = 0;
   TRISD = 0;
   TRISA = 0;
   TRISB = 0b00100000;

   while(1){
       if(Button(&PORTB,5,1,0) == 255){
           clicks++;
           if(clicks == 1){
                     PORTA = 0b00000100;
                     PORTD = 0b00111111;
           }else if ( clicks == 2){
                    PORTA = 0b00001100;
                    PORTD = 0b00111111;
           }
           delay_ms(1000);
       }
   
   }
   
}