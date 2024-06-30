;------------------------------------------------------------------
; A 64 bit Linux application that writes the first 90 fibonacci
; numbers. 
;
; Use comp64
;-------------------------------------------------------------------

				global main
				extern printf

				section .text

main: 		push		rbx					; we have to save this since we use it (??)
				mov 		ecx, 90				; ecx will count down to 0
				xor		rax, rax				; rax will hold the current number
				xor		rbx, rbx				; rbx will hold the next number
				inc		rbx					; rbx starts at 1

print:		; We need to call printf, but we already use rax, rbx, and rcx; 
				; needed by printf.  So, we will save these before the call and
				; restore them afterwards.

				push 		rax					; push to stack
				push		rcx					; push to stack
				mov		rdi, format			; 1st param is format string
				mov 		rsi, rax				; 2nd param (current number)
				xor		rax, rax				; cuz printf is varargs (??)

				; Stack is already aligned because we pushed three 8 byte registers
				call		printf

				pop		rcx					; get rcx back
				pop 		rax					; get rax back

				mov		rdx, rax				; save current number
				mov 		rax, rbx				; next number is now current
				add		rbx, rdx				; get the next number 
				dec		ecx					; count down
				jnz		print					; if not done counting, do more

				pop 		rbx					; restore rbx before returning
				ret

format:		db			"%20ld", 10, 0
