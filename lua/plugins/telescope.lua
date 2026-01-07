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
  },
  cmd = 'Telescope',
  keys = {
    { "<leader>ff", ":Telescope find_files<cr>",  desc = "Find files" },
    { "<leader>fg", ":Telescope live_grep<cr>",   desc = "Live grep" },
    { "<leader>fb", ":Telescope buffers<cr>",     desc = "Find buffers" },
    { "<leader>fh", ":Telescope help_tags<cr>",   desc = "Find help" },
    { "<leader>fo", ":Telescope oldfiles<cr>",    desc = "Find recent files" },
    { "<leader>fc", ":Telescope git_commits<cr>", desc = "Find commits" },
    { "<leader>fd", ":Telescope diagnostics<cr>", desc = "Find diagnostics" },
    { "<leader>fs", ":Telescope lsp_document_symbols<cr>", desc = "Find symbols" },
    { "<leader>fk", ":Telescope keymaps<cr>", desc = "Find keymaps" },
    { "<C-p>",      ":Telescope find_files<cr>",  desc = "Find files (fast)" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
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
    })

    pcall(telescope.load_extension, "fzf")
  end,
}
