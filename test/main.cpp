#include "../include/test.hpp"

int main(void) {
	ft_strlen_test();
	ft_strcpy_test();
	ft_strcmp_test();
	ft_write_test();
	ft_read_test();
	ft_strdup_test();
	t_list	*testos = ft_create_elem((void *)"first");
	printf("%s\n", (char *)testos->data);
	printf("%p\n", testos->next);
	// ft_list_push_front(&testos, (void *)"second");
	// ft_list_push_front(&testos, (void *)"end");
	// while (testos->next != NULL)
	// {
	// 	printf("%s\n", (char *)testos->data);
	// 	testos = testos->next;
	// }
	return (0);
}
