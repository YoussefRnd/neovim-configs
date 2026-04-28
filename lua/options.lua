vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI
vim.opt.cursorline = true
vim.opt.fillchars = { eob = " " }
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = { trail = "·", nbsp = "␣" }
vim.opt.number = true
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smoothscroll = true
vim.opt.winborder = "rounded"
vim.opt.winminwidth = 5
vim.opt.wrap = false

-- Editing
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 0
vim.opt.expandtab = true
vim.opt.formatoptions = "jcroqlnt"
vim.opt.shiftwidth = 2
vim.opt.smartindent = false -- treesitter handles indentation
vim.opt.tabstop = 2
vim.opt.virtualedit = "block"

-- Search
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.smartcase = true

-- Behavior
vim.opt.autowrite = true
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.jumpoptions = "view"
vim.opt.mouse = "a"
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.timeoutlen = 500
vim.opt.updatetime = 200

-- Session
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Spell
vim.opt.spelllang = "en_us"
vim.opt.spelloptions = "camel"

-- Undo
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.fn.mkdir(vim.fn.stdpath("data") .. "/undodir", "p")

-- Diagnostics
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  virtual_text = { prefix = "●" },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    source = true,
    header = "",
    prefix = "",
  },
})
