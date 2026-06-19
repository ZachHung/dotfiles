#!/usr/bin/env bash
set -euo pipefail

need() { command -v "$1" &>/dev/null; }

sudo apt-get update -qq

# Core tools available in apt
sudo apt-get install -y \
    fish \
    stow \
    git \
    curl \
    wget \
    fzf \
    ripgrep \
    zsh  # kept for compatibility; fish is primary

# bat (shipped as batcat on Ubuntu/Debian)
if ! need bat; then
    sudo apt-get install -y bat
    mkdir -p ~/.local/bin
    ln -sf /usr/bin/batcat ~/.local/bin/bat
fi

# fd (shipped as fd-find on Ubuntu/Debian)
if ! need fd; then
    sudo apt-get install -y fd-find
    mkdir -p ~/.local/bin
    ln -sf /usr/bin/fdfind ~/.local/bin/fd
fi

# eza
if ! need eza; then
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc \
        | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" \
        | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo apt-get update -qq && sudo apt-get install -y eza
fi

# zoxide
if ! need zoxide; then
    curl -sSf https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi

# delta (git pager)
if ! need delta; then
    DELTA_VER=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest \
        | grep '"tag_name"' | cut -d'"' -f4)
    wget -qO /tmp/git-delta.deb \
        "https://github.com/dandavison/delta/releases/download/${DELTA_VER}/git-delta_${DELTA_VER}_amd64.deb"
    sudo dpkg -i /tmp/git-delta.deb
    rm /tmp/git-delta.deb
fi

# vivid (LS_COLORS generator)
if ! need vivid; then
    VIVID_VER=$(curl -s https://api.github.com/repos/sharkdp/vivid/releases/latest \
        | grep '"tag_name"' | cut -d'"' -f4 | tr -d v)
    wget -qO /tmp/vivid.deb \
        "https://github.com/sharkdp/vivid/releases/download/v${VIVID_VER}/vivid_${VIVID_VER}_amd64.deb"
    sudo dpkg -i /tmp/vivid.deb
    rm /tmp/vivid.deb
fi

# pnpm
if ! need pnpm; then
    curl -fsSL https://get.pnpm.io/install.sh | sh -
fi

# bun
if ! need bun; then
    curl -fsSL https://bun.sh/install | bash
fi

# Symlink dotfiles
stow --restow --target="$HOME" .

# Set fish as default shell
FISH_PATH=$(command -v fish)
if [ "$SHELL" != "$FISH_PATH" ]; then
    grep -qxF "$FISH_PATH" /etc/shells || echo "$FISH_PATH" | sudo tee -a /etc/shells
    chsh -s "$FISH_PATH"
fi

# Install fisher + plugins
fish -c "
    if not functions -q fisher
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish \
            | source && fisher install jorgebucaran/fisher
    end
    fisher update
"

echo ""
echo "Done. Restart your shell or run: exec fish"
