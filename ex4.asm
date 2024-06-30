;------------------------------------------------------
; performing a loop
;------------------------------------------------------

bits 64
			default	rel
			global	_start
			section	.text
_start:	mov		edi, 1
  			mov		ecx, 4
label:	add		edi, edi
			dec		ecx
			cmp		ecx, 0
			jg			label
			mov		eax, 60
			syscall
