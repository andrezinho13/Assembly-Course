; inicializando com Assembly:

; 1° -  Existe uma outra secção chamada:            Section.Bss -  Colocamos todas as nossas variaveis;̣
; 2° -  Ele e definido em  Seções. necessita de     Section.Data - Colocamos as constantes;
; 3° -  Temos uma outra section chamada             Section.text - Aqui que começa nosso programa
; 4° -  Agora junto com esta Global colocamos       Global_start - Você vai ter um Ponteiro (label) esse tenque existir. (execulta o ponto start)
; 5° -  Um label em Assembly e definido pelo nome   _start - (label e definida)

;-----------------------------------------------------------------------------------------------------

; vamos ultilizar aqui 02 registradores:
; Que serão os seguintes:
; - mov - estamos fazendo uma movimentação de valores, vamos mover para o registrador eax. 1 - movendo o valor 1 - pra dentro do registrador eax

section .data ; Constantes - criando um apontamento.
    msg db 'Hello World!', 0xA, 0xD
    tam equ $- msg ; para saber o tamanho, usamos $- (e a constante) no caso msg
    msgC db 'Hello World!'
    
section .bss

section .text

Global _start

_start:

mov EAX, 0x4
mov EBX, 0x1
; Temos mais 02 registradores:
mov ECX, msg ; Vai ganhar a minha mensagem.
mov EDX, tam ; vai ganhar o tamanho da minha mensagem
int 0x80 ;SO cambio executa;

; destino, origem:
mov EAX, 0x1 ; SO estou finalizando o programa! 
             ; Base Hexa decimal em Assembly e representada por 0x na frente.
mov EBX, 0x0 ; QSO o valor de retorno e 0.
int 0x80     ; no final eu escrevo um init e o valor 80 em hexadecimal.

;OBS: O sistema operacional pega todas as movimentações que temos e executa.
; Ele manda um bloco de informação, e processa.
;-------------------------------------------------------------------------------------------------

;vamos para o terminal e vamos compilar: comando: nasm -f elf64 hello.asm

; Compilação e você transformar o seu programa, para liguagem de maquina.
; Preciso pegar este programa, e juntar com as bibliotecas do SO e execultar. (linkedir)
; Linkeditar - Transformar o programa em linguagem de maquina para executavel.

; vamos utilizar um linkeditor: ld -s -o hello hello.o



