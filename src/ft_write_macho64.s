%define MACH_SYSCALL(nb)	0x2000000|nb
%define WRITE				4

global _ft_write
extern ___error
;rdi (1 first arg), rsi (2), rdx (3)
;https://webdevdesigner.com/q/64-bit-syscall-documentation-for-macos-assembly-73354/
_ft_write:
	push	rbp ; classic init
	mov		rbp, rsp ; classic init
	mov		rax, MACH_SYSCALL(WRITE) ; ret = write()
	syscall ; call system
	jc errno ; if error
	leave ; clear
	ret ; return
errno:
	mov rdi, rax ; value WRITE in first arg
    call ___error ; call error()
	mov [rax], rdi ; errno = return write
	mov rax, -1 ; ret = -1
	leave ; clear
	ret ; return
