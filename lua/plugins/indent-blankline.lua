return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "IblScope", { link = "Function" })
    end)

    require("ibl").setup({
      indent = { char = "│" },
      scope = {
        enabled = true,
        highlight = "IblScope",
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = { "help", "dashboard", "lazy", "mason" },
      },
    })
  end,
}
