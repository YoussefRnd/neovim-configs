local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Restore saved colorscheme after all plugins load.
-- Keep this in sync with the colorscheme picker in lua/plugins/telescope.lua.
autocmd("VimEnter", {
  group = augroup("restore_colorscheme", { clear = true }),
  once = true,
  callback = function()
    local state_file = vim.fn.stdpath("state") .. "/colorscheme"

    if vim.fn.filereadable(state_file) ~= 1 then
      return
    end

    local saved = vim.fn.readfile(state_file)[1]
    if saved and saved ~= "" then
      pcall(vim.cmd.colorscheme, saved)
    end
  end,
})

-- Restore cursor position when reopening files.
autocmd("BufReadPost", {
  group = augroup("restore_cursor", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.tbl_contains({ "gitcommit", "gitrebase" }, vim.bo.filetype) then
      return
    end

    local mark = vim.fn.line([['"]])
    if mark > 0 and mark <= vim.api.nvim_buf_line_count(0) then
      pcall(vim.cmd, [[normal! g`"]])
    end
  end,
})
