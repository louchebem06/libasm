NAME = libasm.a

ASM_FILES = ft_strlen.s

SRCS		= $(addprefix src/,${ASM_FILES})
OBJS_ASM	= ${SRCS:.s=.o}

REMAKE = @make -j --no-print-directory
AR = ar -rcs
RM = rm -rf
ASM = nasm -f 

ifeq ($(uname),Linux)
	ASM += elf64
else
	ASM += macho64
endif

all:
	${REMAKE} ${NAME}

${NAME}: ${OBJS_ASM}
	${AR} ${NAME} ${OBJS_ASM}

%.o: %.s
	${ASM} $< -o $@

clean:
	${RM} ${OBJS_ASM}

fclean: clean
	${RM} ${NAME} a.out

test: all
	clang++ -std=c++11 -Wall -Wextra -Werror main.cpp ${NAME}

re:	fclean all

.PHONY: fclean clean all test
