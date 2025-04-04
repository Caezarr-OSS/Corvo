# 🧩 Shell Functions (Corvo)

Corvo exposes several shell-native functions to interact with your enriched history, without requiring any external CLI.

---

## ✅ Available Functions

### 1. `history-filter`

Filter your enriched history file based on context or exit code.

**Usage:**
```bash
history-filter --context=go
history-filter --exit=1
```

---

### 2. `set-history-theme`

Activate a theme from your theme directory.

**Usage:**
```bash
set-history-theme dark
```

---

### 3. `list-history-themes`

List all available themes in `~/.config/corvo/themes/`.

**Usage:**
```bash
list-history-themes
```

---

### 4. `watch-history`

Tail your Corvo history file in real-time and display new entries as they arrive.

**Usage:**
```bash
watch-history
```

**Features:**
- Displays the latest context, timestamp, and command as they're written
- Useful for monitoring other sessions or debugging usage
- Compatible with both Bash and Zsh

**To disable this function:**
```bash
export CORVO_ENABLE_WATCH_FUNCTIONS=0
```
