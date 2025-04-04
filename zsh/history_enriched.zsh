# Corvo - zsh/history_enriched.zsh

# === Load core ===
source "${0:A:h}/../core/context.sh"
source "${0:A:h}/../core/config.sh"
source "${0:A:h}/../core/utils.sh"

# === Variables ===
CORVO_LAST_COMMAND=""
CORVO_LAST_CONTEXT=""
CORVO_HISTORY_FILE="${CORVO_HISTORY_FILE:-$HOME/.corvo_history}"

# === Init file if missing ===
if [[ ! -f "$CORVO_HISTORY_FILE" ]]; then
  touch "$CORVO_HISTORY_FILE"
  chmod 600 "$CORVO_HISTORY_FILE"
fi

# === Get current context ===
corvo_current_context() {
  corvo_get_context
}

# === Zsh hook: store command before it runs ===
preexec() {
  CORVO_LAST_COMMAND="$1"
}

# === Zsh hook: after prompt, log to history ===
precmd() {
  local context=$(corvo_current_context)
  local timestamp=$(corvo_now)
  local exit_code=$?

  if [[ -n "$CORVO_LAST_COMMAND" ]]; then
    local last_ctx_line
    local count_since=999

    if [[ -f "$CORVO_HISTORY_FILE" ]]; then
      last_ctx_line=$(awk '/^# CONTEXT/ { ctx=$0; count=0; next } /^[^#]/ { count++ } END { print ctx; print count }' "$CORVO_HISTORY_FILE")
      count_since=$(echo "$last_ctx_line" | tail -n 1)
      last_ctx_line=$(echo "$last_ctx_line" | head -n 1)
    fi

    local new_context_line="# CONTEXT ($context)"
    if [[ "$last_ctx_line" != "$new_context_line" || "$count_since" -ge "$CORVO_CONTEXT_REPEAT_INTERVAL" ]]; then
      corvo_append "$CORVO_HISTORY_FILE" "$new_context_line"
    fi

    if [[ "$CORVO_ENABLE_TIMESTAMP" == "1" ]]; then
      local line="# $timestamp"
      if [[ "$CORVO_ENABLE_EXITCODE" == "1" ]]; then
        line+=" (exit=$exit_code)"
      fi
      corvo_append "$CORVO_HISTORY_FILE" "$line"
    fi

    corvo_append "$CORVO_HISTORY_FILE" "$CORVO_LAST_COMMAND"
    unset CORVO_LAST_COMMAND
  fi

  CORVO_LAST_CONTEXT="$context"
}

# === Custom 'history' override ===
unalias history 2>/dev/null

zsh-history() {
  local lineno=1
  while IFS= read -r line; do
    if [[ "$line" == '# CONTEXT '* ]]; then
      [[ "$CORVO_ENABLE_COLORS" == "1" ]] && print -P "%F{red}${CORVO_CONTEXT_ICON:-📦} $line%f" || echo "$line"
    elif [[ "$line" == '# '* ]]; then
      if [[ "$CORVO_ENABLE_COLORS" == "1" ]]; then
        if [[ "$line" =~ exit=([0-9]+) ]]; then
          local code="${match[1]}"
          local color=""
          case "$code" in
            0) color="$COLOR_EXIT_0" ;;
            1) color="$COLOR_EXIT_1" ;;
            2) color="$COLOR_EXIT_2" ;;
            130) color="$COLOR_EXIT_130" ;;
            *) color="$COLOR_EXIT_OTHER" ;;
          esac
          print -P "%F{208}$line%f %B%K{$color}(exit=$code)%k%b"
        else
          print -P "%F{208}$line%f"
        fi
      else
        echo "$line"
      fi
    else
      [[ "$CORVO_ENABLE_COLORS" == "1" ]] && print -P "%F{cyan}%5d%f  %s" "$lineno" "$line" || echo "$line"
      ((lineno++))
    fi
  done < "$CORVO_HISTORY_FILE"
}

alias history='zsh-history'