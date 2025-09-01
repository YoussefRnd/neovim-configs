return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>e", ":NvimTreeFindFileToggle<cr>", desc = "Toggle file tree" },
    { "<C-n>", ":NvimTreeFindFileToggle<cr>", desc = "Toggle file tree (fast)" },
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}
