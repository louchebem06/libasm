global _ft_atoi_base
extern	_ft_strlen

; rdi (1 first arg), rsi (2)
; int ft_atoi_base(char *str, char *base);

_ft_atoi_base:
	push	rbp ; classic init
	mov		rbp, rsp ; classic init
	mov		rbx, rdi ; save str
	mov		rdi, rsi ; base in first arg
	call	check_size ; call check_size(base)
	mov		rdi, rsi ; base in first arg
	call	check_duplicate ; call check_duplicate(base)
	mov		rdi, rsi ; base in first arg
	call	check_forbidden_char ; call check_forbidden_char(base)
	mov		rdi, rbx
	call	_ft_strlen
	leave
	ret

check_size:
	call	_ft_strlen
	cmp		rax, 1 ; if return strlen(base) <= 1
	jle		not_good ; return 0
	ret

check_duplicate:
	mov		r8b, byte [rdi] ;
	cmp		r8b, 0 ; if (r8b == 0)
	je		return ; return
	inc		rdi ; rsi++
	mov		r9, rdi; r9 = rsi
check_char_in_str:
	cmp		byte [r9], 0 ; if (*r9 == 0)
	je		check_duplicate ; continue
	inc		r9 ; *r9++
	cmp		byte [r9], r8b ; if *r9 == r8b
	je		not_good	; return 0
	jmp		check_char_in_str ; continue

isspace:
	cmp		byte [rdi], '\t' ; if *rsi == '\t'
	je		true
	cmp		byte [rdi], '\n' ; if *rsi == '\n'
	je		true
	cmp		byte [rdi], '\v' ; if *rsi == '\v'
	je		true
	cmp		byte [rdi], '\f' ; if *rsi == '\f'
	je		true
	cmp		byte [rdi], '\r' ; if *rsi == '\r'
	je		true
	cmp		byte [rdi], ' ' ; if *rsi == ' '
	je		true
	jmp		false

check_forbidden_char:
	cmp		byte [rdi], 0 ; if *rsi == 0
	je		return
	cmp		byte [rdi], '-'; if *rsi == '-'
	je		not_good
	cmp		byte [rdi], '+'; if *rsi == '+'
	je		not_good
	call	isspace ; call isspace
	cmp		rax, 1
	je		not_good
	inc		rdi ; rsi++
	jmp		check_forbidden_char ; continue

not_good:
	mov		rax, 0 ; ret = 0
	leave ; clear quit
	ret ; return
return:
	ret
true:
	mov rax, 1
	ret
false:
	mov rax, 0
	ret
