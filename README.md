# dotfiles

Personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Contents

| Package | Description |
|---------|-------------|
| `background` | Desktop wallpapers |
| `ghostty` | [Ghostty](https://ghostty.org/) terminal config |
| `hyprland` | [Hyprland](https://hyprland.org/) window manager config |
| `hyprlock` | Hyprland lock screen config |
| `hyprmocha` | Catppuccin Mocha theme for Hyprland |
| `hyprpaper` | Hyprpaper wallpaper config |
| `kitty` | [Kitty](https://sw.kovidgoyal.net/kitty/) terminal config |
| `nvim` | [Neovim](https://neovim.io/) config (LazyVim) |
| `rofi` | [Rofi](https://github.com/davatorium/rofi) launcher with Catppuccin theme |
| `starship` | [Starship](https://starship.rs/) prompt config |
| `tmux` | tmux config |
| `waybar` | [Waybar](https://github.com/Alexays/Waybar) status bar with Catppuccin theme |
| `wofi` | [Wofi](https://hg.sr.ht/~scoopta/wofi) launcher styling |
| `zsh` | Zsh config and aliases |

## Usage

Clone the repo and use `stow` to symlink packages into your home directory:

```sh
git clone <repo-url> ~/dotfiles
cd ~/dotfiles

# Option 1: Link a single dot config <<-- Recommended
stow zsh

# Option 2: Link everything <<-- Highly discouraged
stow */
```

The [`.stowrc`](.stowrc) sets the target to `~` so no `--target` flag is needed.

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)
