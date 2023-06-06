; Comparações de Valores Aula 03
;tabela de constantes:
; LF
; equ 0xA ; Line Feed
; NULL  equ 0xD ; Final da String
; SYS_EXIT equ 0x1 ; Codigo de chamada para finalizar
; RET_EXIT equ 0x0 ; Operacao com Sucesso
; STD_IN
; equ 0x0 ; Entrada padrao
; STD_OUT
; equ 0x1 ; Saida padrao
; SYS_READ equ 0x3 ; Operacao de Leitura
; SYS_WRITE equ 0x4 ; Operacao de Escrita
; SYS_CALL equ 0x80 ; Envia informacao ao SO



segment .data
LF      equ 0xA      ; LINE FEED
NULL    equ 0xD      ; Final da String
SYS_CALL equ 0x80    ; Envia Informação ao SO.

; EAX:
SYS_EXIT equ  0x1    ; Codigo da chamada para finalizar
SYS_READ  equ 0x3    ; Operação de Leitura.
SYS_WRITE equ 0x4    ; Operação de escrita.
; EBX:
RET_EXIT equ  0x0    ; Operação Realizada com sucesso Retorno 0
STD_IN  equ   0x0    ; Entrada Padrão
STD_OUT equ   0x1    ; Valor de Saida Padrão

; Criaremos valores para ficarmos comparando todos eles:
;------------------------------------------------------------------------------------------------
; 1° db - alocação de 8 bytes - 
; 2° dw - alocação de 16 bytes
; 3° db - alocação de 32 bytes
; 4° dq - alocação de 64 bytes
; 5° dt - alocação de 128 bytes

section .data 
    
    x dd 50 ; 
    y dd 10 ;
    msg1  db 'X e maior que Y', LF, NULL
    tam1 equ $ - msg1
    msg2 db 'Y e maior que X', LF, NULL
    tam2 equ $ - msg2

section .text

global _start
; Lembrando: Quando estamos movendo ponteiros que estão dentro da section data para os registradores
    ; Qualquer movimentação da Data pra cá devemos mover para os registradrores.
    ; fazendo as movimentações dos registradores
    ; Temos que mover o ponteiro da definition World para dentro do meus registradores EAX, e EBX
    ; Dessa forma:


_start:
    ; declaração de constantes:
    mov EAX, DWORD[x]
    mov EBX, DWORD[y]
    ;if de comparação:
    ;$ cmp registrador1, registrador2  ou podemos fazer cmp EAX, EBX
    ;Como estou movendo os valores de x e y para os registradores.
    ; Ele esta pegando um registrador, colocando outro na fila, e olhando para os dois
    
    
    cmp EAX,EBX ; vamos dizer agora a forma como vamos comparar EAX > EBX

    jge maior ;EAX >= EBX
    mov ECX, msg2
    mov EDX, tam2
    ; Podemos chamar de Salto conficional:
    ; je: = jg: > jge: >= jl: < jge: <= jne: !=
    jmp final
    ; Salto incomdicional jmp
    maior:
        mov ECX, msg1
        mov EDX, msg1

    final:
        mov EAX, SYS_WRITE
        mov EAX, STD_OUT
        int SYS_CALL

        


    int SYS_CALL

saida:

 
    int SYS_CALL

; programa finalizado.



