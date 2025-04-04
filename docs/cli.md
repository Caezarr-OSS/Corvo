# 🧮 Corvo CLI Reference

Corvo provides a lightweight shell CLI wrapper via the `corvo` command.  
It routes to internal history and theming functions without needing a compiled binary.

---

## 📦 Basic Commands

| Command                      | Description                          |
|------------------------------|--------------------------------------|
| `corvo history`              | Show enriched history                |
| `corvo filter [--context=]`  | Filter history by context            |
| `corvo filter [--exit=]`     | Filter history by exit code          |
| `corvo theme list`           | List available themes                |
| `corvo theme use <name>`     | Activate a specific theme            |
| `corvo watch-history`        | Watch history in real-time           |
| `corvo help`                 | Show available commands              |

---

## 🕵️ Examples

```bash
corvo history
corvo filter --exit=1
corvo filter --context=go
corvo theme use light
corvo watch-history
```

---

## ⚙️ Environment Variables

| Variable                        | Description                               |
|----------------------------------|-------------------------------------------|
| `CORVO_ENABLE_FILTER_FUNCTIONS` | Enable `history-filter` (default: 1)       |
| `CORVO_ENABLE_THEME_FUNCTIONS`  | Enable theme switching functions (default: 1) |
| `CORVO_ENABLE_WATCH_FUNCTIONS`  | Enable live history watch (default: 1)     |
