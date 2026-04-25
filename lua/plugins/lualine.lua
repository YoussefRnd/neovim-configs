return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local muted = "#a59a99"

    local env = {
      function()
        local venv = vim.env.VIRTUAL_ENV
        if venv then
          return "  " .. vim.fn.fnamemodify(venv, ":t")
        end
        local conda = vim.env.CONDA_DEFAULT_ENV
        if conda and conda ~= "" then
          return "  " .. conda
        end
        local pyenv = vim.env.PYENV_VERSION
        if pyenv and pyenv ~= "" then
          return "  " .. pyenv
        end
        return ""
      end,
      color = { fg = muted },
    }

    require("lualine").setup({
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", fmt = function(s) return s:lower() end } },
        lualine_b = { "branch", "diff" },
        lualine_c = { { "filename", path = 1, symbols = { modified = "●", readonly = "", unnamed = "—" } } },
        lualine_x = { env, "diagnostics", "filetype" },
        lualine_z = { "location" },
      },
    })
  end,
}
