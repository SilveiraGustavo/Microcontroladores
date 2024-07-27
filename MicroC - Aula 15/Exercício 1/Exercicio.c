// 1 -Configurar a porta D como saída. Utilizar o
// comando PORTD = 0b00000001, copilar o projeto.
// Enviar para o PicSimLab, com a chave acionando o
// display. Após, rotacionar manualmente o 1 para
// esquerda e repetir os passos. Fazer isto até
// 100000000.
// Desta forma definir qual bit da porta D corresponde
// a qual segmento

void main() {
    TRISA = 0;     // configurando a portA como saída para utilizar o display 7
    TRISD = 0;
    PORTD = 1;
    PORTA = 0b00111100;

    delay_ms(1000);
}