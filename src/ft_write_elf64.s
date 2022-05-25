%define SYS_WRITE 1
global _ft_write
extern __errno_location
;rdi (1 first arg), rsi (2), rdx (3)
_ft_write:
	push	rbp ; classic init
	mov		rbp, rsp ; classic init
	mov		rax, SYS_WRITE ; ret = write()
	syscall ; call system
	cmp rax, 0 ; if return < 0
  	jl errno ; goto errno
	leave ; clear
	ret ; return
errno:
	neg rax
	mov rdi, rax ; value WRITE in first arg
    call __errno_location ; call error()
	mov [rax], rdi ; errno = return write
	mov rax, -1 ; ret = -1
	leave ; clear
	ret ; return
