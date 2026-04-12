return {
  "zaldih/themery.nvim",
  lazy = false,
  keys = {
    { "<leader>fC", "<cmd>Themery<CR>", desc = "Find colorscheme" },
  },
  config = function()
    require("themery").setup({
      -- All installed colorschemes, discovered at runtime
      themes = vim.fn.getcompletion("", "color"),
      livePreview = true,
    })
  end,
}
