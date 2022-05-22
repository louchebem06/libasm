BITS 64
; rdi is first argument
; rbx is general register
; rax is return value

ft_strlen:
	global ft_strlen
	push rbp ; open scope
	mov rbp, rsp ; copy stack in scope
	mov rbx, 0
	mov rax, rbx
	leave ; clear register in function
	ret