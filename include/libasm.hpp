#pragma once

# ifdef __APPLE__
	extern "C" size_t 	ft_strlen(const char *s);
	extern "C" char		*ft_strcpy(char *dest, const char *src);
# elif __linux__
	extern "C" size_t 	_ft_strlen(const char *s);
	extern "C" char		*_ft_strcpy(char *dest, const char *src);
	
	# define ft_strlen(str) _ft_strlen(str)
	# define ft_strcpy(dest, src) _ft_strcpy(dest, src)
# endif
