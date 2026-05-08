return {
  { "nvim-tree/nvim-web-devicons", enabled = false },
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = require("core.ui").mini_icons_opts,
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
    config = function(_, opts)
      local mini_icons = require("mini.icons")
      mini_icons.setup(opts)
      mini_icons.tweak_lsp_kind()
    end,
  },
}
