#pragma once

# ifdef __APPLE__
	extern "C" size_t  ft_strlen(const char *s);
# elif __linux__
	extern "C" size_t  _ft_strlen(const char *s);
	# define ft_strlen(a) _ft_strlen(a)
# endif
