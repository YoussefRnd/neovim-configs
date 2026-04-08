return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find TODOs" },
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous TODO" },
  },
  opts = {},
}
