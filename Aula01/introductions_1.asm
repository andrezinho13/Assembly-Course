section .data ; -- Normalmente colocamos todas as sections [constantes]
section .bss ;  -- Colocamos todas as nossas variaveis, coisas que vamos modificar
section .text ; -- começa o nosso programa!
global _start ; -- Este Label obrigatoriamente deve ter!

_start:
       mov EAX, 0x1    ; --  SO estou terminando o programa
       mov EBX, 0x0    ; --  SO o valor de retorno e 0
       int 0x80        ; --  finalizando
           
