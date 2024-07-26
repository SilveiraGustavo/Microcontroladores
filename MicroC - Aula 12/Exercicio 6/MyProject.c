// 6 – Fazer um programa que fique piscando
// infinitamente, colocar atraso de 2 segundos ao
// acender e ao apagar.

void main() {
     TRISD = 0;   //Configurando a porta D como saída
     while(1){
              PORTD = 255;
              delay_ms(2000);
              PORTD = 0;
              delaY_ms(2000);
     }
}