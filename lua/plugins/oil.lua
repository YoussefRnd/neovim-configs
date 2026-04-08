return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>e", "<cmd>Oil<CR>", desc = "Open file explorer" },
    { "<C-n>", "<cmd>Oil<CR>", desc = "Open file explorer (fast)" },
  },
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 2,
      border = "rounded",
    },
  },
}
