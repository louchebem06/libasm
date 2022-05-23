section .text
	use64
	global _ft_strlen

_ft_strlen:
	PUSH	rbp ; classic init
	MOV		rbp, rsp ; classic init
	cmp		rdi, 0 ; check if first arg is null
	je		null_return ; return 0
	xor		rcx, rcx ; counter = 0
while:
	cmp		byte [rdi + rcx], 0 ; arg[0] == 0
	je		return ; return
	inc		rcx ; counter++
	jmp		while ; continue
return:
	mov		rax, rcx ; ret = counter
	leave ; clear
	ret ; return ret
null_return:
	mov		rax, 0 ; ret = 0
	leave ; clear
	ret ; return ret
