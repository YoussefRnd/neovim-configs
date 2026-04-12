# Neovim Config Fixes Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Fix all 16 identified bugs, deprecated APIs, and misconfigurations across the Neovim config.

**Architecture:** Surgical per-file edits only — no restructuring. Tasks are grouped by file to minimize context switching. Each task ends with a headless Neovim smoke-test and a commit.

**Tech Stack:** Neovim 0.11+, Lua, lazy.nvim, blink.cmp, mason.nvim

---

### Task 1: `lua/options.lua` — fixes #6, #8, #9, #12

**Files:**
- Modify: `lua/options.lua`

- [ ] **Step 1: Apply all four fixes**

Replace `lua/options.lua` entirely with:

```lua
-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.autowrite = true
vim.opt.clipboard = "unnamedplus"
vim.opt.conceallevel = 2
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars = { eob = " " }
vim.opt.formatoptions = "jcroqlnt"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.jumpoptions = "view"
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = { trail = "·", nbsp = "␣" }
vim.opt.number = true
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = false  -- treesitter handles indentation; smartindent causes double-indent
vim.opt.smarttab = true
vim.opt.spelllang = "en_us"
vim.opt.spelloptions = "camel"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"
vim.opt.tabstop = 2
vim.opt.timeoutlen = 300
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200
vim.opt.virtualedit = "block"
vim.opt.winminwidth = 5
vim.opt.wrap = false
vim.opt.smoothscroll = true

-- Ensure undodir exists so undo persistence never silently fails (#9)
vim.fn.mkdir(vim.fn.stdpath("data") .. "/undodir", "p")

-- Return to last edit position when opening files (#8: named augroup, #12: filetype guard)
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("restore_cursor", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.tbl_contains({ "gitcommit", "gitrebase" }, vim.bo.filetype) then return end
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end,
})
```

- [ ] **Step 2: Smoke-test**

```bash
nvim --headless -c "lua print('options ok')" -c "qa" 2>&1
```
Expected: prints `options ok`, no error output.

- [ ] **Step 3: Commit**

```bash
git add lua/options.lua
git commit -m "fix(options): disable smartindent, mkdir undodir, augroup+guard BufReadPost"
```

---

### Task 2: `lua/plugins/lspconfig.lua` — fixes #2, #3, #5, #8, #16

**Files:**
- Modify: `lua/plugins/lspconfig.lua`

- [ ] **Step 1: Apply all five fixes**

Replace `lua/plugins/lspconfig.lua` entirely with:

```lua
return {
  -- Mason: installs LSP servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- mason-lspconfig: ensures servers are installed
  -- neovim/nvim-lspconfig removed (#5): config uses vim.lsp.config/enable (Neovim 0.11 native API)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Diagnostic display
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
        virtual_text = {
          prefix = "●",
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -- LSP keymaps via LspAttach (#8: named augroup prevents duplicates on re-source)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          if client and client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end

          local map = function(mode, key, action, desc)
            vim.keymap.set(mode, key, action, { noremap = true, silent = true, buffer = bufnr, desc = desc })
          end

          -- Go to
          map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Go to definition")
          map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
          map("n", "gr", "<cmd>Telescope lsp_references<CR>", "Go to references")
          map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Go to implementation")
          map("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>", "Go to type definition")

          -- Actions
          map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "Code action")
          map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
          map("n", "<leader>ld", vim.diagnostic.open_float, "Line diagnostics")
          map("n", "<leader>ls", "<cmd>LspRestart<CR>", "Restart LSP")
          map("n", "<leader>li", "<cmd>checkhealth vim.lsp<CR>", "LSP health") -- #16: renamed in 0.11
          map("n", "<leader>lh", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
          end, "Toggle inlay hints")
          map("n", "K", vim.lsp.buf.hover, "Hover documentation")
          map("n", "<leader>lk", vim.lsp.buf.signature_help, "Signature help")

          -- Diagnostics navigation
          map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
          map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")

          -- Document highlight (replaces vim-illuminate)
          if client and client:supports_method("textDocument/documentHighlight") then
            local group = vim.api.nvim_create_augroup("lsp_document_highlight_" .. bufnr, { clear = true })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = bufnr,
              group = group,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
              buffer = bufnr,
              group = group,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- LspRestart: fixed for Neovim 0.11 API (#2: use client.attached_buffers, #3: reliable restart)
      vim.api.nvim_create_user_command("LspRestart", function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        for _, client in ipairs(clients) do
          local bufs = vim.tbl_keys(client.attached_buffers) -- #2: replaces removed get_buffers_by_client_id
          client:stop()
          vim.defer_fn(function()
            for _, buf in ipairs(bufs) do
              if vim.api.nvim_buf_is_valid(buf) then
                vim.api.nvim_buf_call(buf, function()
                  vim.cmd("doautocmd FileType " .. vim.bo[buf].filetype)
                end)
              end
            end
          end, 500)
        end
      end, { desc = "Restart LSP clients for current buffer" })

      -- Global capabilities (blink.cmp enhances them)
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      -- Server-specific configs
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
      })

      vim.lsp.config("ts_ls", {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "literal",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })

      -- Ensure servers are installed; auto-enable any server mason installs
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "ts_ls",
          "lua_ls",
        },
        handlers = {
          function(server_name)
            vim.lsp.enable(server_name)
          end,
        },
      })
    end,
  },
}
```

