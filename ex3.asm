;------------------------------------------------------
; Davy Wybiral exampe 2.  Use of jump instruction
;
; This is 64 bit, but you can use 32 bit registers, 
; if you do it correctly.  EBX is 32 bit exit code reg,
; but EDI (or RDI) is 64 bit exit code reg.
;
; Also, you load EAX with 60, not 1 to exit.
;------------------------------------------------------

bits 64

			default	rel
			section	.text
			global	_start
_start:	mov		edi, 42
			mov		eax, 60
			jmp		skip
			mov		edi, 13
skip:
			syscall
