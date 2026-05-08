vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.cursorline = true
vim.opt.fillchars = { eob = " " }
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = { tab = "▸·", trail = "·", nbsp = "␣", extends = "…", precedes = "…" }
vim.opt.number = true
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smoothscroll = true
local border = require("core.ui").border
vim.opt.winborder = border
vim.opt.winminwidth = 5
vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.formatoptions = "jcroqlnt"
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.virtualedit = "block"

vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.autowrite = true
vim.opt.confirm = true
vim.opt.clipboard = "unnamedplus"
vim.opt.inccommand = "nosplit"
vim.opt.jumpoptions = "view"
vim.opt.shortmess:append("WICc")
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.timeoutlen = 500
vim.opt.updatetime = 200

vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.spelllang = "en_us"
vim.opt.spelloptions = "camel"

vim.opt.undofile = true
vim.opt.undolevels = 10000

vim.diagnostic.config({
	virtual_text = { prefix = "●" },
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = border,
		source = true,
		header = "",
		prefix = "",
	},
})
