global _ft_strdup
extern _ft_strlen
extern _ft_strcpy
extern _malloc

; rdi (1 first arg), rsi (2)
_ft_strdup:
	push	rbp ; classic init
	mov		rbp, rsp ; classic init
	mov		rbx, rdi; tmp = str // first param
	call	_ft_strlen ; call strlen
	mov		rdi, rax ; first param = return strlen
	inc		rdi ; firt param++
	call	_malloc ; call malloc(first param)
	cmp		rax, 0 ; if (malloc == NULL)
	je		error_malloc ; return NULL
	mov		rdi, rax ; second param = return malloc
	mov		rsi, rbx ; first param = tmp // save first line
	call	_ft_strcpy ; call strcpy
	leave ; clear
	ret ; return strcpy
error_malloc:
	mov		rax, 0 ; ret = NULL
	leave ; clear
	ret ; return