# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fureimu <fureimu@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/12 11:29:57 by yguinio           #+#    #+#              #
#    Updated: 2025/01/21 11:38:25 by fureimu          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

SRC_DIR = ./srcs/
INC_DIR = ./includes/
OBJ_DIR = ./objects/

CHECKS_DIR=$(addprefix $(SRC_DIR), checks/)
CONVERSION_DIR=	$(addprefix $(SRC_DIR), conversion/)
DISPLAY_DIR= $(addprefix $(SRC_DIR), display/)
LINKED_LIST_DIR= $(addprefix $(SRC_DIR), linked_list/)
MEMORY_DIR= $(addprefix $(SRC_DIR), memory/)
STRINGS_DIR= $(addprefix $(SRC_DIR), strings/)

CHECKS_FILES= ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c 

CONVERSION_FILES= ft_toupper.c ft_tolower.c ft_atoi.c ft_itoa.c 

DISPLAY_FILES= ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c 

LINKED_LIST_FILES= ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c \
					ft_lstiter.c ft_lstmap.c

MEMORY_FILES= ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_memchr.c ft_memcmp.c ft_calloc.c 

STRINGS_FILES= ft_strlen.c ft_reverse.c ft_strlcpy.c ft_strlcat.c ft_strchr.c ft_strrchr.c ft_strncmp.c ft_strnstr.c \
				ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_strmapi.c ft_striteri.c 
			  
OBJ = $(addprefix $(OBJ_DIR), $(CHECKS_FILES:.c=.o)) \
	  $(addprefix $(OBJ_DIR), $(CONVERSION_FILES:.c=.o)) \
	  $(addprefix $(OBJ_DIR), $(DISPLAY_FILES:.c=.o)) \
	  $(addprefix $(OBJ_DIR), $(LINKED_LIST_FILES:.c=.o)) \
	  $(addprefix $(OBJ_DIR), $(MEMORY_FILES:.c=.o)) \
	  $(addprefix $(OBJ_DIR), $(STRINGS_FILES:.c=.o)) \

CC = cc
AR = ar -rcs
CFLAGS = -Werror -Wextra -Wall
INC_H = -I $(INC_DIR)

DEF_COLOR = \033[0;90m
GREEN = \033[0;92m
YELLOW = \033[0;93m
CYAN = \033[0;96m

all : $(NAME)

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

$(NAME) : $(OBJ)
	@$(AR) $(NAME) $(OBJ) $(BASES)
	@echo "$(GREEN)libft compiled!$(DEF_COLOR)"

$(OBJ_DIR)%.o: $(CHECKS_DIR)%.c | $(OBJ_DIR)
	@echo "$(YELLOW)Compiling: $< $(DEF_COLOR)"
	@$(CC) $(CFLAGS) -I $(INC_DIR) -c $< -o $@

$(OBJ_DIR)%.o: $(CONVERSION_DIR)%.c | $(OBJ_DIR)
	@echo "$(YELLOW)Compiling: $< $(DEF_COLOR)"
	@$(CC) $(CFLAGS) -I $(INC_DIR) -c $< -o $@

$(OBJ_DIR)%.o: $(DISPLAY_DIR)%.c | $(OBJ_DIR)
	@echo "$(YELLOW)Compiling: $< $(DEF_COLOR)"
	@$(CC) $(CFLAGS) -I $(INC_DIR) -c $< -o $@

$(OBJ_DIR)%.o: $(LINKED_LIST_DIR)%.c | $(OBJ_DIR)
	@echo "$(YELLOW)Compiling: $< $(DEF_COLOR)"
	@$(CC) $(CFLAGS) -I $(INC_DIR) -c $< -o $@

$(OBJ_DIR)%.o: $(MEMORY_DIR)%.c | $(OBJ_DIR)
	@echo "$(YELLOW)Compiling: $< $(DEF_COLOR)"
	@$(CC) $(CFLAGS) -I $(INC_DIR) -c $< -o $@

$(OBJ_DIR)%.o: $(STRINGS_DIR)%.c | $(OBJ_DIR)
	@echo "$(YELLOW)Compiling: $< $(DEF_COLOR)"
	@$(CC) $(CFLAGS) -I $(INC_DIR) -c $< -o $@

clean:
	@rm -rf $(OBJ)
	@echo "$(BLUE)libft objects files cleaned!$(DEF_COLOR)"

fclean : clean
	rm -rf $(NAME)
	@echo "$(BLUE)libft and its objects files cleaned!$(DEF_COLOR)"

re: fclean all
	@echo "$(GREEN)libft succesfully rebuilt!$(DEF_COLOR)"

.PHONY : all clean fclean re