# 🧠 Corvo - Developer Guide

Welcome to the Corvo developer documentation. This guide explains how to contribute, extend and maintain the Corvo project in a modular and shell-agnostic way.

---

## 🏗 Project Structure

```
corvo/
├── core/         # Shared logic for all shells
├── zsh/          # Zsh-specific hooks and behavior
├── bash/         # Bash support (coming soon)
├── themes/       # Shared theme files (.sh)
├── docs/         # Markdown documentation
└── install.sh    # Offline installer
```

Each shell has its own loader and history handler, but shares context, utils, and config.

---

## ➕ Add Support for a New Shell (e.g. fish)

1. Create a new folder: `corvo/fish/`
2. Add:
   - `loader.fish`
   - `history_enriched.fish`
3. Reuse the `core/` components:
   ```fish
   source ~/.config/corvo/core/context.sh
   source ~/.config/corvo/core/utils.sh
   source ~/.config/corvo/core/config.sh
   source ~/.config/corvo/themes/active.sh
   ```
4. Implement fish-specific hooks (`precmd`, `preexec` equivalent)
5. Update `install.sh` if needed (optional)

---

## 🎨 Add a New Theme

1. Create a new `.sh` file in `corvo/themes/`
2. Start with one of the existing themes (e.g. `dark.sh`)
3. Customize color codes, icons, or disable features

Once saved, activate it:
```bash
ln -sf ~/.config/corvo/themes/<your-theme>.sh ~/.config/corvo/themes/active.sh
```

---

## 🧪 Testing

Corvo is designed to be sourced, so testing involves:

- Opening a new shell session
- Executing commands
- Verifying the output in `~/.corvo_history`

> Optional: write test scripts using containerized shells (Distrobox, Podman).

---

## 🧼 Coding Style

- Use `corvo_` prefix for all functions
- Use `CORVO_` prefix for all environment/config vars
- Prefer POSIX-compatible syntax when possible

---

## 🐚 Zsh / Bash Hook Equivalents

| Feature         | Zsh         | Bash        |
|----------------|-------------|-------------|
| Before cmd     | `preexec`   | `trap DEBUG`|
| After prompt   | `precmd`    | `PROMPT_COMMAND` |
| Interactive    | `$PS1`      | `$PS1`      |

---

## 🔧 TODO / Ideas

- Bash support (v1)
- Fish shell (community plugin?)
- Export enriched history to JSON/CSV
- Live `watch-history` mode
- Plugin manager support (zinit, antidote, etc)

---

## 🤝 Contributing

Please keep all additions:
- Shell-agnostic when possible
- Documented inside `docs/`
- Optional / feature-toggled if intrusive

Pull requests and ideas are welcome 🐦‍⬛