- [ ] **Step 2: Smoke-test**

```bash
nvim --headless -c "lua print('lsp ok')" -c "qa" 2>&1
```
Expected: prints `lsp ok`, no errors.

- [ ] **Step 3: Commit**

```bash
git add lua/plugins/lspconfig.lua
git commit -m "fix(lsp): augroup, attached_buffers API, LspRestart, checkhealth path, drop lspconfig dep"
```

---

### Task 3: `lua/plugins/lint.lua` — fixes #8, #11

**Files:**
- Modify: `lua/plugins/lint.lua`

- [ ] **Step 1: Apply both fixes**

Replace `lua/plugins/lint.lua` with:

```lua
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- lua removed (#11): lua_ls already provides full diagnostics; luacheck causes duplicates
    lint.linters_by_ft = {
      javascript      = { "eslint_d" },
      typescript      = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      c               = { "clangtidy" },
      cpp             = { "clangtidy" },
    }

    -- #8: named augroup prevents duplicate autocmds if this file is re-sourced
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("nvim_lint", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
```

- [ ] **Step 2: Smoke-test**

```bash
nvim --headless -c "lua print('lint ok')" -c "qa" 2>&1
```
Expected: prints `lint ok`, no errors.

- [ ] **Step 3: Commit**

```bash
git add lua/plugins/lint.lua
git commit -m "fix(lint): add augroup, remove lua luacheck (duplicates lua_ls diagnostics)"
```

---

### Task 4: `lua/plugins/toggleterm.lua` — fix #1

**Files:**
- Modify: `lua/plugins/toggleterm.lua`

- [ ] **Step 1: Remove duplicate `open_mapping` from `keys`**

The `open_mapping = [[<C-\>]]` in `opts` already registers the keymap in all modes. The `keys` entry duplicates it.

Replace `lua/plugins/toggleterm.lua` with:

```lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  -- <C-\> is registered automatically via open_mapping in opts below
  keys = {
    { "<leader>tf", "<cmd>ToggleTerm direction=float<CR>",      desc = "Float terminal" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal size=15<CR>", desc = "Horizontal terminal" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<CR>",   desc = "Vertical terminal" },
  },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
    },
  },
}
```

- [ ] **Step 2: Smoke-test**

```bash
nvim --headless -c "lua print('toggleterm ok')" -c "qa" 2>&1
```

- [ ] **Step 3: Commit**

```bash
git add lua/plugins/toggleterm.lua
git commit -m "fix(toggleterm): remove duplicate <C-\\> from keys (open_mapping already registers it)"
```

---

