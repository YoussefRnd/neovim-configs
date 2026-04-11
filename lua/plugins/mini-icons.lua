return {
  { "nvim-tree/nvim-web-devicons", enabled = false },
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {},
    init = function()
      -- Mock nvim-web-devicons so plugins that depend on it get mini.icons instead
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
}
