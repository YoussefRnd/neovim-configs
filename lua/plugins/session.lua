return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>ss", "<cmd>SessionSave<CR>",    desc = "Save session" },
    { "<leader>sr", "<cmd>SessionRestore<CR>", desc = "Restore session" },
  },
  opts = {
    suppressed_dirs = { "~/", "~/Downloads", "/" },
    git_use_branch_name = true,
    bypass_save_filetypes = { "TelescopePrompt", "oil", "lazy", "mason" },
  },
}
