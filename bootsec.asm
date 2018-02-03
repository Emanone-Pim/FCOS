;************************************************************

; Author: Emanone

; Description: boot sector n1

; Date: 03-02-2018

; File: bootsec.asm

;************************************************************

bits 16 

org 0x7C00 

start: 

jmp entry

printmsg db "Emanone-Pimthepoi",0 

;************************************************************

printf: 

lodsb 

or al, al 

jz done 

jmp print

print: 

mov ah,0Eh

int 10H 

jmp printf 

done: 

ret

entry:

xor ax, ax


mov ds, ax

mov es, ax 

mov si, printmsg 

call printf 


mov ax, 0x2401

int 0x15 


mov eax,cr0 

or eax, 1 

mov cr0,eax 

cli

hlt

times 510 - ($-$$) db 0 

dw 0xAA55     
