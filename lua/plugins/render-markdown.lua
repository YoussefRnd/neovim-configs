return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
  ft = { "markdown" },
  keys = {
    { "<leader>md", "<cmd>RenderMarkdown toggle<CR>", desc = "Toggle markdown render" },
  },
  opts = {
    render_modes = { "n" },
  },
}
