return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
  ft = { "markdown" },
  keys = {
    { "<leader>md", "<cmd>RenderMarkdown toggle<CR>", desc = "Toggle markdown render" },
    { "<F12>",      "<cmd>RenderMarkdown toggle<CR>", desc = "Toggle markdown render" },
  },
  opts = {
    render_modes = { "n" },
    heading = { enabled = true },
    code = { enabled = true, style = "full" },
    dash = { enabled = true },
    bullet = { enabled = true },
    checkbox = { enabled = true },
    table = { enabled = true },
    link = { enabled = true },
  },
}
