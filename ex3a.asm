;--------------------------------------------------------
; use of comp and jmp to do conditional jumps
;
; since the contents of ecx is less than 100,
; the Jump if Less than will occur because 
; cmp sets the condition "less than" because
; 99 < 100.
;---------------------------------------------------------

bits 64

			default	rel
			global	_start
			section	.text

_start:	mov		ecx, 99		; load CX with 99
			mov		edi, 42		; exit code into edi
			mov		eax, 60		; exit call
			cmp		ecx, 100		; compare 99 to 100
			jl			skip			; if 99 < 100, then goto skip
			mov		edi, 13		; exit code is 13 if ecx > 100
skip:		syscall					; perform system call

