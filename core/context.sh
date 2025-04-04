# Corvo - core/context.sh
# Shared logic to detect the current shell execution context

corvo_get_context() {
  # Distrobox compatibility: CONTAINER_ID is exported on entry
  if [[ -n "${CONTAINER_ID:-}" ]]; then
    if [[ "$CONTAINER_ID" == "host" ]]; then
      echo "host-distro"
    else
      echo "$CONTAINER_ID"
    fi
  else
    echo "host"
  fi
}