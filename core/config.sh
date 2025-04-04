# Corvo - core/config.sh
# Default configuration values (can be overridden per shell)

# Path to the enriched history file (per shell can override)
export CORVO_HISTORY_FILE="${CORVO_HISTORY_FILE:-$HOME/.corvo_history}"

# Default maximum number of commands between two context repeats
export CORVO_CONTEXT_REPEAT_INTERVAL="${CORVO_CONTEXT_REPEAT_INTERVAL:-100}"

# Enable/disable features (1 = yes, 0 = no)
export CORVO_ENABLE_TIMESTAMP="${CORVO_ENABLE_TIMESTAMP:-1}"
export CORVO_ENABLE_EXITCODE="${CORVO_ENABLE_EXITCODE:-1}"
export CORVO_ENABLE_COLORS="${CORVO_ENABLE_COLORS:-1}"
export CORVO_ENABLE_ICONS="${CORVO_ENABLE_ICONS:-1}"

# Default timestamp format
export CORVO_TIMESTAMP_FORMAT="${CORVO_TIMESTAMP_FORMAT:-%Y-%m-%d %H:%M:%S}"

# Default theme path (resolved by loader)
export CORVO_THEME_FILE="${CORVO_THEME_FILE:-$HOME/.config/corvo/themes/dark.sh}"
