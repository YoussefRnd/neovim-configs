return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "echasnovski/mini.icons" },
  opts = function()
    local function recent()
      return { icon = "󰃅 ", desc = "Recent files", action = "Telescope oldfiles" }
    end

    local function search()
      return { icon = "󀂭 ", desc = "Search files", action = "Telescope find_files" }
    end

    local function sessions()
      return { icon = "󰃇 ", desc = "Restore session", action = "SessionRestore" }
    end

    local function config()
      return { icon = "󰒓 ", desc = "Edit config", action = "Telescope find_files cwd=~/.config/nvim" }
    end

    return {
      theme = "doom",
      config = {
        border = "rounded",
        week_header = {
          enable = false,
        },
        center = {
          recent(),
          search(),
          sessions(),
          config(),
        },
      },
      hide = {
        statusline = false,
        tabline = true,
      },
    }
  end,
}
