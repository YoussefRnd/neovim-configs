return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    delay = 400,
    icons = { mappings = true },
    spec = {
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
      { "<leader>l", group = "lsp" },
      { "<leader>w", group = "window" },
      { "<leader>b", group = "buffer" },
      { "<leader>x", group = "trouble" },
      { "<leader>t", group = "terminal" },
      { "<leader>s", group = "session" },
      { "<leader>m", group = "markdown" },
    },
  },
}
