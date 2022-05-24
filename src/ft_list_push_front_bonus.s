global _ft_list_push_front
extern _ft_create_elem

; rdi (1 first arg), rsi (2)
; void ft_list_push_front(t_list **begin_list, void *data);

; typedef struct s_list
; {
; 	void *data; // 8
; 	struct s_list *next; // 8
; } t_list; // 16
_ft_list_push_front:
	push	rbp ; classic init
	mov		rbp, rsp ; classic init
	mov		rbx, [rdi] ; rbx = *begin_list
	mov		rdi, rsi ; arg for ft_create_elem = data
	call	_ft_create_elem ; use ft_create_elem
	mov		qword [rax + 8], rbx;
	mov		rdi, rax
	leave
	ret
