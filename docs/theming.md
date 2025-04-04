# 🎨 Corvo - Theming Guide

Corvo supports fully customizable themes for its enriched history rendering. Themes are simple `.sh` files that define variables used by the display logic.

---

## 📁 Theme Location

Themes live in:
```bash
~/.config/corvo/themes/
```

You can create as many themes as you want. To activate a theme:
```bash
ln -sf ~/.config/corvo/themes/<your-theme>.sh ~/.config/corvo/themes/active.sh
```

---

## 🧱 Theme File Structure

A theme is a simple shell script that sets the following variables:

### General Display Options
```sh
CORVO_ENABLE_COLORS=1
CORVO_ENABLE_ICONS=1
CORVO_TIMESTAMP_FORMAT="%Y-%m-%d %H:%M:%S"
```

### Icons (optional but recommended)
```sh
CORVO_TIMESTAMP_ICON="🕒"
CORVO_CONTEXT_ICON="📦"
CORVO_SUCCESS_ICON="✔"
CORVO_ERROR_ICON="✘"
```

### Colors (ANSI escape codes)
```sh
COLOR_CONTEXT="\033[1;91m"
COLOR_TIMESTAMP="\033[38;5;250m"
COLOR_CMD_NUM="\033[1;36m"
COLOR_RESET="\033[0m"

COLOR_EXIT_0="\033[1;32m"
COLOR_EXIT_1="\033[1;31m"
COLOR_EXIT_2="\033[1;33m"
COLOR_EXIT_130="\033[1;35m"
COLOR_EXIT_OTHER="\033[1;34m"
```

You can use any valid ANSI color sequences. Try them live with:
```bash
echo -e "\033[1;36m Hello \033[0m"
```

---

## 🌗 Example: Dark Theme (`dark.sh`)
```sh
CORVO_ENABLE_COLORS=1
CORVO_ENABLE_ICONS=1
CORVO_TIMESTAMP_FORMAT="%Y-%m-%d %H:%M:%S"

CORVO_TIMESTAMP_ICON="🕒"
CORVO_CONTEXT_ICON="📦"
CORVO_SUCCESS_ICON="✔"
CORVO_ERROR_ICON="✘"

COLOR_CONTEXT="\033[1;91m"
COLOR_TIMESTAMP="\033[38;5;250m"
COLOR_CMD_NUM="\033[1;36m"
COLOR_RESET="\033[0m"

COLOR_EXIT_0="\033[1;32m"
COLOR_EXIT_1="\033[1;31m"
COLOR_EXIT_2="\033[1;33m"
COLOR_EXIT_130="\033[1;35m"
COLOR_EXIT_OTHER="\033[1;34m"
```

---

## ✨ Tips
- Create a theme file with a meaningful name (e.g. `light-highcontrast.sh`)
- Use pastel ANSI colors for light backgrounds
- You can reload the theme live by running: `source ~/.config/corvo/themes/active.sh`
- Color test reference: https://misc.flogisoft.com/bash/tip_colors_and_formatting

---

## 🛠 Troubleshooting

- If colors don't show, make sure your terminal supports ANSI and `CORVO_ENABLE_COLORS=1`
- To disable colors or icons: set the variable to `0` in the theme file

---

Happy theming 🦉