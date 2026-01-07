return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Import lspconfig plugin
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    -- Used to enable autocompletion (assign to every lsp server config)
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Configure diagnostic display
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
      virtual_text = {
        prefix = "●", -- Could be '■', '▎', 'x', '●'
      },
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    -- LSP keymaps (will be attached to buffers with LSP)
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- Go to keybindings (g prefix)
      opts.desc = "Go to definition"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

      opts.desc = "Go to references"
      keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

      opts.desc = "Go to implementation"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

      opts.desc = "Go to type definition"
      keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>", opts)

      -- LSP actions (leader-l prefix)
      opts.desc = "Code action"
      keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)

      opts.desc = "Rename symbol"
      keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

      opts.desc = "Line diagnostics"
      keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)

      opts.desc = "Buffer diagnostics"
      keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>ls", "<cmd>LspRestart<CR>", opts)

      opts.desc = "LSP info"
      keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", opts)

      -- Documentation
      opts.desc = "Hover documentation"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "Signature help"
      keymap.set("n", "<leader>lk", vim.lsp.buf.signature_help, opts)

      -- Diagnostics navigation
      opts.desc = "Previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

      opts.desc = "Next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    end

    -- Used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Setup Mason
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- List of servers for mason to install
      ensure_installed = {
        "clangd", -- C/C++
        "ts_ls",  -- TypeScript/JavaScript
        "lua_ls", -- Lua
      },
      -- Auto-install configured servers (with lspconfig)
      automatic_installation = true,
      handlers = {
        -- Default handler for installed servers
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,

        -- Custom handler for clangd (C/C++)
        ["clangd"] = function()
          lspconfig.clangd.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = {
              "clangd",
              "--background-index",
              "--clang-tidy",
              "--header-insertion=iwyu",
              "--completion-style=detailed",
              "--function-arg-placeholders",
              "--fallback-style=llvm",
            },
            init_options = {
              usePlaceholders = true,
              completeUnimported = true,
              clangdFileStatus = true,
            },
          })
        end,

        -- Custom handler for TypeScript
        ["ts_ls"] = function()
          lspconfig.ts_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = "literal",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = false,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
              javascript = {
                inlayHints = {
                  includeInlayParameterNameHints = "all",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
            },
          })
        end,

        -- Custom handler for Lua
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              Lua = {
                -- Make the language server recognize "vim" global
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
          })
        end,
      },
    })
  end,
}
