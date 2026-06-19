# ZachHung's dotfiles

Personal dotfiles for a WSL2/Ubuntu environment, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's included

| Tool | Purpose |
| --- | --- |
| [fish](https://fishshell.com) | Primary shell |
| [Starship](https://starship.rs) | Prompt (backup) |
| [Tide](https://github.com/IlanCosman/tide) | Fish prompt |
| [delta](https://github.com/dandavison/delta) | Git pager |
| [eza](https://github.com/eza-community/eza) | `ls` replacement |
| [fd](https://github.com/sharkdp/fd) | `find` replacement |
| [bat](https://github.com/sharkdp/bat) | `cat` replacement |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` |
| [vivid](https://github.com/sharkdp/vivid) | `LS_COLORS` generator |

## Quick start

```bash
git clone https://github.com/ZachHung/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

`install.sh` will:

1. Install all required tools via `apt` (and direct downloads where needed)
2. Symlink configs to `$HOME` with `stow`
3. Set fish as your default shell
4. Install [fisher](https://github.com/jorgebucaran/fisher) and all plugins from `fish_plugins`

## Manual setup

If you'd rather install tools yourself and just want the symlinks:

```bash
cd ~/dotfiles
stow .
```

Then install fisher plugins inside fish:

```bash
fisher update
```