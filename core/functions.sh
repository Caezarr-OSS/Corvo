# Corvo - core/functions.sh
# Optional user-facing shell functions shared by Zsh and Bash

# === Feature toggles ===
CORVO_ENABLE_FILTER_FUNCTIONS=${CORVO_ENABLE_FILTER_FUNCTIONS:-1}
CORVO_ENABLE_THEME_FUNCTIONS=${CORVO_ENABLE_THEME_FUNCTIONS:-1}
CORVO_ENABLE_WATCH_FUNCTIONS=${CORVO_ENABLE_WATCH_FUNCTIONS:-1}

# === history-filter: filter by context or exit code ===
if [ "$CORVO_ENABLE_FILTER_FUNCTIONS" = "1" ]; then
  history-filter() {
    local context=""
    local exitcode=""

    while [ $# -gt 0 ]; do
      case "$1" in
        --context=*) context="${1#*=}" ;;
        --exit=*) exitcode="${1#*=}" ;;
      esac
      shift
    done

    awk -v ctx="$context" -v code="$exitcode" '
      BEGIN { show = 1; last_context = ""; current_exit = ""; }
      /^# CONTEXT/ {
        last_context = $0;
        if (ctx == "" || index($0, ctx) > 0) show = 1; else show = 0;
        next;
      }
      /^# [0-9]{4}-[0-9]{2}-[0-9]{2}/ {
        match($0, /exit=([0-9]+)/, m)
        current_exit = m[1]
        if (code != "" && current_exit != code) show = 0;
      }
      { if (show) print $0; }
    ' "$CORVO_HISTORY_FILE"
  }
fi

# === set-history-theme: switch active theme ===
if [ "$CORVO_ENABLE_THEME_FUNCTIONS" = "1" ]; then
  set-history-theme() {
    local theme="$1"
    local theme_path="$HOME/.config/corvo/themes/$theme.sh"
    if [ -f "$theme_path" ]; then
      ln -sf "$theme_path" "$HOME/.config/corvo/themes/active.sh"
      echo "🖌  Theme switched to '$theme'"
    else
      echo "❌ Theme '$theme' not found."
    fi
  }

  # === list-history-themes: show all available themes ===
  list-history-themes() {
    echo "🎨 Available Corvo themes:"
    for f in "$HOME/.config/corvo/themes"/*.sh; do
      name=$(basename "$f" .sh)
      echo " - $name"
    done
  }
fi

# === watch-history: live follow corvo history ===
if [ "$CORVO_ENABLE_WATCH_FUNCTIONS" = "1" ]; then
  watch-history() {
    echo "🔍 Watching history updates from: $CORVO_HISTORY_FILE"
    echo "(Press Ctrl+C to stop)"
    echo ""
    tail -F "$CORVO_HISTORY_FILE"
  }
fi
