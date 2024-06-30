bits 64
default rel					; SysB ABI for x86-64 uses RIP effective addresses

section .text
global _start
_start:
   mov eax, 1					; system write
	mov edi, eax				; write to stdout
	lea rsi, [msg]				; LEA cuz effective address should be RIP relative
	mov edx, msg_len			; bytes to write
	syscall						; system call

	mov eax, 60					; system exit
	xor edi, edi				; exit value
	syscall						; system call

	section .rodata

	msg: db "Hello world!", 10
	msg_len equ $ - msg

