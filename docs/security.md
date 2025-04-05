# 🛡 Corvo - Security & Permissions

Corvo is designed to be safe, secure, and isolated. This document explains how history is handled and how user privacy and system integrity are protected.

---

## 🔒 File Permissions

All files created by Corvo are restricted to the current user:

- History file (default: `~/.corvo_history`)
- Config and theme files (under `~/.config/corvo/`)

Permissions are set as follows:
```bash
chmod 600 ~/.corvo_history
chmod 700 ~/.config/corvo
```

This ensures no other users can read your enriched command history.

---

## 🚫 No External Network Calls

Corvo does not make any remote connections. It is fully offline and safe to use in secure environments, airgapped servers, or production hosts.

---

## 📁 Home Directory Only

All files and state are stored under:
```bash
$HOME/.config/corvo/
```
This avoids polluting system directories or writing to protected areas.

---

## 🧼 Shell Environment Hygiene

Corvo:
- Does not modify your `PATH`
- Does not override global aliases or shell internals
- Can be cleanly removed by deleting the loader line from `.zshrc` or `.bashrc`

---

## 🧪 Tested in Containers & Distrobox

Corvo detects containerized environments like Distrobox using `$CONTAINER_ID`, and adjusts history grouping accordingly — keeping host and container histories cleanly separated.

---

## ⚙ Optional Integration

Corvo only runs if sourced manually in your shell config. It never executes automatically.

To remove it:
```bash
# Remove from your shell rc file (~/.zshrc or ~/.bashrc)
# And delete the config folder
rm -rf ~/.config/corvo
```

---

## ✅ Summary

| Area            | Secured? |
|-----------------|----------|
| History privacy | ✅        |
| Permissions     | ✅        |
| Offline usage   | ✅        |
| Host isolation  | ✅        |
| Easy uninstall  | ✅        |

Corvo is built with enterprise-grade principles, and designed to stay out of your way.

Stay safe 🐦‍⬛