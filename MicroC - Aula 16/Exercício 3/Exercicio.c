// 3 – Fazer um programa que acenda os leds um a um do
// mais significativo para o menos significativo, com um
// atraso de meio segundo. Utilizar apenas uma vez o
// comando PORT. Os leds deverão começar apagados.
// Fazer um loop infinito.


void main() {
      int i;
      int aux = 0b10000000;
      TRISD = 0;
      
      while(1){
               for(i = 0; i < 8; i++){
                     PORTD = aux;
                     delay_ms(500);
                     aux >>= 1;
               }
               aux = 0b10000000;
      }
}