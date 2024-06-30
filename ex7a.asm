;-------------------------------------------------------------
; function call in assembler
;
; add in start of function prologue and epilogue
;-------------------------------------------------------------

;-------------------------------------------------------------
;  function prologue is:
;					push 	rbp
;					mov 	rbp, rsp
;					sub 	rsp, 2
;
;  function epilogue, before ret is:
;					mov 	rsp, rbp
;					pop 	rbp
;---------------------------------------------------------------
bits 64								; mark as 64 bit program, even if 32 bit used
			default	rel			; 


			section	.bss			; declared but not initialized vars

			section	.data			; declared and initialized vars

			global	_start		; declare start point
			section .text			; code section
_start:	call	func				; start and call func function
			mov	rax, 60			; set 64 bit exit call
			xor 	rdi, rdi			; 64 bit set exit code
			syscall					; do a system call (exit)


func:		push 	rbp						; save base pointer
			mov	rbp, rsp					; put stack pointer in base pointer (preserve stack)
			sub 	rsp, 2					; subtrack 2 from stack ptr to allocate space
			mov	[rsp], byte 'H'		; load H into stack
			mov 	[rsp + 1], byte 'i'	; load i at next location in stack
			mov	[rsp + 2], byte 10   ; load \n at next location in stack
			mov	rax, 1					; 64 bit system write file call
			mov	rdi, 1					; 64 bit write to stdout
			mov	rsi, rsp					; 64 bit location of bytes to write
			mov	rdx, 3					; 64 bit number of bytes to write
			syscall							; call the write system call
			mov 	rsp, rbp					; restore stack pointer
			pop	rbp						; restore base pointer value
			ret							   ; return to one ip after we left
						
