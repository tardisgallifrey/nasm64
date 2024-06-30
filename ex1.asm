bits 64									; set for 64 bit mode
			default	rel								; something about RIP addresses

			section	.text
			global	_start
_start:
   		mov eax, 60					; system exit
   		mov edi, 42					; exit code?
			syscall

