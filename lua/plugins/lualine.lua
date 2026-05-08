return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local function hide_in_width()
      return vim.fn.winwidth(0) > 80
    end

    local ui = require("core.ui")

    require("lualine").setup({
      options = {
        component_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = { "dashboard", "lazy", "mason" } },
        globalstatus = true,
        theme = "auto",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", fmt = function(s) return s:lower() end } },
        lualine_b = {
          { "branch", cond = hide_in_width },
          {
            "diff",
            symbols = {
              added = ui.get_icon("git", "added"),
              modified = ui.get_icon("git", "modified"),
              removed = ui.get_icon("git", "removed"),
            },
            cond = hide_in_width,
          },
        },
        lualine_c = { { "filename", path = 1, symbols = { modified = "●", readonly = "", unnamed = "—" } } },
        lualine_x = {
          {
            "diagnostics",
            symbols = {
              error = ui.get_icon("lsp", "Error"),
              warn = ui.get_icon("lsp", "Warn"),
              info = ui.get_icon("lsp", "Info"),
              hint = ui.get_icon("lsp", "Hint"),
            },
            colored = false,
            update_in_insert = false,
            cond = hide_in_width,
          },
          { "filetype", icons_enabled = true },
        },
        lualine_z = { { "location", cond = hide_in_width } },
      },
    })
  end,
}
