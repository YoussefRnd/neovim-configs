return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "echasnovski/mini.icons" },
  opts = function()
    local ui = require("core.ui")

    local function recent()
      return {
        icon = ui.get_icon("ui", "history"),
        desc = "Recent files",
        action = "Telescope oldfiles",
        key = "r",
      }
    end

    local function search()
      return {
        icon = ui.get_icon("ui", "search"),
        desc = "Search files",
        action = "Telescope find_files",
        key = "f",
      }
    end

    local function sessions()
      return {
        icon = ui.get_icon("ui", "session"),
        desc = "Restore session",
        action = "SessionRestore",
        key = "s",
      }
    end

    local function config()
      return {
        icon = ui.get_icon("ui", "config"),
        desc = "Edit config",
        action = "Telescope find_files cwd=~/.config/nvim",
        key = "c",
      }
    end

    return {
      theme = "doom",
      config = {
        header = {
          [[                               __                ]],
          [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
          [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
          [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
          [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
          [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        },
        center = {
          search(),
          recent(),
          sessions(),
          config(),
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }
  end,
}
