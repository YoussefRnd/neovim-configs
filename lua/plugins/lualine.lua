return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local function hide_in_width()
      return vim.fn.winwidth(0) > 80
    end

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
        lualine_b = { { "branch", cond = hide_in_width }, { "diff", cond = hide_in_width } },
        lualine_c = { { "filename", path = 1, symbols = { modified = "●", readonly = "", unnamed = "—" } } },
        lualine_x = {
          {
            "diagnostics",
            symbols = { error = "E", warn = "W", info = "I", hint = "H" },
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
