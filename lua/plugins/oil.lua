local function toggle_oil()
  if vim.bo.filetype == "oil" then
    vim.cmd("bd")
  else
    require("oil").open()
  end
end

return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "echasnovski/mini.icons" },
  keys = {
    { "<leader>e", toggle_oil, desc = "Toggle file explorer" },
    { "<C-n>",     toggle_oil, desc = "Toggle file explorer (fast)" },
  },
  opts = {
    float = {
      border = "rounded",
      padding = 1,
      max_width = 0.9,
      max_height = 0.85,
      preview_split = "right",
    },
    view_options = {
      show_hidden = true,
    },
    delete_to_trash = true,
  },
}
