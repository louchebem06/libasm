%define str rdi
%define i rcx

global _ft_strlen

_ft_strlen:
	push	rbp ; classic init
	mov		rbp, rsp ; classic init
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
