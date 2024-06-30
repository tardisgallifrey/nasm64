;-------------------------------------------------------------------------
; Writes "Hola, mundo" to the console using a C library, linux only
; 
; compile with compToC
;-------------------------------------------------------------------------

			global	main						; C's main function. gcc sets _start
			extern	puts						; declare C's puts as external

			section	.text
main:		mov		rdi, message			; give rdi address of first byte in message
			call		puts						; call puts from C lib (put string)
			ret									; return from main back to C lib

message:	db			"Hola, mundo", 0		; null terminated string
													; puts automatically adds line feed

