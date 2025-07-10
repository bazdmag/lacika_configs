#!/bin/bash

set -e

REPO_DIR="$(pwd)"
TARGET_HOME="$HOME"

echo "[*] Installing Oh My Zsh (base) if not present..."
if [ ! -d "$TARGET_HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "[*] Extracting your custom oh-my-zsh.tar.gz..."
tar -xzf "$REPO_DIR/oh-my-zsh.tar.gz" -C "$REPO_DIR"

echo "[*] Replacing ~/.oh-my-zsh with your custom version..."
rm -rf "$TARGET_HOME/.oh-my-zsh"
cp "$REPO_DIR/oh-my-zsh" "$TARGET_HOME/.oh-my-zsh"

echo "[*] Copying your zshrc as ~/.zshrc..."
cp "$REPO_DIR/zshrc" "$TARGET_HOME/.zshrc"

echo "[*] Setting default shell to zsh for user $USER..."
chsh -s "$(which zsh)" "$USER"

echo "[✔] Done. You can start zsh now or log out and back in."

