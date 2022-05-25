NAME = libasm.a

ASM_FILES = ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s

ASM_BONUS = ft_atoi_base_bonus.s \
			ft_list_push_front_bonus.s \
			# ft_list_size_bonus.s \
			# ft_list_sort_bonus.s \
			# ft_list_remove_if_bonus.s

CPP_TESTOR = main.cpp \
				ft_read_test.cpp \
				ft_write_test.cpp \
				ft_strcpy_test.cpp \
				ft_strdup_test.cpp \
				ft_strlen_test.cpp \
				ft_strcmp_test.cpp \
				ft_atoi_base_test.cpp

REMAKE = @make -j --no-print-directory
AR = ar -rcs
RM = rm -rf
ASM = nasm -f
C++ = clang++
OS = $(shell uname)

ifeq (${OS},Linux)
	ASM += elf64
	ASM_FILES += ft_write_elf64.s
	ASM_FILES += ft_read_elf64.s
	ASM_FILES += ft_strdup_elf64.s
	ASM_BONUS += ft_create_elem_elf64_bonus.s
else
	ASM += macho64
	ASM_FILES += ft_write_macho64.s
	ASM_FILES += ft_read_macho64.s
	ASM_FILES += ft_strdup_macho64.s
	ASM_BONUS += ft_create_elem_macho64_bonus.s
endif

SRCS		= $(addprefix src/,${ASM_FILES})
SRCS_BONUS	= $(addprefix src/,${ASM_BONUS})
SRCS_CPP	= $(addprefix test/,${CPP_TESTOR})
OBJS_ASM	= ${SRCS:.s=.o}
OBJS_BONUS	= ${SRCS_BONUS:.s=.o}
OBJS_CPP	= ${SRCS_CPP:.cpp=.o}
CFLAGS 		= -Wall -Wextra -Werror

ifdef BONUS_LIBASM
	OBJS = ${OBJS_ASM} ${OBJS_BONUS}
else
	OBJS = ${OBJS_ASM}
endif

all:
	${REMAKE} ${NAME}

${NAME}: ${OBJS}
	${AR} ${NAME} ${OBJS}

bonus:
	${REMAKE} BONUS_LIBASM=1

%.o: %.s
	${ASM} $< -o $@

%.o: %.cpp
	${C++} -c $< -o $@

clean:
	${RM} ${OBJS_ASM} ${OBJS_BONUS} ${OBJS_CPP}

fclean: clean
	${RM} ${NAME} testor

test: bonus ${OBJS_CPP}
	${C++} -std=c++11 ${CFLAGS} ${OBJS_CPP} ${NAME} -o testor

re:	fclean all

.PHONY: fclean clean all bonus test
