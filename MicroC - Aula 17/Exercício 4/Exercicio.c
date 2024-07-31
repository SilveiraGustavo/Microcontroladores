// 4- Fazer um programa que ao apertar o botão RB5,
// acenda os leds do conjunto 1 (LED1) de forma
// crescente. Ao apertar o botão pela segunda vez,
// acenda os leds do conjunto 2 (LED2) de forma
// decrescente.

void main() {
     int i;
     int clicks = 0;
     TRISD = 0;
     TRISB = 0b00100000;


     while(1){
        if(Button(&PORTB,5,1,0) == 255){
           clicks++;

           if (clicks == 1){
              for(i = 0; i < 8; i++){
                PORTD |= 1 << i;
                delay_ms(100);
              }
           }
           else if( clicks == 2){
                TRISB = 0;

                for (i = 8; i >= 0; i--){
                   PORTB |= 1 <<  i;
                   delay_ms(100);
                }
           }
        }
     }
}