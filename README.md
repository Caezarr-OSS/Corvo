# 🦉 Corvo

> Modular and enriched shell history plugin — offline-friendly, Zsh-ready, Bash-compatible.

---

## 📦 Features

- Context-aware history: detect `host` or `distrobox` context automatically
- Rich metadata: timestamps, exit codes, contextual grouping
- Themeable output: dark, light, or custom themes
- Optional CLI wrapper (`corvo`) for filters, theme switching, live watching
- Offline installation with `install.sh`
- Bash and Zsh supported (other shells coming)
- Configurable via environment variables or shell themes
- Minimal, portable, dependency-free

---

## 🚀 Getting Started

### 1. Clone or extract the project
```bash
git clone <your_internal_repo>/corvo.git
cd corvo
```

### 2. Install for your shell
```bash
./install.sh
```

This will:
- Detect your shell (`zsh` or `bash`)
- Install Corvo to `~/.config/corvo/`
- Update `.zshrc` or `.bashrc` to load the plugin
- Add `~/.config/corvo/bin/` to your `PATH`
- Set an alias so `history` is enhanced
- Enable the `corvo` command (optional CLI)

For full instructions, see [📄 Installation Guide](./docs/installation.md).

---

## 📚 Documentation

| Topic                     | File                                 |
|---------------------------|--------------------------------------|
| 📄 Installation Guide     | [`docs/installation.md`](./docs/installation.md) |
| 🎨 Theming Guide          | [`docs/theming.md`](./docs/theming.md) |
| 🛡 Security & Permissions | [`docs/security.md`](./docs/security.md) |
| 🧠 Developer Guide        | [`docs/dev.md`](./docs/dev.md)       |
| ⚙️ Shell Functions        | [`docs/functions.md`](./docs/functions.md) |
| 🧮 CLI Commands (`corvo`) | [`docs/cli.md`](./docs/cli.md)       |
| ✅ Test Checklist         | [`docs/test-checklist.md`](./docs/test-checklist.md) |

---

## 🎨 Theme Management

Themes are located in:
```bash
~/.config/corvo/themes/
```

Switch theme using:
```bash
set-history-theme dark
```

Or via the CLI:
```bash
corvo theme use dark
```

To view available themes:
```bash
corvo theme list
```

For more, see [`docs/theming.md`](./docs/theming.md).

---

## 🛡 Security

Corvo respects your environment:

- History stored separately in `~/.corvo_history`
- Permissions set to `chmod 600` for safety
- No shell-specific overrides
- Safe fallback if a theme/config is missing

Details: [`docs/security.md`](./docs/security.md)

---

## 🧠 Developer Info

Modular by design, Corvo is built for extensibility.

Want to:
- Add support for another shell?
- Create your own theme?
- Extend the CLI?

Start here: [`docs/dev.md`](./docs/dev.md)

---

## 📃 License

MIT License — see [`LICENSE`](./LICENSE)

---

## 🧭 Project Structure

```
corvo/
├── core/              # Shared logic (context, config, utils)
├── zsh/               # Zsh-specific logic
├── bash/              # Bash-specific logic
├── bin/               # Optional CLI wrapper (`corvo`)
├── themes/            # User themes
├── docs/              # All documentation
└── install.sh         # Offline installer script
```

---

## 💬 Questions / Feedback?

Open a discussion or share improvements internally.  
Stay productive. Stay contextual. 🦉
