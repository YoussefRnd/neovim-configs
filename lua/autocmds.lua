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

-- UI Highlights: Ensure borders and rounded corners are visible and dynamic
autocmd({ "ColorScheme", "VimEnter" }, {
	group = augroup("ui_highlights", { clear = true }),
	callback = function()
		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
		vim.api.nvim_set_hl(0, "FloatBorder", { link = "LineNr" })

		-- Telescope specific links to integrate seamlessly
		vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder", force = true })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "FloatBorder", force = true })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "FloatBorder", force = true })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "FloatBorder", force = true })
		
		-- Override base16 solid background boxes
		vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "NormalFloat", force = true })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { link = "NormalFloat", force = true })
		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { link = "NormalFloat", force = true })
		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { link = "NormalFloat", force = true })

		-- Titles
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "Function", reverse = true, force = true })
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { link = "String", reverse = true, force = true })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { link = "Statement", reverse = true, force = true })
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

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Wrap and check for spell in text filetypes
autocmd("FileType", {
  group = augroup("wrap_spell", { clear = true }),
  pattern = { "gitcommit", "markdown", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Close some filetypes with <q>
autocmd("FileType", {
  group = augroup("close_with_q", { clear = true }),
  pattern = {
    "help",
    "lspinfo",
    "notify",
    "qf",
    "startuptime",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime", { clear = true }),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- Resize splits if window got resized
autocmd({ "VimResized" }, {
  group = augroup("resize_splits", { clear = true }),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

