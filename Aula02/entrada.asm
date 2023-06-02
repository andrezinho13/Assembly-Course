; Aula de Entrada de Dados:
;-----------------------------------------------------------------------------------------------------------------------
segment .data
LF      equ 0xA      ; LINE FEED
NULL    equ 0XD      ; Final da String
SYS_CALL equ 0x80    ; Envia Informação ao SO.

; EAX:
SYS_EXIT equ  0x1    ; Codigo da chamada para finalizar
SYS_READ  equ 0x3    ; Operação de Leitura.
SYS_WRITE equ 0x4    ; Operação de escrita.
; EBX:
RET_EXIT equ  0x0    ; Operação Realizada com sucesso Retorno 0
STD_IN  equ   0x0    ; Entrada Padrão
STD_OUT equ   0x1    ; Valor de Saida Padrão

section .data
    msg db 'Ola Mundo', LF
    tam equ $- msg

section .text


global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg
    mov edx, tam
    int SYS_CALL
saida:
    mov eax, STD_OUT
    mov ebx, RET_EXIT
    int SYS_CALL
;--------------------------------------------------------------------------------------------------|
; diferença segment .data, para section .data - parte de uma secção.                               | 
; 1° Ao invês de eu utilizar 0xA pra pular uma linha utilizarei LF                                 |
; 2° Ao invês de eu utilizar 0x1 pra SO terminar o Programa utilizarei SYS_EXIT                    |
; 3° Ao invês de eu utilizar 0x0 para SO Retornar o valor de 0 utilizarei RET_EXIT                 |
;--------------------------------------------------------------------------------------------------|
; Modelo de entrada:                                                                               | 
; 4° Ao invês de eu utilizar 0x4 para saida escrita padrão do registrador EAX utilizarei: SYS_WRITE|
; 5° Ao invês de eu utilizar 0x3 para leitura padrão do registrador EAX utilizarei: SYS_READ       | 
; 6° Ao invês de eu utilizar 0x1 para saida para terminar o programa utilizarei: SYS_EXIT saida    |
;--------------------------------------------------------------------------------------------------|
