NAME = so_long
NAME_BONUS = so_long_bonus
CC = clang
CFLAGS = -Wall -Wextra -Werror
LDFLAGS = -L./LIBFT -lft -L./minilibx-linux -lmlx -lXext -lX11 -lm -lz
RM = rm -f

SRCS_DIR = ./srcs/
BONUS_SRCS_DIR = ./srcs_bonus/
OBJS_DIR = ./objs/
OBJS_BONUS_DIR = ./objs_bonus/

SRCS = $(addprefix $(SRCS_DIR), so_long.c ft_check_map.c ft_close_game.c \
       ft_check_arguments.c ft_handle_input.c ft_init_mlx.c ft_check_valid_path.c \
       ft_render_game.c)

SRCS_BONUS = $(addprefix $(BONUS_SRCS_DIR), so_long_bonus.c ft_check_map_bonus.c ft_close_game_bonus.c \
       ft_check_arguments_bonus.c ft_handle_input_bonus.c ft_init_mlx_bonus.c ft_check_valid_path_bonus.c \
       ft_render_game_bonus.c)

OBJS = $(SRCS:$(SRCS_DIR)%.c=$(OBJS_DIR)%.o)
OBJS_BONUS = $(SRCS_BONUS:$(BONUS_SRCS_DIR)%.c=$(OBJS_BONUS_DIR)%.o)

# Rule to create object files
$(OBJS_DIR)%.o: $(SRCS_DIR)%.c
	mkdir -p $(OBJS_DIR)
	$(CC) $(CFLAGS) -I/usr/include -I./minilibx-linux -O3 -c $< -o $@

$(OBJS_BONUS_DIR)%.o: $(BONUS_SRCS_DIR)%.c
	mkdir -p $(OBJS_BONUS_DIR)
	$(CC) $(CFLAGS) -I/usr/include -I./minilibx-linux -O3 -c $< -o $@

.PHONY: all clean fclean re bonus libft minilibx-linux

all: libft minilibx-linux $(NAME)

$(NAME): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $(NAME)

bonus: libft minilibx-linux $(NAME_BONUS)

$(NAME_BONUS): $(OBJS_BONUS)
	$(CC) $(OBJS_BONUS) $(LDFLAGS) -o $(NAME_BONUS)

libft: LIBFT/libft.a

LIBFT/libft.a:
	$(MAKE) -C LIBFT

minilibx-linux: minilibx-linux/libmlx.a

minilibx-linux/libmlx.a:
	$(MAKE) -C minilibx-linux

clean:
	$(RM) -r $(OBJS_DIR) $(OBJS_BONUS_DIR)
	$(MAKE) -C LIBFT clean
	$(MAKE) -C minilibx-linux clean

fclean: clean
	$(RM) $(NAME) $(NAME_BONUS)
	$(MAKE) -C LIBFT fclean
	$(MAKE) -C minilibx-linux clean

re: fclean all
