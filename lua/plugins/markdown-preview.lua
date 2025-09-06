return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  keys = {
    { "<leader>md", ":MarkdownPreviewToggle<cr>", desc = "Toggle markdown preview" },
    { "<F12>", ":MarkdownPreviewToggle<cr>", desc = "Toggle markdown preview (fast)" },
  },
}
