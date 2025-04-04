# Corvo - bash/history_enriched.bash
# Enriched history for Bash using DEBUG trap and PROMPT_COMMAND

# === Initialization ===
export CORVO_HISTORY_FILE="${CORVO_HISTORY_FILE:-$HOME/.corvo_history}"
export CORVO_LAST_COMMAND=""
export CORVO_LAST_CONTEXT=""

# Create history file if missing
if [ ! -f "$CORVO_HISTORY_FILE" ]; then
  touch "$CORVO_HISTORY_FILE"
  chmod 600 "$CORVO_HISTORY_FILE"
fi

# === Get current context ===
corvo_current_context() {
  corvo_get_context
}

# === Trap DEBUG to capture command before execution ===
corvo_capture_command() {
  if [ -n "$PS1" ]; then
    CORVO_LAST_COMMAND=$(HISTTIMEFORMAT= history 1 | sed 's/^ *[0-9]\+ *//')
  fi
}
trap corvo_capture_command DEBUG

# === PROMPT_COMMAND to log after command execution ===
corvo_log_command() {
  if [ -n "$PS1" ] && [ -n "$CORVO_LAST_COMMAND" ]; then
    local context="$(corvo_current_context)"
    local timestamp="$(corvo_now)"
    local exit_code=$?

    local last_ctx_line=""
    local count_since=999

    if [ -f "$CORVO_HISTORY_FILE" ]; then
      last_ctx_line=$(awk '/^# CONTEXT/ { ctx=$0; count=0; next } /^[^#]/ { count++ } END { print ctx; print count }' "$CORVO_HISTORY_FILE")
      count_since=$(echo "$last_ctx_line" | tail -n 1)
      last_ctx_line=$(echo "$last_ctx_line" | head -n 1)
    fi

    local new_context_line="# CONTEXT ($context)"
    if [ "$last_ctx_line" != "$new_context_line" ] || [ "$count_since" -ge "$CORVO_CONTEXT_REPEAT_INTERVAL" ]; then
      corvo_append "$CORVO_HISTORY_FILE" "$new_context_line"
    fi

    if [ "$CORVO_ENABLE_TIMESTAMP" = "1" ]; then
      local line="# $timestamp"
      if [ "$CORVO_ENABLE_EXITCODE" = "1" ]; then
        line+=" (exit=$exit_code)"
      fi
      corvo_append "$CORVO_HISTORY_FILE" "$line"
    fi

    corvo_append "$CORVO_HISTORY_FILE" "$CORVO_LAST_COMMAND"
    unset CORVO_LAST_COMMAND
  fi
}

PROMPT_COMMAND="corvo_log_command${PROMPT_COMMAND:+; $PROMPT_COMMAND}"