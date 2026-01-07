return {
  "mbbill/undotree",
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle undotree" },
  },
  config = function()
    vim.g.undotree_WindowLayout = 2 -- Tree on left, diff below
    vim.g.undotree_SplitWidth = 30
    vim.g.undotree_SetFocusWhenToggle = 1 -- Focus undotree when opened
    vim.g.undotree_ShortIndicators = 1 -- Use short time indicators
  end,
}
