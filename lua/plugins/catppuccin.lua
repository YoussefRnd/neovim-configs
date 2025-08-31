return {
  "catppuccin/nvim", 
  name = "catppuccin",
  priority = 1000, -- Load colorscheme early
  config = function()
    vim.cmd("colorscheme catppuccin-macchiato")
  end,
}
