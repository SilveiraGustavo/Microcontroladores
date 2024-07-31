// 5 - Fazer um programa que ao apertar o botão RB5,
// acenda todos os displays com o valor 8.


void main() {
   int element =  0b01111111; // 8
   int i;
   TRISD = 0;  //Configurando a Porta D como saída
   TRISA = 0; //COnfigurando a porta A como saída
   TRISB = 0b00100000;
   PORTA = 0b00111100;
   
   
   while(1){
    if(Button(&PORTB, 5,1,0) == 255){
       PORTD = element;
       delay_ms(1000);
    }
   }
   
}