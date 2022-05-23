%define str rdi
%define i rcx

section .text
	use64
	global _ft_strlen

_ft_strlen:
	PUSH	rbp ; classic init
	MOV		rbp, rsp ; classic init
	cmp		str, 0 ; if (str == NULL)
	je		null_return ; return 0
	xor		i, i ; i = 0
while:
	cmp		byte [str + i], 0 ; if (str + 1 == 0)
	je		return ; return
	inc		i ; i++
	jmp		while ; continue
return:
	mov		rax, i ; ret = i
	leave ; clear
	ret ; return ret
null_return:
	mov		rax, 0 ; ret = 0
	leave ; clear
	ret ; return ret
