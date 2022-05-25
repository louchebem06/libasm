global _ft_atoi_base
extern	_ft_strlen

; rdi (1 first arg), rsi (2)
; int ft_atoi_base(char *str, char *base);

_ft_atoi_base:
	push	rbp ; classic init
	mov		rbp, rsp ; classic init
	mov		rbx, rdi ; save str
	mov		rdi, rsi ; base in first arg
	call	_ft_strlen ; call strlen(base)
	mov		r15, rax ; r15 = strlen(base)
	mov		rdi, rsi ; base in first arg
	call	check_size ; call check_size(base)
	mov		rdi, rsi ; base in first arg
	call	check_duplicate ; call check_duplicate(base)
	mov		rdi, rsi ; base in first arg
	call	check_forbidden_char ; call check_forbidden_char(base)
	mov		rdi, rbx ; base in first arg
	call	skip_white_space
	xor 	rax, rax ; ret = 0
	xor		r8, r8 ; r8 plus = 0
	xor 	r9, r9 ; r9 minus = 0
while_sign:
	cmp		byte [rdi], 0 ; if *str == nul
	je		leave_return
	call	r8_r9_sign
	inc		rdi ; rdi++
	cmp		byte [rdi], '+'
	je		while_sign ; continue
	cmp		byte [rdi], '-'
	je		while_sign ; continue
while_atoi:
	cmp		byte [rdi], 0 ; if *str == nul
	je		the_end
	imul	rax, r15 ; ret *= strlen(base)
	mov		r14, rax ; save ret
	call	index_base ; call index_base
	jmp		leave_return
	cmp		rax, 0 ; if index_base < 0
	jl		the_end
	add		r14, rax ; save += index_base
	mov 	rax, r14 ; rat = save
	inc		rdi; str++
	jmp		while_atoi
the_end:
	; cmp		r8, r9 ; if + < -
	; je		isneg; rax *= -1
	leave
	ret
isneg:
	; mul		rax, -1
	ret

index_base:
	xor		r10, 0 ; r10 = 0
	mov		r11, rsi ; r11 = rsi
	mov		r12b, byte [rdi]
while_index_base:
	cmp		byte [r11], r12b
	je 		found
	cmp		byte [r11], 0
	je 		not_found
	inc 	r10 ; r10++
	inc		r11 ; r11++
	jmp		while_index_base
found:
	mov		rax, r10;
	ret 
not_found:
	mov		rax, -1
	ret

r8_r9_sign:
	cmp		byte [rdi], '+'
	je		r8_p
	cmp		byte [rdi], '-'
	je		r9_p
	ret
r8_p:
	inc r8
	ret
r9_p:
	inc r9
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

skip_white_space:
	cmp		byte [rdi], 0 ;
	je		not_good
	call	isspace ; isspace(rdi)
	cmp		rax, 1 ; if true
	je		inc_rdi ; continue
	ret ; return
inc_rdi:
	inc 	rdi
	jmp 	skip_white_space

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
leave_return:
	leave
	ret
return:
	ret
true:
	mov rax, 1
	ret
false:
	mov rax, 0
	ret
