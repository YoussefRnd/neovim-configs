local state_file = vim.fn.stdpath("state") .. "/colorscheme"

local function pick_colorscheme()
  require("telescope.builtin").colorscheme({
    enable_preview = true,
    attach_mappings = function(prompt_bufnr)
      require("telescope.actions").select_default:replace(function()
        local selection = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(prompt_bufnr)
        if selection then
          vim.cmd.colorscheme(selection.value)
          vim.fn.writefile({ selection.value }, state_file)
        end
      end)
      return true
    end,
  })
end

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
    'debugloop/telescope-undo.nvim',
  },
  cmd = 'Telescope',
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>",           desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>",            desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>",              desc = "Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>",            desc = "Find help" },
    { "<leader>fo", "<cmd>Telescope oldfiles<CR>",             desc = "Find recent files" },
    { "<leader>fc", "<cmd>Telescope git_commits<CR>",          desc = "Find commits" },
    { "<leader>fd", "<cmd>Telescope diagnostics<CR>",          desc = "Find diagnostics" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Find symbols" },
    { "<leader>fk", "<cmd>Telescope keymaps<CR>",              desc = "Find keymaps" },
    { "<leader>fu", "<cmd>Telescope undo<CR>",                 desc = "Find undo history" },
    { "<C-p>",      "<cmd>Telescope find_files<CR>",           desc = "Find files (fast)" },
    { "<leader>fC", pick_colorscheme,                          desc = "Find colorscheme" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        undo = {
          side_by_side = true,
          layout_strategy = "vertical",
          layout_config = {
            preview_height = 0.8,
            border = "rounded",
          },
        },
      },
    })

    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "undo")
  end,
}
