//4 - Fazer um programa que acenda os leds (um por
//vez) do menos significativo para o mais significativo,
//com um atraso de meio segundo. Após chegar no
//último led fazer o caminho inverso. Utilizar apenas
//duas vezes o comando PORT. Ficar em um loop
//infinito.

void main() {
    int i, j;
    int aux = 0b10000000;
    int aux2 = 0b00000001;
    TRISD = 0;
    
    while(1) {
              for (i = 0; i < 8; i++){
                   PORTD = aux;
                   delay_ms(500);
                   aux >>= 1;
                   
                   if ( i == 7) {
                      for (j = 0 ; j <8 ; j++){
                          PORTD = aux2;
                          delay_ms(500);
                          aux2 <<= 1; 
                          }
                   }
              }
    }
}