### Task 5: `lua/plugins/blink-cmp.lua` — fix #4

**Files:**
- Modify: `lua/plugins/blink-cmp.lua`

- [ ] **Step 1: Enable blink.cmp's native `auto_brackets`**

blink.cmp has a built-in `completion.accept.auto_brackets` feature that adds `()` after function/method completions — the correct fix without needing an extra plugin.

Replace `lua/plugins/blink-cmp.lua` with:

```lua
return {
  "saghen/blink.cmp",
  version = "*",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  opts = {
    snippets = { preset = "luasnip" },

    keymap = {
      preset = "none",
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    completion = {
      accept = {
        -- #4: add () after function/method completions (replaces nvim-autopairs cmp integration)
        auto_brackets = {
          enabled = true,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = "rounded" },
      },
      menu = {
        border = "rounded",
      },
    },

    appearance = {
      nerd_font_variant = "mono",
    },
  },
}
```

- [ ] **Step 2: Smoke-test**

```bash
nvim --headless -c "lua print('blink ok')" -c "qa" 2>&1
```

- [ ] **Step 3: Commit**

```bash
git add lua/plugins/blink-cmp.lua
git commit -m "fix(blink-cmp): enable auto_brackets for function completion (fixes autopairs integration)"
```

---

### Task 6: `lua/plugins/lualine.lua` — fix #7

**Files:**
- Modify: `lua/plugins/lualine.lua`

- [ ] **Step 1: Remove dead `inactive_sections` block**

With `globalstatus = true`, there is one global statusline; `inactive_sections` is never rendered.

Replace `lua/plugins/lualine.lua` with:

```lua
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local muted = "#a59a99"

    local env = {
      function()
        local venv = vim.env.VIRTUAL_ENV
        if venv then
          return "  " .. vim.fn.fnamemodify(venv, ":t")
        end
        return ""
      end,
      color = { fg = muted },
    }

    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", fmt = function(s) return s:lower() end } },
        lualine_b = { "branch", "diff" },
        lualine_c = { { "filename", path = 1, symbols = { modified = "●", readonly = "", unnamed = "—" } } },
        lualine_x = { env, "diagnostics", "filetype" },
        lualine_y = {},
        lualine_z = { "location" },
      },
    })
  end,
}
```

- [ ] **Step 2: Smoke-test**

```bash
nvim --headless -c "lua print('lualine ok')" -c "qa" 2>&1
```

- [ ] **Step 3: Commit**

```bash
git add lua/plugins/lualine.lua
git commit -m "fix(lualine): remove dead inactive_sections (globalstatus = true renders one statusline)"
```

---

### Task 7: `lua/plugins/bufferline.lua` — fix #10

**Files:**
- Modify: `lua/plugins/bufferline.lua`

- [ ] **Step 1: Remove `!` from bdelete commands**

`bdelete!` silently discards unsaved changes; `bdelete` will prompt instead.

In `lua/plugins/bufferline.lua`, change:
- `close_command = "bdelete! %d"` → `close_command = "bdelete %d"`
- `right_mouse_command = "bdelete! %d"` → `right_mouse_command = "bdelete %d"`

```lua
-- In options block:
close_command = "bdelete %d",
right_mouse_command = "bdelete %d",
```

- [ ] **Step 2: Smoke-test**

```bash
nvim --headless -c "lua print('bufferline ok')" -c "qa" 2>&1
```

- [ ] **Step 3: Commit**

```bash
git add lua/plugins/bufferline.lua
git commit -m "fix(bufferline): use bdelete instead of bdelete! to prompt on unsaved changes"
```

---

### Task 8: `lua/plugins/telescope.lua` — fix #13

**Files:**
- Modify: `lua/plugins/telescope.lua`

- [ ] **Step 1: Replace `:cmd<cr>` with `<cmd>cmd<CR>` in all keys**

`<cmd>` avoids entering command-line mode, doesn't echo the command, and works across all modes.

Replace all `keys` entries — change each `":Telescope ...<cr>"` to `"<cmd>Telescope ...<CR>"`:

