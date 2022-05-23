%define dest rdi
%define src rsi
%define i rcx
%define tmp rbx

section .text
	use64
	global _ft_strcpy
_ft_strcpy:
	PUSH	rbp ; classic init
	MOV		rbp, rsp ; classic init
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
