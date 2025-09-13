# SO_LONG

SO_LONG is a simple 2D game project developed in C using the MinilibX graphics library. The objective is to navigate a player through a map, collect coins, avoid enemies, and reach the exit door. This project is commonly assigned in programming schools to practice file I/O, graphics, and basic game logic.

## Features
- Map parsing and validation
- Player movement and input handling
- Collectibles (coins)
- Exit door logic
- Basic enemy logic (bonus)
- Custom sprites for game elements
- Error handling for invalid maps

## Directory Structure
- `srcs/` - Main source files for the mandatory part
- `srcs_bonus/` - Source files for the bonus part (enemies, extra features)
- `LIBFT/` - Custom C library functions
- `minilibx-linux/` - MinilibX graphics library
- `sprites/` - XPM image files for game sprites
- `maps/` - Example maps (mandatory, bonus, invalid)

## How to Build
1. Clone the repository:
   ```bash
   git clone <repo-url>
   cd SO_LONG
   ```
2. Build the project:
   ```bash
   make
   ```
   For bonus features:
   ```bash
   make bonus
   ```

## How to Run
Run the game with a map file:
```bash
./so_long maps/mandatory_maps/map1.ber
```
For bonus:
```bash
./so_long_bonus maps/bonus_maps/map1.ber
```

## Controls
- Arrow keys or WASD: Move player
- ESC: Exit game

## Requirements
- Linux OS
- gcc
- MinilibX (included)

## Credits
- Developed by JefersonSopanR
- MinilibX by 42

## License
This project is licensed under the MIT License.
