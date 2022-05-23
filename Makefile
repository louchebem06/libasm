NAME = libasm.a

ASM_FILES = ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s

SRCS		= $(addprefix src/,${ASM_FILES})
OBJS_ASM	= ${SRCS:.s=.o}

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

%.o: %.s
	${ASM} $< -o $@

clean:
	${RM} ${OBJS_ASM}

fclean: clean
	${RM} ${NAME} cpp.out c.out

testcpp: all
	clang++ -std=c++11 -Wall -Wextra -Werror main.cpp ${NAME} -o cpp.out

testc: all
	clang -Wall -Wextra -Werror main.c ${NAME} -o c.out

test: testcpp testc

re:	fclean all

.PHONY: fclean clean all testc testcpp test
