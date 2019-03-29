section	.text
global func

func:
    push	ebp
    mov		ebp, esp

    mov		eax, [ebp+12]   ; load output address in eax
    mov 	ecx, [ebp+8]	; load input address in ecx

loop:
    cmp 	byte [ecx], 0	; compare to 0
    je 		continue	; jump if equal
    cmp		byte [ecx], 'A'
    jl		checkIfNumber
    cmp		byte [ecx], 'Z'
    jg		checkIfSmallChar	
    mov		dl, byte [ecx]
    mov		byte [eax], dl
    inc		eax
    inc		ecx
    jmp		loop

checkIfNumber:
    cmp		byte [ecx], '0'
    jl		skip
    cmp		byte [ecx], '9'
    jg		skip
    mov		dl, byte [ecx]
    mov		byte [eax], dl
    inc		eax
    inc		ecx
    jmp		loop

checkIfSmallChar:
    cmp		byte [ecx], 'a'
    jl		skip
    cmp		byte [ecx], 'z'
    jg		skip
    mov		dl, byte [ecx]
    mov		byte [eax], dl
    inc		eax
    inc		ecx
    jmp		loop

skip:
    inc		ecx
    jmp		loop

continue:
    mov		dl, 0
    mov		byte [eax], dl
    mov		eax, [ebp+12]   ; load output address in eax
    mov 	ecx, [ebp+8]	; load input address in ecx

loop2:
    cmp 	byte [eax], 0	; compare to 0
    je		continue2
    mov		dl, byte [eax]
    mov		byte [ecx], dl
    inc		eax
    inc		ecx
    cmp 	byte [eax], 0	; compare to 0
    je		continue2
    inc 	eax
    jmp 	loop2

continue2:
    mov		eax, [ebp+12]   ; load output address in eax
    inc		eax

loop3:
    cmp 	byte [eax], 0	; compare to 0
    je		continue3
    mov		dl, byte [eax]
    mov		byte [ecx], dl
    inc		eax
    inc		ecx
    cmp 	byte [eax], 0	; compare to 0
    je		continue3
    inc 	eax
    jmp 	loop3

continue3:
    mov		dl, 0
    mov		byte [ecx], dl
    mov		eax, [ebp+12]   ; load output address in eax
    mov 	ecx, [ebp+8]	; load input address in ecx

loop4:
    cmp 	byte [eax], 0	; compare to 0
    je		exit
    mov		dl, byte [ecx]
    mov		byte [eax], dl
    inc		eax
    inc		ecx
    jmp 	loop4

exit:
    mov 	esp, ebp		; restore original stack pointer
    pop 	ebp			; restore "calling procedure" frame pointer
    ret
