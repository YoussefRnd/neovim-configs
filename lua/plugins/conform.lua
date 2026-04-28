local format_opts = { lsp_format = "fallback", timeout_ms = 1000 }

return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format(format_opts)
      end,
      mode = { "n", "v" },
      desc = "Format file or range",
    },
  },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        python = { "ruff_format" },
        lua = { "stylua" },
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
      format_on_save = format_opts,
    })
  end,
}
