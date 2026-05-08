if vim.loader then
	vim.loader.enable()
end

require("core.options")
require("core.keymaps")
require("core.autocmds")

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
		border = require("core.ui").border,
	},
	change_detection = {
		notify = false,
	},
	rocks = {
		enabled = false,
	},
})
