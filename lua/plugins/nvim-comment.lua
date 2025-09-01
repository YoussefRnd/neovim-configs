return {
  'terrortylor/nvim-comment',
  keys = {
    { "<leader>/", ":CommentToggle<cr>", mode = {"n", "v"}, desc = "Toggle comment" },
    { "<C-/>", ":CommentToggle<cr>", mode = {"n", "v"}, desc = "Toggle comment (fast)" },
  },
  config = function()
    require("nvim_comment").setup({ create_mappings = false })
  end
}
