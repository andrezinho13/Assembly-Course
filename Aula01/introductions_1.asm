section .data
       msg db 'Hello World!', 0xA, 0XD ; 0xA corresponde a Quebra de Linha Line Feed.
       tamA equ $- msg            ; equ -> esta afirmando que "tam" e uma constante
       msgA db 'Rebecca Rodrigues!', 0xA
       tamB equ $- msgA
       msgB db 'Melissa Rodrigues!', 0xA
       tamC equ $- msgB
       msgC db 'Erica Cavalcanti Rodrigues', 0xA
       tamD equ $- msgC
      

section .text

global _start

_start:
  mov eax, 0x4    ; SYS_WRITE registradores EAX: 0x3: para operações de Leitura, 0x4 para operações de escrita 
  mov ebx, 0x1    ; SYSTEM.OUT
  mov ecx, msgC   ; contém p conteudo em caractere que vamos mostrar no caso const: msgA
  mov edx, tamD ; Quantidade de caracteres que serão mostrada - msgA
  int 0x80

; Posso colocar em tamB um valor que corresponde a 5 em Hexadecimal, no caso 0x5
saida:
  mov eax, 0x1 ; SO estou terminando o programa
  mov ebx, 0x0 ; SO o valor de retorno e 0
  int 0x80     ; Terminando e processando.
;------------------------------------------------------------------------------------------------------|
; section .data: colocamos as constantes.                                                              |
; section .bss:  colocamos todas as nossas variaveis                                                   |
; section. text: junto com a .text global _start -> teremos um ponteiro chamado _start:                |
; _start:      : Ponto de Entrada, para iniciar neste ponto.                                           |
;------------------------------------------------------------------------------------------------------|
; Usaremos a mov: que significa movimentação de valores                                                |
; vamos mover para o registrador EAX, 1 vou mandar pra dentro do registrador.                          |
; siginifica: destino, origem, EAX = 1                                                                 |
; Alguns registradores, são escritos em bases Hexadecimais.                                            |
; entendendo as transposições de bases:                                                                |
; 0 1 2 3 4 5 6 7 8 9 A B C D E F 10 - (representa o numero 16) o numero 10 e a letra A em Hexadecimal |
; NOTA: toda vez que mandamos um: int 0x80 "O sistema operacional pega todas as movimentações que fez" |
; e Execulta - e assim que o assembly trabalha. pega essa informação e processa.                       |
;------------------------------------------------------------------------------------------------------|
; 1° Eu preciso Compilar: nasm -f elf64 introductions_1.asm                                            |
; 2° Ele ira gerar um arquivo introductions_1.o                                                        |
; 3° ld -s -o introductions introductions_1.o - Linkeditarndo o arquivo: introductions_1.o             |                                                                                                 |
; 4° Gera um arquivo: ./introductions e exibe a mensagem na tela.                                      |                                                               |  
;------------------------------------------------------------------------------------------------------|  
