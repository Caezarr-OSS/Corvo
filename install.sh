#!/usr/bin/env bash
set -euo pipefail

# === Corvo Installer ===
CORVO_ROOT="$HOME/.config/corvo"
CORVO_SHELL=""
CORVO_BIN="$CORVO_ROOT/bin"

# === Detect Shell ===
detect_shell() {
  local shell_name="$(basename "$SHELL")"
  case "$shell_name" in
    zsh|bash) CORVO_SHELL="$shell_name" ;;
    *) echo "❌ Unsupported shell: $shell_name"; exit 1 ;;
  esac
}

# === Install for Detected Shell ===
install_for_shell() {
  local src_dir="$(dirname -- "$(readlink -f -- "$0")")"
  local target_dir="$CORVO_ROOT/$CORVO_SHELL"
  local theme_dir="$CORVO_ROOT/themes"

  mkdir -p "$CORVO_ROOT/core" "$theme_dir" "$target_dir" "$CORVO_BIN"

  echo "📁 Copying core files..."
  cp -r "$src_dir/core"/*.sh "$CORVO_ROOT/core/"

  echo "📁 Copying shell-specific files..."
  cp -r "$src_dir/$CORVO_SHELL"/*."$CORVO_SHELL" "$target_dir/" || true

  echo "🎨 Installing default theme..."
  cp "$src_dir/themes/dark.sh" "$theme_dir/dark.sh"
  ln -sf "$theme_dir/dark.sh" "$theme_dir/active.sh"

  echo "🛠 Copying corvo CLI script..."
  cp "$src_dir/bin/corvo" "$CORVO_BIN/corvo"
  chmod +x "$CORVO_BIN/corvo"

  echo "🔗 Adding loader to .${CORVO_SHELL}rc..."
  local rcfile="$HOME/.${CORVO_SHELL}rc"
  local loader="source \"$target_dir/loader.${CORVO_SHELL}\""
  if ! grep -q "corvo" "$rcfile" 2>/dev/null; then
    echo -e "\n# Corvo Shell History Plugin" >> "$rcfile"
    echo "$loader" >> "$rcfile"
  fi

  echo "🔗 Linking 'history' to Corvo filter..."
  local alias_line="alias history='history-filter'"
  if ! grep -q "alias history='history-filter'" "$rcfile" 2>/dev/null; then
    echo "$alias_line" >> "$rcfile"
  fi

  echo "🔧 Ensuring ~/.config/corvo/bin is in PATH..."
  local path_line="export PATH=\"$CORVO_BIN:\$PATH\""
  if ! grep -q "$CORVO_BIN" "$rcfile" 2>/dev/null; then
    echo "$path_line" >> "$rcfile"
  fi

  echo "✅ Corvo installed for $CORVO_SHELL"
}

# === Run ===
echo "\n🦉 Installing Corvo..."
detect_shell
install_for_shell
