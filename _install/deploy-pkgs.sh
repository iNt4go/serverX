#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PKGLIST_ROOT="${PKGLIST_ROOT:-$SCRIPT_DIR/pkglist.md}"
# Allow an explicit path as the first argument.
PKGLIST_ROOT="${1:-$PKGLIST_ROOT}"

main() {
    if [[ ! -f "$PKGLIST_ROOT" ]]; then
        echo "[!] Package list not found: $PKGLIST_ROOT"
        exit 1
    fi

    # Collect package names: skip blank lines and lines prefixed with '#'.
    mapfile -t packages < <(grep -v '^[[:space:]]*#' "$PKGLIST_ROOT" | grep -v '^[[:space:]]*$')

    if [[ ${#packages[@]} -eq 0 ]]; then
        echo "[+] No packages to install."
        return 0
    fi

    echo "[*] Installing ${#packages[@]} packages:"
    printf '    %s\n' "${packages[@]}"

    sudo pacman -S --needed --noconfirm "${packages[@]}"
}

main "$@"