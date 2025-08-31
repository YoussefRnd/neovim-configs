return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c", "cpp", "lua", "vim", "vimdoc", "query",
        "javascript", "typescript", "tsx", "json",
        "html", "css", "markdown", "markdown_inline",
        "bash", "regex" -- Added for noice.nvim
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
