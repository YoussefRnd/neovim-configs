return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	-- noice.setup() automatically replaces vim.notify with its own handler.
	-- Do NOT reassign vim.notify afterwards: that would bypass noice's routing
	-- and send all notifications straight to raw nvim-notify, skipping
	-- noice's filtering, history, and UI.
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
		},
		views = {
			cmdline_popup = {
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
			},
			popupmenu = {
				border = {
					style = "rounded",
				},
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			lsp_doc_border = true,
		},
	},
}
