// 5 - Fazer um programa que ao apertar o bot�o RB5,
// acenda todos os displays com o valor 8.


void main() {
   int element =  0b01111111; // 8
   int i;
   TRISD = 0;  //Configurando a Porta D como sa�da
   TRISA = 0; //COnfigurando a porta A como sa�da
   TRISB = 0b00100000;
   PORTA = 0b00111100;
   
   
   while(1){
    if(Button(&PORTB, 5,1,0) == 255){
       PORTD = element;
       delay_ms(1000);
    }
   }
   
}