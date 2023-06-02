; Comparações de Valores Aula 03

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
    
    x dd 50 ; Define Double world
    y dd 10 
