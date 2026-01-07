# 🗝️ Neovim Keymap Reference

> **Leader Key**: `<Space>` (Spacebar)

## 📚 Table of Contents

- [General & Editing](#-general--editing)
- [Buffer Management](#-buffer-management)
- [Window Management](#-window-management)
- [File Operations](#-file-operations)
- [LSP & Code Actions](#-lsp--code-actions)
- [Formatting & Comments](#-formatting--comments)
- [Diagnostics](#-diagnostics)
- [Treesitter Textobjects](#-treesitter-textobjects)
- [Special Features](#-special-features)

---

## 🎯 General & Editing

| Keymap      | Mode          | Description                    |
| ----------- | ------------- | ------------------------------ |
| `<Esc>`     | Normal        | Clear search highlight         |
| `<leader>q` | Normal        | Quit                           |
| `<leader>x` | Normal        | Save and quit                  |
| `Q`         | Normal        | Disabled (Ex mode safety)      |
| `<leader>y` | Normal/Visual | Yank to system clipboard       |
| `<leader>Y` | Normal        | Yank line to system clipboard  |
| `<leader>d` | Normal/Visual | Delete without yanking         |
| `<leader>p` | Visual        | Paste without losing clipboard |
| `J`         | Visual        | Move selected lines down       |
| `K`         | Visual        | Move selected lines up         |

### Centered Navigation

| Keymap  | Description                      |
| ------- | -------------------------------- |
| `<C-d>` | Scroll down (cursor centered)    |
| `<C-u>` | Scroll up (cursor centered)      |
| `n`     | Next search result (centered)    |
| `N`     | Previous search result (centered)|

## 📄 Buffer Management

| Keymap       | Description                |
| ------------ | -------------------------- |
| `<S-h>`      | Previous buffer (fast)     |
| `<S-l>`      | Next buffer (fast)         |
| `<leader>bp` | Previous buffer            |
| `<leader>bn` | Next buffer                |
| `<leader>bd` | Close current buffer       |
| `<leader>bo` | Close other buffers        |

## 🪟 Window Management

### Navigation

| Keymap  | Description          |
| ------- | -------------------- |
| `<C-h>` | Move to left window  |
| `<C-j>` | Move to window below |
| `<C-k>` | Move to window above |
| `<C-l>` | Move to right window |

### Management

| Keymap       | Description               |
| ------------ | ------------------------- |
| `<leader>wv` | Split window vertically   |
| `<leader>ws` | Split window horizontally |
| `<leader>we` | Make splits equal size    |
| `<leader>wx` | Close current split       |

### Resizing

| Keymap      | Description            |
| ----------- | ---------------------- |
| `<C-Up>`    | Increase window height |
| `<C-Down>`  | Decrease window height |
| `<C-Left>`  | Decrease window width  |
| `<C-Right>` | Increase window width  |

## 📁 File Operations

### File Tree (NvimTree)

| Keymap      | Description             |
| ----------- | ----------------------- |
| `<leader>e` | Toggle file tree        |
| `<C-n>`     | Toggle file tree (fast) |

### File Search (Telescope)

| Keymap       | Description                |
| ------------ | -------------------------- |
| `<leader>ff` | Find files                 |
| `<leader>fg` | Live grep (search text)    |
| `<leader>fb` | Find open buffers          |
| `<leader>fh` | Search help documentation  |
| `<leader>fo` | Find recently opened files |
| `<leader>fc` | Browse git commits         |
| `<leader>fd` | Find diagnostics           |
| `<leader>fs` | Find document symbols      |
| `<leader>fk` | Find keymaps               |
| `<C-p>`      | Find files (fast)          |

## 🔧 LSP & Code Actions

### Navigation (g prefix)

| Keymap | Description              |
| ------ | ------------------------ |
| `gd`   | Go to definition         |
| `gD`   | Go to declaration        |
| `gr`   | Go to references         |
| `gi`   | Go to implementation     |
| `gy`   | Go to type definition    |
| `K`    | Hover documentation      |

### Actions (leader-l prefix)

| Keymap       | Description        |
| ------------ | ------------------ |
| `<leader>la` | Code action        |
| `<leader>lr` | Rename symbol      |
| `<leader>ld` | Line diagnostics   |
| `<leader>lD` | Buffer diagnostics |
| `<leader>ls` | Restart LSP        |
| `<leader>li` | LSP info           |
| `<leader>lk` | Signature help     |

## ✨ Formatting & Comments

| Keymap       | Mode          | Description                |
| ------------ | ------------- | -------------------------- |
| `<leader>fm` | Normal/Visual | Format file/selection      |
| `<leader>/`  | Normal/Visual | Toggle comment             |
| `<C-/>`      | Normal/Visual | Toggle comment (fast)      |

## 🩺 Diagnostics

| Keymap | Description               |
| ------ | ------------------------- |
| `[d`   | Go to previous diagnostic |
| `]d`   | Go to next diagnostic     |

## 🧭 Treesitter Textobjects

### Selection

| Keymap | Description           |
| ------ | --------------------- |
| `vaf`  | Select around function|
| `vif`  | Select inside function|
| `vac`  | Select around class   |
| `vic`  | Select inside class   |
| `vaa`  | Select around argument|
| `via`  | Select inside argument|

### Navigation

| Keymap | Description             |
| ------ | ----------------------- |
| `]m`   | Next function start     |
| `[m`   | Previous function start |
| `]]`   | Next class start        |
| `[[`   | Previous class start    |

### Swap

| Keymap      | Description             |
| ----------- | ----------------------- |
| `<leader>a` | Swap with next argument |
| `<leader>A` | Swap with prev argument |

## 🚀 Special Features

### Markdown

| Keymap       | Description             |
| ------------ | ----------------------- |
| `<leader>md` | Toggle markdown preview |
| `<F12>`      | Toggle markdown preview |

### Dashboard (Alpha)

| Key | Description    |
| --- | -------------- |
| `f` | Find file      |
| `n` | New file       |
| `r` | Recent files   |
| `g` | Find text      |
| `c` | Configuration  |
| `s` | Restore session|
| `l` | Lazy           |
| `q` | Quit           |

---

## 💡 Keymap Patterns

- **`<leader>f*`** — Find operations (files, grep, buffers)
- **`<leader>l*`** — LSP operations (actions, rename, diagnostics)
- **`<leader>b*`** — Buffer operations
- **`<leader>w*`** — Window operations
- **`g*`** — Go to (definitions, references)
- **`[` / `]`** — Previous / Next navigation

---

_Updated for Neovim configuration_ 🎯
