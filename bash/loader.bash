# Corvo - bash/loader.bash
# Loader script for Bash shell

# === Load Core Components ===
source "$HOME/.config/corvo/core/context.sh"
source "$HOME/.config/corvo/core/utils.sh"
source "$HOME/.config/corvo/core/config.sh"

# === Load Theme (from shared themes folder) ===
CORVO_THEME_FILE="${CORVO_THEME_FILE:-$HOME/.config/corvo/themes/active.sh}"
if [ -f "$CORVO_THEME_FILE" ]; then
  source "$CORVO_THEME_FILE"
else
  echo "⚠️  Corvo: No theme found at $CORVO_THEME_FILE. Falling back to dark."
  CORVO_THEME_FILE="$HOME/.config/corvo/themes/dark.sh"
  [ -f "$CORVO_THEME_FILE" ] && source "$CORVO_THEME_FILE"
fi

# === Load Main Bash Plugin ===
source "$HOME/.config/corvo/bash/history_enriched.bash"

# === Load Optional Functions (filters, themes, etc.) ===
if [ -f "$HOME/.config/corvo/core/functions.sh" ]; then
  source "$HOME/.config/corvo/core/functions.sh"
fi