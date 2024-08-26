// 3 – Fazer um programa que ao apertar o botão RB5
// aciona o alarme sonoro.

void main() {
     TRISB = 0b00100000;
     TRISC = 0;
     
     while(1){
          if(Button(&PORTB, 5,1,0) == 255) {
             PORTC.F1 = 1;
          }
     }

}