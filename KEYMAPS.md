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
- [Special Features](#-special-features)

---

## 🎯 General & Editing

| Keymap      | Mode          | Action        | Description                    |
| ----------- | ------------- | ------------- | ------------------------------ |
| `<leader>`  | All           | Leader prefix | Spacebar - your command prefix |
| `Q`         | Normal        | Disabled      | Ex mode disabled (safety)      |
| `<leader>y` | Normal/Visual | `"+y`         | Yank to system clipboard       |
| `<leader>Y` | Normal        | `"+Y`         | Yank line to system clipboard  |
| `<leader>d` | Normal/Visual | `"_d`         | Delete without yanking         |
| `<leader>p` | Visual        | `"_dP`        | Paste without losing clipboard |
| `J`         | Visual        | Move lines    | Move selected lines down       |
| `K`         | Visual        | Move lines    | Move selected lines up         |

## 📄 Buffer Management

| Keymap       | Mode   | Action       | Description                |
| ------------ | ------ | ------------ | -------------------------- |
| `<S-h>`      | Normal | `:bprevious` | Previous buffer (fast)     |
| `<S-l>`      | Normal | `:bnext`     | Next buffer (fast)         |
| `<leader>bp` | Normal | `:bprevious` | Previous buffer (mnemonic) |
| `<leader>bn` | Normal | `:bnext`     | Next buffer (mnemonic)     |
| `<leader>bd` | Normal | `:bdelete`   | Close current buffer       |

## 🪟 Window Management

### Navigation

| Keymap  | Mode   | Action   | Description          |
| ------- | ------ | -------- | -------------------- |
| `<C-h>` | Normal | `<C-w>h` | Move to left window  |
| `<C-j>` | Normal | `<C-w>j` | Move to window below |
| `<C-k>` | Normal | `<C-w>k` | Move to window above |
| `<C-l>` | Normal | `<C-w>l` | Move to right window |

### Management

| Keymap       | Mode   | Action   | Description               |
| ------------ | ------ | -------- | ------------------------- |
| `<leader>w`  | Normal | `<C-w>`  | Window command prefix     |
| `<leader>wv` | Normal | `<C-w>v` | Split window vertically   |
| `<leader>ws` | Normal | `<C-w>s` | Split window horizontally |
| `<leader>we` | Normal | `<C-w>=` | Make splits equal size    |
| `<leader>wx` | Normal | `<C-w>c` | Close current split       |

### Resizing

| Keymap      | Mode   | Action               | Description            |
| ----------- | ------ | -------------------- | ---------------------- |
| `<C-Up>`    | Normal | `resize +2`          | Increase window height |
| `<C-Down>`  | Normal | `resize -2`          | Decrease window height |
| `<C-Left>`  | Normal | `vertical resize -2` | Decrease window width  |
| `<C-Right>` | Normal | `vertical resize +2` | Increase window width  |

## 📁 File Operations

### File Tree (NvimTree)

| Keymap      | Mode   | Action                    | Description             |
| ----------- | ------ | ------------------------- | ----------------------- |
| `<leader>e` | Normal | `:NvimTreeFindFileToggle` | Toggle file tree        |
| `<C-n>`     | Normal | `:NvimTreeFindFileToggle` | Toggle file tree (fast) |

### File Search (Telescope)

| Keymap       | Mode   | Action        | Description                |
| ------------ | ------ | ------------- | -------------------------- |
| `<leader>ff` | Normal | `find_files`  | Find files                 |
| `<leader>fg` | Normal | `live_grep`   | Search text in files       |
| `<leader>fb` | Normal | `buffers`     | Find open buffers          |
| `<leader>fh` | Normal | `help_tags`   | Search help documentation  |
| `<leader>fo` | Normal | `oldfiles`    | Find recently opened files |
| `<leader>fc` | Normal | `git_commits` | Browse git commits         |
| `<C-p>`      | Normal | `find_files`  | Find files (fast)          |
| `<C-f>`      | Normal | `live_grep`   | Live grep (fast)           |

## 🔧 LSP & Code Actions

### Navigation

| Keymap | Mode   | Action                 | Description              |
| ------ | ------ | ---------------------- | ------------------------ |
| `gd`   | Normal | `lsp_definitions`      | Go to definition         |
| `gD`   | Normal | `declaration`          | Go to declaration        |
| `gR`   | Normal | `lsp_references`       | Show references          |
| `gi`   | Normal | `lsp_implementations`  | Go to implementation     |
| `gt`   | Normal | `lsp_type_definitions` | Go to type definition    |
| `K`    | Normal | `hover`                | Show hover documentation |

### Code Actions

| Keymap       | Mode          | Action        | Description        |
| ------------ | ------------- | ------------- | ------------------ |
| `<leader>ca` | Normal/Visual | `code_action` | Show code actions  |
| `<leader>rn` | Normal        | `rename`      | Rename symbol      |
| `<leader>rs` | Normal        | `:LspRestart` | Restart LSP server |

## ✨ Formatting & Comments

### Formatting

| Keymap        | Mode          | Action           | Description                        |
| ------------- | ------------- | ---------------- | ---------------------------------- |
| `<leader>fm`  | Normal/Visual | `conform.format` | Format file/selection              |
| _Auto-format_ | -             | _On save_        | _Automatic formatting when saving_ |

### Comments

| Keymap      | Mode          | Action           | Description           |
| ----------- | ------------- | ---------------- | --------------------- |
| `<leader>/` | Normal/Visual | `:CommentToggle` | Toggle comment        |
| `<C-/>`     | Normal/Visual | `:CommentToggle` | Toggle comment (fast) |

## 🩺 Diagnostics

| Keymap       | Mode   | Action        | Description               |
| ------------ | ------ | ------------- | ------------------------- |
| `<leader>ld` | Normal | `open_float`  | Show diagnostic details   |
| `<leader>D`  | Normal | `diagnostics` | Show buffer diagnostics   |
| `[d`         | Normal | `goto_prev`   | Go to previous diagnostic |
| `]d`         | Normal | `goto_next`   | Go to next diagnostic     |

## 🚀 Special Features

### Markdown

| Keymap       | Mode   | Action                   | Description                    |
| ------------ | ------ | ------------------------ | ------------------------------ |
| `<leader>md` | Normal | `:MarkdownPreviewToggle` | Toggle markdown preview        |
| `<F12>`      | Normal | `:MarkdownPreviewToggle` | Toggle markdown preview (fast) |

### Session Management

| Keymap | Mode | Action                 | Description                    |
| ------ | ---- | ---------------------- | ------------------------------ |
| _Auto_ | -    | _Session save/restore_ | _Automatic session management_ |

---

## 💡 Tips & Patterns

### 🎨 Keymap Patterns

- **`<leader>f*`** - File operations (find, grep, etc.)
- **`<leader>w*`** - Window operations
- **`<leader>b*`** - Buffer operations
- **`<leader>l*`** - LSP/Language operations
- **`<C-*>`** - Fast access shortcuts
- **`<S-*>`** - Shift shortcuts for navigation

### 🏃‍♂️ Fast Access Shortcuts

- `<C-h/j/k/l>` - Window navigation
- `<S-h/l>` - Buffer navigation
- `<C-p>` - Find files
- `<C-f>` - Live grep
- `<C-n>` - File tree
- `<C-/>` - Comment toggle

### 🧠 Memory Aids

- **f** = **F**ind (files, grep, buffers)
- **w** = **W**indow (split, resize, navigate)
- **b** = **B**uffer (next, previous, delete)
- **c** = **C**ode (actions, rename)
- **d** = **D**iagnostics (errors, warnings)
- **l** = **L**SP (language server)
- **e** = **E**xplorer (file tree)

### ⚡ Pro Tips

1. **Use the fast shortcuts** (`<C-*>`, `<S-*>`) for frequently used actions
2. **Use mnemonic shortcuts** (`<leader>*`) when learning or for precision
3. **Visual mode** works with formatting (`<leader>fm`) and comments (`<leader>/`)
4. **Auto-format on save** is enabled - just save your files!
5. **Session restoration** happens automatically when you open Neovim

---

_Generated for Neovim configuration - Keep this handy for quick reference!_ 🎯
