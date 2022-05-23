%define dest rdi
%define src rsi
%define i rcx
%define tmp rbx

global _ft_strcpy

_ft_strcpy:
	push	rbp ; classic init
	mov		rbp, rsp ; classic init
	xor		i, i ; i = 0
while:
	mov		tmp, [src + i] ; tmp = src + i
	mov		[dest + i], tmp ; dest + i = tmp
	cmp		byte [src + i], 0 ; if (src + i == 0)
	je		return ; return
	inc		i ; i++
	jmp		while ; continue
return:
	mov		rax, dest ; ret = dest
	leave ; clear
	ret ; return ret
