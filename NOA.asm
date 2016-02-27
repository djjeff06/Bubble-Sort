global _bubblesort
;extern _printf, _system, _scanf, _gets, _getchar

section.text
_bubblesort:
	push INPUT
	push SORTBY
	add esp, 8
	; might need to add ebx, 04h here...
	lea  eax, INPUT
	
	DOLOOP:
	cmp  [eax], 00h
	je   exit
	
	move ecx, eax
	inc  ecx
	cmp  [ecx], 00h
	je   exit
	
	cmp  [SORTBY], 00h
	je   SORTABOVE
	jmp  SORTBELOW
	
	; above
	SORTABOVE:
	cmp  [eax], [ecx]
	jg   SKIP
	xchg [eax], [ecx]
	lea  eax, INPUT
	jmp  SKIP
	
	; below
	SORTBELOW:
	cmp  [eax], [ecx]
	jl   SKIP 
	xchg [eax], [ecx]
	lea  eax, INPUT
	SKIP:
	
	inc  eax
	jmp  DOLOOP
	
	exit:
	ret

	
section.data:
INPUT  db "holy shit19368264"13,10,0; the array
SORTBY db 01h; boolean 1 = arrange greater, 0 = arrange lesser