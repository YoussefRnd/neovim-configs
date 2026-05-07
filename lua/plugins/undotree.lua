return {
  "mbbill/undotree",
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle undotree" },
  },
  config = function()
    vim.g.undotree_WindowLayout = 4
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_SplitHorizontal = 1
    vim.g.undotree_DiffHorizontal = 0
  end,
}
