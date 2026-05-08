return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>",              desc = "Problems (project)" },
		{ "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Problems (buffer)" },
		{ "<leader>xs", "<cmd>Trouble symbols toggle<CR>",                  desc = "Symbols" },
		{ "<leader>xr", "<cmd>Trouble lsp_references toggle<CR>",           desc = "References" },
		{ "<leader>xq", "<cmd>Trouble qflist toggle<CR>",                   desc = "Quickfix list" },
	},
	opts = {
		focusable = false,
		reverse = false,
		modes = {
			diagnostics = {
				win = { type = "split", position = "right" },
			},
			symbols = {
				win = { type = "split", position = "right" },
			},
			lsp_references = {
				win = { type = "split", position = "right" },
			},
			qflist = {
				win = { type = "split", position = "right" },
			},
		},
	},
}
