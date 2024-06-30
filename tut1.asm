;---------------------------------------------------------------------
; Writes "Hello, World!" to the console using only system calls
; Runs on 64-bit Linux only
; --------------------------------------------------------------------

; asm is column oriented

;labels	instr-	operands				comments
;			uctions
			global	_start

			section	.text
_start:	mov 		rax, 1				; system call for write
			mov 		rdi, 1				; stdout goes in destination index (di)
			mov 		rsi, message		; address of first byte of message goes in source index (si)
			mov 		rdx, 14				; number of bytes to write
			syscall							; invoke system call to write

; program exit
			mov 		rax, 60				; put exit instruction in rax
			xor 		rdi, rdi				; set rdi to 0 now
			syscall							; system call, not the same as int 0x80

			section	.data
message 	db 		"Hello, World!", 10		; message with newline (10)

