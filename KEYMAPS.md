# Neovim Keymap Reference

> **Tip:** Press `<leader>` and wait — which-key shows all keymaps live.
> `<leader>fk` fuzzy-searches every keymap by description.
> **Leader key:** `<Space>`

---

## General

| Keymap      | Mode              | Description                    |
| ----------- | ----------------- | ------------------------------ |
| `<C-s>`     | Normal/Insert/Visual | Save file                   |
| `<leader>q` | Normal            | Quit                           |
| `<leader>u` | Normal            | Toggle undo tree               |
| `<Esc>`     | Normal            | Clear search highlight         |
| `Q`         | Normal            | Disabled (Ex mode safety)      |

---

## Navigation

### Scrolling (cursor stays centered)

| Keymap  | Description                       |
| ------- | --------------------------------- |
| `<C-d>` | Scroll down                       |
| `<C-u>` | Scroll up                         |
| `n`     | Next search result (centered)     |
| `N`     | Previous search result (centered) |

### Flash (character jump — fastest cursor movement)

| Keymap | Mode          | Description                          |
| ------ | ------------- | ------------------------------------ |
| `gs`   | Normal/Visual/Op | Jump to any visible character     |
| `gS`   | Normal/Visual/Op | Jump using treesitter node        |
| `r`    | Operator         | Remote flash (act on distant obj) |
| `R`    | Operator/Visual  | Treesitter search                 |

> **Workflow:** `gs` → type 2 chars → jump. Faster than `f`/`t` for long-range moves.

---

## Editing

| Keymap       | Mode          | Description                    |
| ------------ | ------------- | ------------------------------ |
| `<leader>y`  | Normal/Visual | Yank to system clipboard       |
| `<leader>Y`  | Normal        | Yank line to system clipboard  |
| `<leader>d`  | Normal/Visual | Delete without yanking         |
| `<leader>p`  | Visual        | Paste without losing clipboard |
| `<leader>fm` | Normal/Visual | Format file/selection          |
| `J`          | Visual        | Move selection down            |
| `K`          | Visual        | Move selection up              |
| `<leader>/`  | Normal/Visual | Toggle comment                 |
| `<C-/>`      | Normal/Visual | Toggle comment (fast)          |

### Treesitter Textobjects

| Keymap | Mode     | Description              |
| ------ | -------- | ------------------------ |
| `vaf`  | Visual   | Select around function   |
| `vif`  | Visual   | Select inside function   |
| `vac`  | Visual   | Select around class      |
| `vic`  | Visual   | Select inside class      |
| `vaa`  | Visual   | Select around argument   |
| `via`  | Visual   | Select inside argument   |
| `]m`   | Normal   | Next function start      |
| `[m`   | Normal   | Previous function start  |
| `]]`   | Normal   | Next class start         |
| `[[`   | Normal   | Previous class start     |
| `<leader>a` | Normal | Swap with next argument |
| `<leader>A` | Normal | Swap with prev argument |

---

## Buffers

| Keymap       | Description          |
| ------------ | -------------------- |
| `<S-l>`      | Next buffer          |
| `<S-h>`      | Previous buffer      |
| `<leader>bd` | Close current buffer |
| `<leader>bo` | Close other buffers  |

---

## Windows

| Keymap       | Description               |
| ------------ | ------------------------- |
| `<C-h/j/k/l>`| Move between windows      |
| `<leader>wv` | Split vertically          |
| `<leader>ws` | Split horizontally        |
| `<leader>we` | Equalize split sizes      |
| `<leader>wx` | Close current split       |
| `<C-Up/Down>`| Resize height             |
| `<C-Left/Right>` | Resize width          |

---

## Find (Telescope) — `<leader>f*`

