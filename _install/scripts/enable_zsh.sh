#!/usr/bin/env bash

echo "[*] Changing shell to ZSH"

# Check that zsh is installed
if ! command -v zsh >/dev/null 2>&1; then
    echo "[!] ZSH is not installed."
    exit 1
fi

# Change the user's default shell
ZSH_PATH="$(command -v zsh)"

if [ "$SHELL" != "$ZSH_PATH" ]; then
    if chsh -s "$ZSH_PATH"; then
        echo "[+] Default shell changed to $ZSH_PATH"
    else
        echo "[!] Failed to change the default shell."
        exit 1
    fi
else
    echo "[+] ZSH is already the default shell."
fi

echo "[+] Done. Log out and back in for the change to take effect."