```lua
keys = {
  { "<leader>ff", "<cmd>Telescope find_files<CR>",             desc = "Find files" },
  { "<leader>fg", "<cmd>Telescope live_grep<CR>",              desc = "Live grep" },
  { "<leader>fb", "<cmd>Telescope buffers<CR>",                desc = "Find buffers" },
  { "<leader>fh", "<cmd>Telescope help_tags<CR>",              desc = "Find help" },
  { "<leader>fo", "<cmd>Telescope oldfiles<CR>",               desc = "Find recent files" },
  { "<leader>fc", "<cmd>Telescope git_commits<CR>",            desc = "Find commits" },
  { "<leader>fd", "<cmd>Telescope diagnostics<CR>",            desc = "Find diagnostics" },
  { "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>",   desc = "Find symbols" },
  { "<leader>fk", "<cmd>Telescope keymaps<CR>",                desc = "Find keymaps" },
  { "<C-p>",      "<cmd>Telescope find_files<CR>",             desc = "Find files (fast)" },
},
```

- [ ] **Step 2: Smoke-test**

```bash
nvim --headless -c "lua print('telescope ok')" -c "qa" 2>&1
```

- [ ] **Step 3: Commit**

```bash
git add lua/plugins/telescope.lua
git commit -m "fix(telescope): use <cmd>...<CR> keymaps instead of :...<cr>"
```

---

### Task 9: `lua/plugins/which-key.lua` — fix #14

**Files:**
- Modify: `lua/plugins/which-key.lua`

- [ ] **Step 1: Add missing `<leader>a` / `<leader>A` entries**

These are treesitter swap-argument keymaps (defined in `treesitter.lua`) that are absent from the which-key spec.

Add to the `spec` list:

```lua
{ "<leader>a",  desc = "Swap next argument" },
{ "<leader>A",  desc = "Swap previous argument" },
```

Full updated `spec`:

```lua
spec = {
  -- Groups
  { "<leader>f",  group = "find" },
  { "<leader>g",  group = "git" },
  { "<leader>l",  group = "lsp" },
  { "<leader>w",  group = "window" },
  { "<leader>b",  group = "buffer" },
  { "<leader>x",  group = "trouble" },
  { "<leader>t",  group = "terminal" },
  { "<leader>s",  group = "session" },
  { "<leader>m",  group = "markdown" },
  -- Standalone
  { "<leader>e",  desc = "File explorer" },
  { "<leader>u",  desc = "Undo tree" },
  { "<leader>q",  desc = "Quit" },
  { "<leader>fm", desc = "Format" },
  { "<leader>d",  desc = "Delete without yanking" },
  { "<leader>y",  desc = "Yank to clipboard" },
  { "<leader>p",  desc = "Paste without losing clipboard" },
  { "<leader>a",  desc = "Swap next argument" },
  { "<leader>A",  desc = "Swap previous argument" },
},
```

- [ ] **Step 2: Smoke-test**

```bash
nvim --headless -c "lua print('which-key ok')" -c "qa" 2>&1
```

- [ ] **Step 3: Commit**

```bash
git add lua/plugins/which-key.lua
git commit -m "fix(which-key): add missing <leader>a and <leader>A treesitter swap entries"
```

---

### Task 10: `lua/plugins/render-markdown.lua` — fix #15

**Files:**
- Modify: `lua/plugins/render-markdown.lua`

- [ ] **Step 1: Remove `"c"` from `render_modes`**

Command mode rendering is non-standard and unexpected. Use only `"n"`.

Change:
```lua
render_modes = { "n", "c" },
```
to:
```lua
render_modes = { "n" },
```

- [ ] **Step 2: Smoke-test**

```bash
nvim --headless -c "lua print('render-markdown ok')" -c "qa" 2>&1
```

- [ ] **Step 3: Commit**

```bash
git add lua/plugins/render-markdown.lua
git commit -m "fix(render-markdown): remove command mode from render_modes"
```
