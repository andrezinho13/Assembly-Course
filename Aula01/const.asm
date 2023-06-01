; Compilar - Transformar o programa para linguagem de maquina
;   nasm -f elf64 fixar.asm
; linkeditar - Transformar o programa em liguagens de maquinas para um executavél
;   ld -s -o fixar fixar.o

section .data ; ----Declarando constantes---
    msg db 'Hello world'
    tam equ $- msg

section .text

global _start

_start:
    mov EAX, 0x1 ;SO estou terminando o meu programa
    mov EBX, 0x0 ;SO o valor de retorno e 0
    int 0x80