| Keymap        | Description                  |
| ------------- | ---------------------------- |
| `<leader>ff`  | Find files                   |
| `<leader>fg`  | Live grep (search text)      |
| `<leader>fb`  | Find open buffers            |
| `<leader>fo`  | Recent files                 |
| `<leader>fh`  | Search help docs             |
| `<leader>fc`  | Browse git commits           |
| `<leader>fd`  | Find diagnostics             |
| `<leader>fs`  | Find document symbols        |
| `<leader>fk`  | Search all keymaps           |
| `<leader>fC`  | Find colorscheme             |
| `<C-p>`       | Find files (fast)            |

---

## LSP — `<leader>l*`, `g*`, and diagnostics

| Keymap        | Description            |
| ------------- | ---------------------- |
| `gd`          | Go to definition       |
| `gD`          | Go to declaration      |
| `gr`          | Go to references       |
| `gi`          | Go to implementation   |
| `gy`          | Go to type definition  |
| `K`           | Hover documentation    |
| `<leader>la`  | Code action            |
| `<leader>lr`  | Rename symbol          |
| `<leader>ld`  | Line diagnostics float |
| `<leader>lh`  | Toggle inlay hints     |

> **Diagnostic motions:** `]d` / `[d` move through diagnostics; `<leader>ld` opens a float for the current line.

---

## Trouble Lists

| Keymap       | Description                  |
| ------------ | ---------------------------- |
| `]d`         | Next diagnostic              |
| `[d`         | Previous diagnostic          |
| `<leader>xx` | Trouble: project problems    |
| `<leader>xb` | Trouble: buffer problems     |
| `<leader>xs` | Trouble: symbols             |
| `<leader>xr` | Trouble: references          |
| `<leader>xq` | Trouble: quickfix list       |

> **When to use Trouble vs float:** `<leader>ld` for a quick single-item read. `<leader>xx` when you need to triage a list.

---

## Git — `<leader>g*`

| Keymap        | Description            |
| ------------- | ---------------------- |
| `]c`          | Next git hunk          |
| `[c`          | Previous git hunk      |
| `<leader>gs`  | Stage hunk             |
| `<leader>gr`  | Reset hunk             |
| `<leader>gS`  | Stage entire buffer    |
| `<leader>gu`  | Undo stage hunk        |
| `<leader>gR`  | Reset entire buffer    |
| `<leader>gp`  | Preview hunk           |
| `<leader>gb`  | Toggle line blame      |
| `<leader>gd`  | Diff this              |
| `<leader>gD`  | Diff against last commit |
| `<leader>gg`  | Open LazyGit           |
| `<leader>gf`  | LazyGit current file   |
| `ih`          | Text object: git hunk  |

---

## File Explorer (Oil)

| Keymap      | Description                 |
| ----------- | --------------------------- |
| `<leader>e` | Toggle file explorer        |
| `<C-n>`     | Toggle file explorer (fast) |

> Oil is loaded eagerly so the file explorer is always available. It opens the filesystem as a buffer — edit filenames, delete, move with normal Vim commands, then `:w` to apply.

---

## Terminal

| Keymap         | Mode     | Description         |
| -------------- | -------- | ------------------- |
| ``<C-`>``      | Normal   | Open terminal split |
| `<Esc><Esc>`   | Terminal | Exit terminal mode  |

---

## Session — `<leader>s*`

| Keymap        | Description     |
| ------------- | --------------- |
| `<leader>ss`  | Save session    |
| `<leader>sr`  | Restore session |

---

## Markdown — `<leader>m*`

| Keymap        | Description            |
| ------------- | ---------------------- |
| `<leader>md`  | Toggle markdown render |
| `<F12>`       | Toggle markdown render |

---

## Namespace Reference

| Prefix        | Namespace        |
| ------------- | ---------------- |
| `<leader>f*`  | Find (Telescope) |
| `<leader>l*`  | LSP              |
| `<leader>g*`  | Git              |
| `<leader>b*`  | Buffer           |
| `<leader>w*`  | Window           |
| `<leader>x*`  | Trouble          |
| `<leader>s*`  | Session          |
| `<leader>m*`  | Markdown         |
| `g*`          | Go to (LSP nav)  |
| `[ ]`         | Prev/Next        |
| `v*`          | Treesitter select |
