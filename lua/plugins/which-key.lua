return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    delay = 400,
    icons = { mappings = true },
    spec = {
      -- Groups
      { "<leader>f",  group = "find" },
      { "<leader>g",  group = "git" },
      { "<leader>l",  group = "lsp" },
      { "<leader>w",  group = "window" },
      { "<leader>b",  group = "buffer" },
      { "<leader>x",  group = "trouble" },
      { "<leader>t",  group = "terminal" },
      { "<leader>s",  group = "session" },
      { "<leader>m",  group = "markdown" },
      -- Standalone
      { "<leader>e",  desc = "File explorer" },
      { "<leader>u",  desc = "Undo tree" },
      { "<leader>q",  desc = "Quit" },
      { "<leader>fm", desc = "Format" },
      { "<leader>d",  desc = "Delete without yanking" },
      { "<leader>y",  desc = "Yank to clipboard" },
      { "<leader>p",  desc = "Paste without losing clipboard" },
      { "<leader>a",  desc = "Swap next argument" },
      { "<leader>A",  desc = "Swap previous argument" },
    },
  },
}
