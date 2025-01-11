#!/bin/bash

sudo pacman -Syu --noconfirm

PACKAGES=(
  "git"
)

for package in "${PACKAGES[@]}"; do
  echo "Installing $package"
  sudo pacman -S --noconfirm --needed "$package"
done

git config --global user.name "adagu302"
git config --global user.mail "adagu302@student.liu.se"
git config --global user.email "adagu302@student.liu.se"

echo "Installing yay"
git clone https://aur.archlinux.org/yay.git
cd "$HOME/yay"
makepkg -si --noconfirm
cd "$HOME"


put() {
  local dir=$1
  local target=$2

  if [[ -d "$target" ]]; then
    cp -r "$dir" "$target"
  else 
    echo "Creating dir $target"
    mkdir "$target"
    cp -r "$dir" "$target"
  fi
  echo "Moving $dir to $target"
}

put ~/dotfiles/nvim ~/.config/nvim
put ~/dotfiles/ghostty ~/.config/ghostty
put ~/dotfiles/tmux ~/.config/tmux
put ~/dotfiles/.zshrc ~/.zshrc
put ~/dotfiles/.p10k.zsh ~/.p10k.zsh
put ~/dotfiles/hypr ~/.config/hypr
put ~/dotfiles/waybar ~/.config/waybar

ssh-keygen -t ed25519 -C "adagu302@student.liu.se"
