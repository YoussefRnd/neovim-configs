return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  keys = {
    { "<leader>mp", ":MarkdownPreviewToggle<cr>", desc = "Toggle markdown preview", silent = true },
    { "<F12>", ":MarkdownPreviewToggle<cr>", desc = "Toggle markdown preview (fast)", silent = true },
  },
}
