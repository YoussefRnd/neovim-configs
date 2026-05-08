local M = {}

M.border = "rounded"
M.icons_enabled = vim.g.icons_enabled ~= false

M.icons = {
	lsp = {
		Error = " ",
		Warn = " ",
		Hint = "󰠠 ",
		Info = " ",
	},
	git = {
		added = " ",
		modified = " ",
		removed = " ",
		renamed = "➜ ",
		untracked = "󰬚 ",
		ignored = "◌ ",
	},
	kinds = {
		Array = " ",
		Boolean = "󰨙 ",
		Class = " ",
		Color = " ",
		Constant = " ",
		Constructor = " ",
		Enum = " ",
		EnumMember = " ",
		Event = " ",
		Field = " ",
		File = " ",
		Folder = " ",
		Function = " ",
		Interface = " ",
		Key = " ",
		Keyword = " ",
		Method = " ",
		Module = " ",
		Namespace = " ",
		Null = " ",
		Number = " ",
		Object = " ",
		Operator = " ",
		Package = " ",
		Property = " ",
		Reference = " ",
		Snippet = " ",
		String = " ",
		Struct = " ",
		Text = " ",
		TypeParameter = " ",
		Unit = " ",
		Value = " ",
		Variable = " ",
	},
	ui = {
		search = " ",
		history = "󰃅 ",
		config = "󰒓 ",
		session = "󰃇 ",
	},
}

M.text_icons = {
	lsp = { Error = "[E] ", Warn = "[W] ", Hint = "[H] ", Info = "[I] " },
	git = { added = "[+] ", modified = "[*] ", removed = "[-] ", renamed = "[R] ", untracked = "[?] ", ignored = "[I] " },
	ui = { search = "[/] ", history = "[H] ", config = "[C] ", session = "[S] " },
}

function M.get_icon(category, name)
	local icon_table = M.icons_enabled and M.icons or M.text_icons
	if icon_table[category] and icon_table[category][name] then
		return icon_table[category][name]
	end
	local status, mini_icons = pcall(require, "mini.icons")
	if status then
		local icon, _, is_default = mini_icons.get(category, name)
		if not is_default then return icon .. " " end
	end
	return ""
end

local function add_glyphs(target, source)
	for name, glyph in pairs(source) do
		target[name] = { glyph = glyph }
	end
end

-- mini.icons integration table
M.mini_icons_opts = { lsp = {}, default = {} }
add_glyphs(M.mini_icons_opts.lsp, M.icons.kinds)
add_glyphs(M.mini_icons_opts.lsp, M.icons.lsp)
add_glyphs(M.mini_icons_opts.default, M.icons.ui)

return M
