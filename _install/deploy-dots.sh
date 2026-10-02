#!/usr/bin/env bash

set -euo pipefail

# Repo root: first argument, $SERVERX_REPO, or the parent of this script.
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="${1:-${SERVERX_REPO:-$(dirname "$SCRIPT_DIR")}}"
DOTFILES="$REPO_ROOT/dotfiles"

# Create (or replace) a symlink at $dst pointing to $src.
# Never clobbers real files/dirs; only rewrites links.
link_entry() {
    local src="$1" dst="$2" target=""

    mkdir -p "$(dirname "$dst")"

    if [[ -L "$dst" ]]; then
        target="$(readlink "$dst")"
        if [[ "$target" == "$src" ]]; then
            echo "[+] $dst (already linked)"
            return 0
        fi
    elif [[ -e "$dst" ]]; then
        echo "[!] $dst exists and is not a symlink — skipping"
        return 0
    fi

    ln -sfn "$src" "$dst"
    echo "[+] $dst -> $src"
}

# Symlink every top-level entry of $src_dir into $dst_dir.
link_children() {
    local src_dir="$1" dst_dir="$2" src="" name=""

    [[ -d "$src_dir" ]] || return 0

    while IFS= read -r -d '' src; do
        name="$(basename "$src")"
        link_entry "$src" "$dst_dir/$name"
    done < <(find "$src_dir" -mindepth 1 -maxdepth 1 -print0 | sort -z)
}

main() {
    echo "[*] Deploying dotfiles from $DOTFILES"

    # dotfiles/config/*  ->  ~/.config/*
    link_children "$DOTFILES/config" "$HOME/.config"

    # dotfiles/home/*    ->  ~/*
    link_children "$DOTFILES/home" "$HOME"

    # dotfiles/hermes/*  ->  ~/.hermes/*  (only files, preserving subdirs)
    if [[ -d "$DOTFILES/hermes" ]]; then
        while IFS= read -r -d '' src; do
            rel="${src#"$DOTFILES/hermes/"}"
            link_entry "$src" "$HOME/.hermes/$rel"
        done < <(find "$DOTFILES/hermes" -type f -print0 | sort -z)
    fi

    echo "[+] Done."
}

main "$@"