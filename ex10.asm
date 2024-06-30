; printf1_64.asm print na integer from storage and from a register
; Assemble: 	nams -f elf64 -l printf1_64.lst printf1_64.asm
; Link: 			gcc -o printf1_64 printf1_64.o
; Run: 			you know how

; Equivalent C code
; /* printf1.c print a long int, 64-bit and an expression */
; #include <stdio.h>
; int main()
; {
;    long int a=5;
;    printf("a=%ld, rax=%ld\n", a, a+2};
;    return 0;
; }

; Beginning
global main

; Declare external function
extern printf									; C function to be called

section .data
   a: dq 5										; long int a=5
	fmt: db "a=%ld, rax=%ld", 10, 0		; The format, newline, \0

section .text
main:
   push rbp										; prologue
	mov rax, [a] 								; put contents of a in rax
	add rax, 2									; add 2 to contents of rax
	mov rdi, fmt								; load printf format string
	mov rsi, [a]								; 1st printf param
	mov rdx, rax								; 2nd printf param
	mov rax, 0									; no xmm registers
	call printf									; call C lib printf function
	pop  rbp										; epilogue
	mov rax, 0									; exit code for main function
	ret

