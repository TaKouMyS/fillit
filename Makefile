# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amamy <amamy@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/13 13:12:42 by lgaultie          #+#    #+#              #
#    Updated: 2019/10/18 21:46:52 by amamy            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fillit
CC = @clang
CFLAGS += -Wall -Werror -Wextra
OBJDIR = obj
SRCDIR = src
LIBDIR	= libft
INCDIR	= $(LIBDIR)
HEAD	= $(SRCDIR)/fillit.h

SRCS =	main.c	\
		check.c			\
		parsing.c		\
		free.c			\
		map.c			\
		solve.c			\
		misc.c

CFLAGS += -I$(INCDIR)
OBJ = $(addprefix $(OBJDIR)/, $(SRCS:.c=.o))
LIB		= $(LIBDIR)/libft.a

_GREEN=\e[32m
_YELLOW=\e[33m
_BLUE=\e[34m
_END=\e[0m

all: $(NAME)

$(NAME): $(LIB) $(OBJ)
	@printf "compiling... "
	$(CC) -o $@ $^
	@printf "[$(_GREEN)✓$(_END)]\n"

$(LIB):
	@make -C $(LIBDIR)

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(HEAD)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR) :
	@mkdir $@

$(OBJ) : | $(OBJDIR)

clean:
	@printf "clean... "
	@make -C $(LIBDIR) clean
	@rm -rf $(OBJDIR)
	@printf "[$(_YELLOW)✓$(_END)]\n"

fclean: clean
	@printf "fclean... "
	@make -C $(LIBDIR) fclean
	@rm -f $(NAME)
	@printf "[$(_BLUE)✓$(_END)]\n"

re: fclean all clean

.PHONY: clean fclean all re
