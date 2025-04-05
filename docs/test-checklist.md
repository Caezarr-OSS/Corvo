# ✅ Corvo - Test Checklist

This file helps you verify that Corvo is properly installed and functioning.  
You can use this after a fresh install, update, or shell configuration change.

---

## 🧪 Basic Installation

- [ ] Run `history` → displays enriched output
- [ ] Run `echo test` → check that it gets recorded
- [ ] Open `~/.corvo_history` → file exists and is readable
- [ ] File permissions: `chmod 600 ~/.corvo_history`

---

## 🧪 Context Detection (Host / Distrobox)

- [ ] Run `ls` on the host → `# CONTEXT (host)` appears
- [ ] Enter a Distrobox (`distrobox enter dev`)
- [ ] Run `ls` → should appear under `# CONTEXT (dev)`
- [ ] Switch back to host, run again → new context is logged

---

## 🧪 Timestamps and Exit Codes

- [ ] Run `false` or `exit 1` → check for red `(exit=1)` line
- [ ] Run `true` or `echo ok` → should show green `(exit=0)`
- [ ] Check multiple commands in same second → timestamps still grouped

---

## 🧪 Theme Switching

- [ ] Run `list-history-themes` → shows available `.sh` themes
- [ ] Run `set-history-theme light` → theme switches cleanly
- [ ] Run `set-history-theme dark` → theme switches back

---

## 🧪 Filter Functionality

- [ ] Run `history-filter --context=host` → filters history
- [ ] Run `history-filter --exit=1` → shows only failed commands
- [ ] Combine filters → `--context=go --exit=0`

---

## 🧪 Watch History (Live View)

- [ ] Run `corvo watch-history` → tails the enriched history live
- [ ] In another terminal, run a command → should appear in real-time
- [ ] Context and timestamp are shown on each new command
- [ ] Disable with `export CORVO_ENABLE_WATCH_FUNCTIONS=0` → `watch-history` becomes unavailable

---

## 🧪 Configuration Toggles

In `.zshrc` or `.bashrc`, try:

```bash
export CORVO_ENABLE_TIMESTAMP=0
export CORVO_ENABLE_EXITCODE=0
```

- [ ] Timestamp lines no longer appear
- [ ] Exit codes are not shown

---

## 🧪 Optional Function Loading

- [ ] Set `CORVO_ENABLE_THEME_FUNCTIONS=0` → try `set-history-theme` → should be disabled
- [ ] Set `CORVO_ENABLE_FILTER_FUNCTIONS=0` → try `history-filter` → should be disabled
- [ ] Set `CORVO_ENABLE_WATCH_FUNCTIONS=0` → try `watch-history` → should be disabled

---

## 🐚 Bash Specific Notes

- [ ] Ensure PROMPT_COMMAND is preserved (`echo "$PROMPT_COMMAND"` should include `corvo_log_command`)
- [ ] Ensure trap DEBUG is active (`trap -p DEBUG` shows `corvo_capture_command`)
- [ ] Switching shells or tabs still maintains command appending
- [ ] Bash command numbers continue to increment correctly

---

✅ If all the above passes, Corvo is ready and functioning correctly 🐦‍⬛
