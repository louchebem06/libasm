NAME = libasm.a

ASM_FILES = ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			ft_strdup.s

ASM_BONUS = ft_create_elem_bonus.s \
			ft_list_push_front_bonus.s \
			# ft_list_size_bonus.s \
			# ft_list_sort_bonus.s \
			# ft_list_remove_if_bonus.s \
			# ft_atoi_base_bonus.s

SRCS		= $(addprefix src/,${ASM_FILES})
SRCS_BONUS	= $(addprefix src/,${ASM_BONUS})
OBJS_ASM	= ${SRCS:.s=.o}
OBJS_BONUS	= ${SRCS_BONUS:.s=.o}

REMAKE = @make -j --no-print-directory
AR = ar -rcs
RM = rm -rf
ASM = nasm -f
OS = $(shell uname)

ifeq (${OS},Linux)
	ASM += elf64
else
	ASM += macho64
endif

all:
	${REMAKE} ${NAME}

${NAME}: ${OBJS_ASM}
	${AR} ${NAME} ${OBJS_ASM}

bonus: ${OBJS_ASM} ${OBJS_BONUS}
	${AR} ${NAME} ${OBJS_BONUS}

%.o: %.s
	${ASM} $< -o $@

clean:
	${RM} ${OBJS_ASM} ${OBJS_BONUS}

fclean: clean
	${RM} ${NAME} cpp.out c.out

testcpp: all
	clang++ -std=c++11 -Wall -Wextra -Werror main.cpp ${NAME} -o cpp.out

testc: all
	clang -Wall -Wextra -Werror main.c ${NAME} -o c.out

test: testcpp testc

re:	fclean all

.PHONY: fclean clean all bonus testc testcpp test
