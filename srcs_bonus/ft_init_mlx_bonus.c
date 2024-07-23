/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_init_mlx_bonus.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jesopan- <jesopan-@student.42malaga.com>   #+#  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024-07-23 05:27:10 by jesopan-          #+#    #+#             */
/*   Updated: 2024-07-23 05:27:10 by jesopan-         ###   ########ç         */
/*                                                                            */
/* ************************************************************************** */

#include "so_long.h"

void	ft_init_mlx(t_game *game)
{
	int	y;
	int	x;

	x = game->columns * WIDTH;
	y = game->rows * HEIGHT;
	game->mlx_ptr = mlx_init();
	if (!game->mlx_ptr)
	{
		free(game->mlx_ptr);
		ft_error_game("Couldn't connect to mlx", game);
	}
	game->win_ptr = mlx_new_window(game->mlx_ptr, x, y, "so_long");
	if (!game->win_ptr)
	{
		free(game->mlx_ptr);
		ft_error_game("Couldn't create a window", game);
	}
	ft_init_sprites(game);
}

void	ft_init_sprites(t_game *game)
{
	game->wall = ft_create_sprite(game->mlx_ptr, WALL_XPM, game);
	game->grass = ft_create_sprite(game->mlx_ptr, GRASS_XPM, game);
	game->img_coins = ft_create_sprite(game->mlx_ptr, COINS_XPM, game);
	game->player_front = ft_create_sprite(game->mlx_ptr, P_FRONT_XPM, game);
	game->player_left = ft_create_sprite(game->mlx_ptr, P_LEFT_XPM, game);
	game->player_right = ft_create_sprite(game->mlx_ptr, P_RIGHT_XPM, game);
	game->player_back = ft_create_sprite(game->mlx_ptr, P_BACK_XPM, game);
	game->exit_open = ft_create_sprite(game->mlx_ptr, EXIT_OPEN_XPM, game);
	game->exit_close = ft_create_sprite(game->mlx_ptr, EXIT_CLOSE_XPM, game);
	game->lava = ft_create_sprite(game->mlx_ptr, LAVA_XPM, game);
	ft_render_game(game);
}

t_image	ft_create_sprite(void *mlx_ptr, char *path, t_game *game)
{
	t_image	sprite;

	sprite.xpm_ptr = mlx_xpm_file_to_image(mlx_ptr, path, &sprite.x, &sprite.y);
	if (sprite.xpm_ptr == NULL)
		ft_error_game("Couldn't find a sprite. Does it exist?", game);
	return (sprite);
}
