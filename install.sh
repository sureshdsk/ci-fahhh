#!/usr/bin/env bash
set -e

REPO="sureshdsk/ci-fahhh"
FAAH_HOME="${FAAH_HOME:-$HOME/.faah}"
BASE_URL="https://raw.githubusercontent.com/$REPO/main"

# Check for curl or wget
if command -v curl &>/dev/null; then
  download() { curl -fsSL "$1" -o "$2"; }
elif command -v wget &>/dev/null; then
  download() { wget -qO "$2" "$1"; }
else
  echo "error: curl or wget is required to install faah."
  exit 1
fi

# Determine install directory
if [ -w /usr/local/bin ]; then
  INSTALL_DIR="/usr/local/bin"
else
  INSTALL_DIR="$HOME/.local/bin"
  mkdir -p "$INSTALL_DIR"
fi

# Check for audio player
if ! command -v afplay &>/dev/null && \
   ! command -v paplay &>/dev/null && \
   ! command -v aplay &>/dev/null && \
   ! command -v mpv &>/dev/null && \
   ! command -v ffplay &>/dev/null && \
   ! command -v powershell.exe &>/dev/null; then
  echo "error: no supported audio player found."
  echo "install one of: paplay, aplay, mpv, or ffplay"
  exit 1
fi

echo "Installing faah..."

mkdir -p "$FAAH_HOME"

# Download sound files
download "$BASE_URL/sounds/fahhhhh.mp3" "$FAAH_HOME/fahhhhh.mp3"
download "$BASE_URL/sounds/cat-meow-1.mp3" "$FAAH_HOME/cat-meow-1.mp3"

# Download CLI script
download "$BASE_URL/faah" "$INSTALL_DIR/faah"
chmod +x "$INSTALL_DIR/faah"

echo "faah installed to $INSTALL_DIR/faah"

# Check if install dir is in PATH
if ! echo "$PATH" | tr ':' '\n' | grep -q "^$INSTALL_DIR$"; then
  echo ""
  echo "Add $INSTALL_DIR to your PATH:"
  echo "  export PATH=\"$INSTALL_DIR:\$PATH\""
fi

echo ""
echo "usage: faah <command> [args...]"
