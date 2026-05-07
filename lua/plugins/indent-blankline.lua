return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- ibl's HIGHLIGHT_SETUP hook fires at exactly the right moment before
		-- ibl renders its guides. This is belt-and-suspenders on top of the
		-- ColorScheme autocmd in utils/ui.lua, guarding against any timing edge
		-- cases (e.g. a colorscheme that doesn't fire ColorScheme, or ibl
		-- loading before the event has had a chance to run).
		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "IblIndent", { link = "NonText" })
			vim.api.nvim_set_hl(0, "IblScope", { link = "Comment" })
		end)

		require("ibl").setup({
			indent = { char = "│", highlight = "IblIndent" },
			scope = {
				highlight = "IblScope",
				show_start = false,
				show_end = false,
			},
			exclude = {
				filetypes = { "help", "dashboard", "lazy", "mason" },
			},
		})
	end,
}
