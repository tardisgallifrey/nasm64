;---------------------------------------------------------------------
; console program that writes a triangle of asterisks.
;---------------------------------------------------------------------

			global	_start
			section	.text							; code goes here

_start:	mov		rdx, output					; address of next byte to write in rdx
			mov		r8, 1							; initial line length
			mov		r9, 0							; number of starts written on line so far

line:		mov		byte [rdx], '*'			; write a star
			inc 		rdx							; advance pointer to next cell to write
			inc		r9								; "count" number so far on line
			cmp		r9, r8						; test if reached number for this line
			jne		line							; if not equal, jump back to line

lineDone:	
			mov		byte [rdx], 10				; new line. make rdx hold a byte integer 10
			inc 		rdx							; move pointer to next char location
			inc		r8								; next line is one char longer
			mov 		r9, 0							; reset count of stars on this line
			cmp		r8, maxlines				; test if finished last line
			jng		line							; if not finished, begin writing the line

done:		mov		rax, 1						; system call for write
			mov		rdi, 1						; 1 is stdout
			mov		rsi, output					; address of string to output
			mov		rdx, dataSize				; number of bytes to write
			syscall									; perform write

			mov		rax, 60						; sys call to exit
			xor		rdi, rdi						; exit code 0
			syscall									; exit

			section	.bss							; bss is variable space, reserved vars
maxlines	equ		8								; maxlines = 8
dataSize	equ		44								; dataSize = 44
output:	resb		dataSize						; reserve an array of bytes equal to dataSize

