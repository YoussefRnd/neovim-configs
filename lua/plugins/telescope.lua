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
    { "<leader>ff", "<cmd>Telescope find_files<CR>",           desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>",            desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>",              desc = "Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>",            desc = "Find help" },
    { "<leader>fo", "<cmd>Telescope oldfiles<CR>",             desc = "Find recent files" },
    { "<leader>fc", "<cmd>Telescope git_commits<CR>",          desc = "Find commits" },
    { "<leader>fd", "<cmd>Telescope diagnostics<CR>",          desc = "Find diagnostics" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Find symbols" },
    { "<leader>fk", "<cmd>Telescope keymaps<CR>",              desc = "Find keymaps" },
    { "<C-p>",      "<cmd>Telescope find_files<CR>",           desc = "Find files (fast)" },
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
