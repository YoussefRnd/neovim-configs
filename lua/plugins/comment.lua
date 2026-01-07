return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require("ts_context_commentstring").setup({
      enable_autocmd = false,
    })

    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
  end,
  keys = {
    { "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", desc = "Toggle comment" },
    { "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", mode = "v", desc = "Toggle comment" },
    { "<C-/>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", desc = "Toggle comment" },
    { "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", mode = "v", desc = "Toggle comment" },
  },
}
