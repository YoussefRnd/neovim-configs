return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = 'Telescope',
  keys = {
    { "<leader>ff", ":Telescope find_files<cr>",  desc = "Find files" },
    { "<leader>fg", ":Telescope live_grep<cr>",   desc = "Live grep" },
    { "<leader>fb", ":Telescope buffers<cr>",     desc = "Find buffers" },
    { "<leader>fh", ":Telescope help_tags<cr>",   desc = "Find help" },
    { "<leader>fo", ":Telescope oldfiles<cr>",    desc = "Find recent files" },
    { "<leader>fc", ":Telescope git_commits<cr>", desc = "Find commits" },
    -- Fast access alternatives
    { "<C-p>",      ":Telescope find_files<cr>",  desc = "Find files (fast)" },
    { "<C-f>",      ":Telescope live_grep<cr>",   desc = "Live grep (fast)" },
  },
}
