if vim.loader then
	vim.loader.enable()
end

require("options")
require("keymaps")
require("autocmds")

-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	}, { text = true }):wait()
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	ui = {
		border = "rounded",
	},
	change_detection = {
		notify = false,
	},
	rocks = {
		enabled = false,
	},
})
