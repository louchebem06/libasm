%define SYS_READ 0
global _ft_read
extern __errno_location
;rdi (1 first arg), rsi (2), rdx (3)
_ft_read:
	push	rbp ; classic init
	mov		rbp, rsp ; classic init
	mov		rax, SYS_READ ; ret = read()
	syscall ; call system
	cmp rax, 0 ; if return < 0
  	jl errno ; goto errno
	leave ; clear
	ret ; return
errno:
	neg rax
	mov rdi, rax ; value READ in first arg
    call __errno_location ; call error()
	mov [rax], rdi ; errno = return read
	mov rax, -1 ; ret = -1
	leave ; clear
	ret ; return
