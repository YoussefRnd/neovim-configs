require('options')
require('keymaps')

-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim - automatically loads all files in lua/plugins/
require('lazy').setup("plugins", {
  change_detection = {
    notify = false, -- Don't notify about config changes
  },
  rocks = {
    enabled = false, -- Disable luarocks support
  },
})

-- Restore saved colorscheme after all plugins load
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    local state_file = vim.fn.stdpath("data") .. "/colorscheme"
    if vim.fn.filereadable(state_file) == 1 then
      local saved = vim.fn.readfile(state_file)[1]
      if saved and saved ~= "" then
        pcall(vim.cmd.colorscheme, saved)
      end
    end
  end,
})
