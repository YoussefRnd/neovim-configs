return {
  'terrortylor/nvim-comment',
  keys = {
    { "<leader>/", ":CommentToggle<cr>", mode = {"n", "v"}, desc = "Toggle comment", silent = true },
    { "<C-/>", ":CommentToggle<cr>", mode = {"n", "v"}, desc = "Toggle comment (fast)", silent = true },
  },
  config = function()
    require("nvim_comment").setup({ create_mappings = false })
  end
}
