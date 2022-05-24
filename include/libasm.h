#pragma once

#ifdef __cplusplus
	# ifdef __APPLE__
		extern "C" size_t	ft_strlen(const char *s);
		extern "C" char		*ft_strcpy(char *dest, const char *src);
		extern "C" int		ft_strcmp(const char *s1, const char *s2);
		extern "C" ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
	# elif __linux__
		extern "C" size_t	_ft_strlen(const char *s);
		extern "C" char		*_ft_strcpy(char *dest, const char *src);
		extern "C" int		_ft_strcmp(const char *s1, const char *s2);
	# endif
# else
	# ifdef __APPLE__
		size_t	ft_strlen(const char *s);
		char	*ft_strcpy(char *dest, const char *src);
		int		ft_strcmp(const char *s1, const char *s2);
		ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
	# elif __linux__
		size_t	_ft_strlen(const char *s);
		char	*_ft_strcpy(char *dest, const char *src);
		int		_ft_strcmp(const char *s1, const char *s2);
	# endif
#endif

# ifdef __linux__
	# define ft_strlen(str) _ft_strlen(str)
	# define ft_strcpy(dest, src) _ft_strcpy(dest, src)
	# define ft_strcmp(s1, s2) _ft_strcmp(s1, s2)
#endif
