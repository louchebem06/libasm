#pragma once

typedef struct	s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

#ifdef __cplusplus
	# ifdef __APPLE__
		extern "C" size_t	ft_strlen(const char *s);
		extern "C" char		*ft_strcpy(char *dest, const char *src);
		extern "C" int		ft_strcmp(const char *s1, const char *s2);
		extern "C" ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
		extern "C" ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
		extern "C" char		*ft_strdup(const char *s1);
		extern "C" t_list	*ft_create_elem(void *data);
		extern "C" void		ft_list_push_front(t_list **begin_list, void *data);
	# elif __linux__
		extern "C" size_t	_ft_strlen(const char *s);
		extern "C" char		*_ft_strcpy(char *dest, const char *src);
		extern "C" int		_ft_strcmp(const char *s1, const char *s2);
		extern "C" ssize_t	_ft_write(int fildes, const void *buf, size_t nbyte);
		extern "C" ssize_t	_ft_read(int fildes, void *buf, size_t nbyte);
		extern "C" char		*_ft_strdup(const char *s1);
		extern "C" t_list	*_ft_create_elem(void *data);
		extern "C" void		_ft_list_push_front(t_list **begin_list, void *data);
	# endif
# else
	# ifdef __APPLE__
		size_t	ft_strlen(const char *s);
		char	*ft_strcpy(char *dest, const char *src);
		int		ft_strcmp(const char *s1, const char *s2);
		ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
		ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
		char	*ft_strdup(const char *s1);
		t_list	*ft_create_elem(void *data);
		void	ft_list_push_front(t_list **begin_list, void *data);
	# elif __linux__
		size_t	_ft_strlen(const char *s);
		char	*_ft_strcpy(char *dest, const char *src);
		int		_ft_strcmp(const char *s1, const char *s2);
		ssize_t	_ft_write(int fildes, const void *buf, size_t nbyte);
		ssize_t	_ft_read(int fildes, void *buf, size_t nbyte);
		char	*_ft_strdup(const char *s1);
		t_list	*_ft_create_elem(void *data);
		void	_ft_list_push_front(t_list **begin_list, void *data);
	# endif
#endif

# ifdef __APPLE__
	# define FT_WRITE ft_write
	# define FT_READ ft_read
# elif __linux__
	# define ft_strlen(str) _ft_strlen(str)
	# define ft_strcpy(dest, src) _ft_strcpy(dest, src)
	# define ft_strcmp(s1, s2) _ft_strcmp(s1, s2)
	# define ft_write(fd, buf, size) _ft_write(fd, buf, size)
	# define ft_read(fd, buf, size) _ft_read(fd, buf, size)
	# define ft_strdup(str) _ft_strdup(str)
	# define ft_create_elem(data) _ft_create_elem(data)
	# define ft_list_push_front(list, data) _ft_list_push_front(list, data)
	# define FT_WRITE _ft_write
	# define FT_READ _ft_read
#endif
