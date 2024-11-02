#!/bin/bash

# -------------------------------
# Installation Script Ubuntu WSL
#--------------------------------

sudo apt update && sudo apt upgrade
sudo apt install git
sudo apt install tmux
# Install nvim
sudo apt install libfuse2
cd ~/
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
rm -rf nvim.appimage
sudo apt install fzf
sudo apt install ripgrep
sudo apt install fd-find
# only if not in wsl
sudo apt install kitty

#install github-cli
sudo apt install gh

# Install fish
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

# Install fastfetch
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo apt update
sudo apt install fastfetch

# Install bat
sudo apt install bat

# Install stow
sudo apt install stow

#Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

rm -rf .config && rm -rf .tmux && rm -rf .tmux.conf
.dotfiles/
stow .
fish

# install lazygit
brew install lazygit

# Install yazi complete
brew install yazi ffmpegthumbnailer sevenzip jq poppler fd ripgrep fzf zoxide imagemagick font-symbols-only-nerd-font

# Install yazi custom
# brew install yazi zoxide

# Install oh-my-posh
brew install oh-my-posh

# TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#|---------------------------------------------||-> THIS FOR UBUNTU <-||-----------------------------------------------------------------------------------|
# omakub install
# wget -qO- https://omakub.org/install | bash
