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
		focusable = false,
		reverse = false,
		modes = {
			diagnostics = {
				win = { type = "float", border = "rounded", position = { row = 2, col = 5 }, size = { width = 80, height = 12 } },
			},
			symbols = {
				win = { type = "float", border = "rounded", position = { row = 2, col = 5 }, size = { width = 60, height = 10 } },
			},
			lsp_references = {
				win = { type = "float", border = "rounded", position = { row = 2, col = 5 }, size = { width = 80, height = 12 } },
			},
			qflist = {
				win = { type = "float", border = "rounded", position = { row = 2, col = 5 }, size = { width = 80, height = 12 } },
			},
		},
	},
}
