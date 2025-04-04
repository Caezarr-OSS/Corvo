# Corvo - zsh/loader.zsh
# Load everything needed for Corvo in Zsh

# === Load Core Components ===
source "${0:A:h}/../core/context.sh"
source "${0:A:h}/../core/utils.sh"
source "${0:A:h}/../core/config.sh"

# === Load Theme (from shared themes folder) ===
CORVO_THEME_FILE="${CORVO_THEME_FILE:-$HOME/.config/corvo/themes/dark.sh}"

if [[ -f "${CORVO_THEME_FILE}" ]]; then
  source "${CORVO_THEME_FILE}"
else
  echo "⚠️  Corvo: No theme found at $CORVO_THEME_FILE. Defaulting to dark."
  CORVO_THEME_FILE="${0:A:h}/../themes/dark.sh"
  source "${CORVO_THEME_FILE}"
fi

# === Load Main Zsh Plugin ===
source "${0:A:h}/history_enriched.zsh"

# === Load Optional Functions ===
if [[ -f "${0:A:h}/../core/functions.sh" ]]; then
  source "${0:A:h}/../core/functions.sh"
fi