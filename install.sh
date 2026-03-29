#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

# Back up existing files, then symlink
files=(".zshrc" ".p10k.zsh" ".gitconfig")

for file in "${files[@]}"; do
    # Back up existing file if it's not already a symlink
    if [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
        echo "Backing up $HOME/$file to $HOME/$file.backup"
        mv "$HOME/$file" "$HOME/$file.backup"
    fi

    # Create symlink
    ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
    echo "Linked $file"
done

echo "Done! Restart your terminal or run: source ~/.zshrc"