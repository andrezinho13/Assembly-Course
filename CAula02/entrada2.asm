;Metodo de Entrada:
;-----------------------------------------------------------------------------------------------------------------------
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

; Metodo de entrada de dados:
section .data
    msg db 'Entre com o seu nome', LF, NULL
    tam equ $- msg

; Agora precisamos de uma section para armazenar variaveis:
section .bss
    nome resb 1
; Criamos uma variavel chamada: NOME e disse que ela e do tipo BYTES.

section .text

global _start

_start:

mov eax, SYS_WRITE
mov ebx, STD_OUT
mov ecx, msg
mov edx, tam
int SYS_CALL
; Note que a movimentação de entrada e quase a mesma coisa, copiaremos os blocos:

mov eax, SYS_READ
mov ebx, STD_IN
mov ecx, nome ;msg -> ;aqui não sera nossa msg que esta em section .data e sim a variavél nome
mov edx, 0xA ; não e necessario colocar o tamanho da variavel, e sim quanto ela irá pegar
int SYS_CALL
saida:

mov eax, SYS_EXIT
mov ebx, RET_EXIT
int SYS_CALL
