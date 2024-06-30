;-------------------------------------------------------------
; function call in assembler
;-------------------------------------------------------------
bits 64								; mark as 64 bit program, even if 32 bit used
			default	rel			; 


			section	.bss			; declared but not initialized vars

			section	.data			; declared and initialized vars

			global	_start		; declare start point
			section .text			; code section
_start:	call	func				; start and call func function
			mov	eax, 60			; set 64 bit exit call
			syscall					; do a system call (exit)


func:		mov	edi, 42				; set exit code in edi (or rdi)
			ret							; return to one ip after we left
						
