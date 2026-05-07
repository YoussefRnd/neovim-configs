return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>",              desc = "Diagnostics (project)" },
    { "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Diagnostics (buffer)" },
    { "<leader>xs", "<cmd>Trouble symbols toggle<CR>",                  desc = "Symbols" },
    { "<leader>xr", "<cmd>Trouble lsp_references toggle<CR>",           desc = "LSP references" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<CR>",                   desc = "Quickfix list" },
  },
  opts = {
    modes = {
      diagnostics = {
        win = {
          type = "float",
          position = "bottom",
          relative = "editor",
          border = "rounded",
        },
      },
      symbols = {
        win = {
          type = "float",
          position = "right",
          relative = "editor",
          border = "rounded",
        },
      },
      lsp_references = {
        win = {
          type = "float",
          position = "bottom",
          relative = "editor",
          border = "rounded",
        },
      },
      qflist = {
        win = {
          type = "float",
          position = "bottom",
          relative = "editor",
          border = "rounded",
        },
      },
    },
  },
}
