%define s1 rdi
%define s2 rsi
%define tmp rbx
%define tmp_b r8b

global _ft_strcmp

_ft_strcmp:
	push	rbp ; classic init
	mov		rbp, rsp ; classic init
while:
	cmp		byte [s1], 0 ; if (*s1 == 0)
	je		return ; return
	mov		tmp_b, byte [s1] ; tmp_b = *s1
	cmp		tmp_b, byte [s2] ; if (tmp_b == *s2)
	jne		return ; return not if
	inc		s1 ; s1++
	inc		s2 ; s2++
	jmp		while ; continue
return:
	movzx   rax, byte [s1] ; ret = *s1
	movzx   tmp, byte [s2] ; tmp = *s2
	sub		rax, tmp ; ret -= tmp
	leave ; clear
	ret ; return ret
