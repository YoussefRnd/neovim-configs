return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = { ui = { border = require("core.ui").border } },
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local ui = require("core.ui")
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = ui.get_icon("lsp", "Error"),
						[vim.diagnostic.severity.WARN] = ui.get_icon("lsp", "Warn"),
						[vim.diagnostic.severity.HINT] = ui.get_icon("lsp", "Hint"),
						[vim.diagnostic.severity.INFO] = ui.get_icon("lsp", "Info"),
					},
				},
			})

			local servers = {
				clangd = {
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
				},
				vtsls = {
					settings = {
						typescript = {
							inlayHints = {
								parameterNames = { enabled = "literal" },
								parameterTypes = { enabled = true },
								variableTypes = { enabled = false },
								propertyDeclarationTypes = { enabled = true },
								functionLikeReturnTypes = { enabled = true },
								enumMemberValues = { enabled = true },
							},
						},
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = {
								checkThirdParty = false,
								library = { vim.env.VIMRUNTIME, vim.fn.stdpath("config") },
							},
							completion = { callSnippet = "Replace" },
							telemetry = { enable = false },
						},
					},
				},
				basedpyright = {
					settings = {
						basedpyright = {
							analysis = { typeCheckingMode = "standard" },
						},
					},
				},
				ruff = {
					on_attach = function(client)
						client.server_capabilities.hoverProvider = false
					end,
				},
			}

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
				callback = function(args)
					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					local map = function(m, k, a, d)
						vim.keymap.set(m, k, a, { silent = true, buffer = bufnr, desc = "LSP: " .. d })
					end

					map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Definition")
					map("n", "gD", vim.lsp.buf.declaration, "Declaration")
					map("n", "gr", "<cmd>Telescope lsp_references<CR>", "References")
					map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Implementation")
					map("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>", "Type Definition")
					map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "Code Action")
					map("n", "<leader>lr", vim.lsp.buf.rename, "Rename")
					map("n", "<leader>ld", vim.diagnostic.open_float, "Line Diagnostics")
					map("n", "<leader>ls", "<cmd>LspRestart<CR>", "Restart")
					map("n", "<leader>lh", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
					end, "Toggle Inlay Hints")
					map("n", "K", vim.lsp.buf.hover, "Hover")
					map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
					map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")

					if client and client:supports_method("textDocument/documentHighlight") then
						local group = vim.api.nvim_create_augroup("lsp_highlight_" .. bufnr, { clear = true })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = bufnr,
							group = group,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd("CursorMoved", {
							buffer = bufnr,
							group = group,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})

			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			for name, cfg in pairs(servers) do
				vim.lsp.enable(name, cfg)
			end

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = ui.border })
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = ui.border })

			require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
		end,
	},
}
