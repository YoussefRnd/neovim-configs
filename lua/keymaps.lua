-- General keymaps (LSP/git keymaps live in their respective plugin files)

vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save" })

-- General
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Window commands prefix" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- Clipboard operations
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without losing clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Buffer management
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>",     { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>",   { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>", { desc = "Close other buffers" })

-- Commenting (builtin gc operator, Neovim 0.10+)
vim.keymap.set("n", "<leader>/", "gcc",  { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<leader>/", "gc",   { desc = "Toggle comment", remap = true })
vim.keymap.set("n", "<C-/>",     "gcc",  { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<C-/>",     "gc",   { desc = "Toggle comment", remap = true })
vim.keymap.set("n", "<C-_>",     "gcc",  { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<C-_>",     "gc",   { desc = "Toggle comment", remap = true })

-- Move code up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered when scrolling/jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz",  { desc = "Scroll down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz",  { desc = "Scroll up (centered)" })
vim.keymap.set("n", "n",     "nzzzv",    { desc = "Next search result (centered)" })
vim.keymap.set("n", "N",     "Nzzzv",    { desc = "Previous search result (centered)" })

-- Window management
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Equal split sizes" })
vim.keymap.set("n", "<leader>wx", "<C-w>c", { desc = "Close split" })

-- Resize window
vim.keymap.set("n", "<C-Up>",    "<cmd>resize +2<CR>",          { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>",  "<cmd>resize -2<CR>",          { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>",  "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })
