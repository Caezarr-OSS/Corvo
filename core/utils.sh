# Corvo - core/utils.sh
# Shared shell-agnostic utility functions

# Append safely to a file, creating it if needed
corvo_append() {
  local file="$1"
  shift
  mkdir -p "$(dirname "$file")"
  touch "$file"
  chmod 600 "$file"
  echo "$@" >> "$file"
}

# Log with optional color (only if stdout is a terminal)
corvo_log() {
  local level="$1"
  shift
  local msg="$*"
  if [[ -t 1 ]]; then
    case "$level" in
      info)    echo -e "\033[1;34m[INFO]\033[0m $msg" ;;
      warn)    echo -e "\033[1;33m[WARN]\033[0m $msg" ;;
      error)   echo -e "\033[1;31m[ERROR]\033[0m $msg" ;;
      success) echo -e "\033[1;32m[OK]\033[0m $msg" ;;
      *)       echo "$msg" ;;
    esac
  else
    echo "[$level] $msg"
  fi
}

# Return the current timestamp formatted
corvo_now() {
  date +"${CORVO_TIMESTAMP_FORMAT:-%Y-%m-%d %H:%M:%S}"
}

# Clean comment lines (used when filtering history)
corvo_is_comment() {
  [[ "$1" =~ ^#.*$ ]]
}