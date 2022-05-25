%define tmp rbx
global _ft_create_elem
extern malloc

; rdi (1 first arg)
; t_list *ft_create_elem(void *data);

; typedef struct s_list
; {
; 	void *data; // 8
; 	struct s_list *next; // 8
; } t_list; // 16

_ft_create_elem:
	push	rbp ; classic init
	mov		rbp, rsp ; classic init
	mov 	tmp, rdi ; tmp = data
	mov		rdi, 16 ; malloc(16)
	call	malloc ; call malloc
	mov		[rax], tmp ; return malloc->data = tmp
	mov		qword [rax + 8], 0 ; return malloc->next = NULL
	leave
	ret