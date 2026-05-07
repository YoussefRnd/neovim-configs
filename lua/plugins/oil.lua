local function toggle_oil()
	if vim.bo.filetype == "oil" then
		require("oil").close()
	else
		require("oil").open()
	end
end

return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "echasnovski/mini.icons" },
	keys = {
		{ "<leader>e", toggle_oil, desc = "Toggle file explorer" },
	},
	opts = {
		view_options = {
			show_hidden = true,
		},
		delete_to_trash = true,
	},
}
