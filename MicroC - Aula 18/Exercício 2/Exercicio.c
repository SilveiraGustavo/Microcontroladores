 // 2- Fazer um programa que caso aperte o botão RB5 o
// conjunto de LED2 acenda os leds pares do menos
// para mais significativo. Considere atraso de meio
// segundo.
void main() {
    int i;
    int aux = 0b00000000;
    TRISB = 0b00100000;
    TRISD = 0;
    PORTD = 0;
    PORTA = 0;
    TRISA = 0b00111100;
    
    while(1){
        if(Button(&PORTB, 5,1,0) == 255){
             for (i = 0; i < 8; i += 2) {  // LEDs pares: 0, 2, 4, 6
                PORTD |= (1 << i);  // Acende o LED par
                delay_ms(500);  // Atraso de meio segundo
            }
        }
    }
}