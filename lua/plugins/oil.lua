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
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>e", toggle_oil, desc = "Toggle file explorer" },
    { "<C-n>", toggle_oil, desc = "Toggle file explorer (fast)" },
  },
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 2,
      border = "rounded",
    },
    delete_to_trash = true,
  },
}
