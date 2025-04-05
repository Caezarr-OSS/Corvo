# 📦 Corvo - Installation Guide

This document explains how to install Corvo from a local archive or repository — fully offline and portable.

---

## 🔧 Prerequisites

- Shell supported: **Zsh** (fully), **Bash** (fully)
- Works on Linux distributions and WSL
- No root permissions required
- No dependencies beyond coreutils

---

## 📁 Installing from Archive (`.tar.gz`)

### 1. Extract the archive

```bash
tar -xzf corvo.tar.gz
cd corvo
```

### 2. Run the installer

```bash
./install.sh
```

Corvo will:
- Detect your shell (`zsh` or `bash`)
- Install all files in `~/.config/corvo/`
- Append the required loader to `.zshrc` or `.bashrc`
- Add `~/.config/corvo/bin` to your `PATH`
- Set default theme to `dark.sh`
- Alias `history` to the enriched version (if enabled)

---

## 🧪 Verify the installation

Restart your terminal or run:

```bash
source ~/.zshrc  # or source ~/.bashrc
```

Then test:

```bash
history            # shows enriched output
corvo help         # prints CLI help
corvo theme list   # list available themes
```

---

---

## 🧹 Uninstallation

Corvo is modular and safe to remove. To fully uninstall:

### 1. Remove lines from your `.zshrc` or `.bashrc`

Open your shell config and delete any of the following if present:

```bash
# Corvo loader
source "$HOME/.config/corvo/zsh/loader.zsh"  # or bash equivalent

# Alias to override history
alias history='history-filter'

# Corvo CLI in PATH
export PATH="$HOME/.config/corvo/bin:$PATH"
```

Then, apply changes:
```bash
source ~/.zshrc   # or ~/.bashrc
```

---

### 2. Remove Corvo files

```bash
rm -rf ~/.config/corvo
rm -f ~/.corvo_history
```

---

### 3. (Optional) Keep enriched history

If you want to keep `.corvo_history` for backup or analysis, you can export or archive it:

```bash
cp ~/.corvo_history ~/corvo-history-backup.txt
```

---

✅ That's it — Corvo will no longer be active in your shell.


## 🌐 Advanced Installation

To configure themes or behavior:

- Theme selection: `set-history-theme <name>`
- Disable colors or timestamps: set env vars in your shell config

```bash
export CORVO_ENABLE_TIMESTAMP=0
export CORVO_ENABLE_COLORS=0
```

For full options, see [Theming Guide](./theming.md) and [Shell Functions](./functions.md).

---

✅ You’re ready!  
Use Corvo to enrich your terminal history with context, colors, and clarity 🐦‍⬛
