-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.autowrite = true -- enable auto write
vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 2 -- hide * markup for bold and italic in markdown
vim.opt.confirm = true -- confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- highlight the current line
-- vim.opt.encoding = "utf-8" -- Not needed, Neovim defaults to UTF-8
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.fillchars = { eob = " " } -- show empty lines at the end of a buffer as clear lines
vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.hlsearch = true -- highlight matches (use <Esc> to clear)
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.incsearch = true -- incrementally highlight searches as you type
vim.opt.laststatus = 3 -- global statusline
vim.opt.cmdheight = 1 -- height of the command line
vim.opt.list = true -- show tab characters and trailing whitespace
vim.opt.mouse = "a" -- enable mouse mode
vim.opt.number = true -- shows numberline
vim.opt.pumblend = 10 -- pseudo-transparency for popup menu
vim.opt.pumheight = 10 -- maximum number of entries in a popup
vim.opt.relativenumber = true -- relative line numbers
vim.opt.scrolloff = 8 -- minimum number of lines to keep above and below the cursor
vim.opt.sessionoptions = { "blank", "buffers", "curdir", "folds", "help", "tabpages", "winsize", "winpos", "terminal", "localoptions" }
vim.opt.shiftwidth = 2 -- number of space inserted for indentation
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false -- don't show mode since it's in statusline
vim.opt.showcmd = false -- don't show partial commands in the last line
vim.opt.sidescrolloff = 8 --minimum number of columns to keep above and below the cursor
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text in some cases
vim.opt.smartcase = true -- unless capital letter in search
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.softtabstop = 2
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.tabstop = 2 -- number of space in a tab
vim.opt.termguicolors = true -- enable true color support

-- Faster key sequence timeout (default is 1000ms)
vim.opt.timeoutlen = 300 -- Wait 300ms for key sequence completion
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200 -- faster completion
vim.opt.wildmode = "longest:full,full" -- command-line completion mode
vim.opt.winminwidth = 5 -- minimum window width
vim.opt.wrap = false -- disable line wrap
vim.opt.splitkeep = "screen" -- keep screen position when splitting
vim.opt.smoothscroll = true -- smooth scrolling (Neovim 0.10+)

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
      if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
        vim.cmd("normal! g`\"")
      end
    end
}) -- return to last edit position when opening files

