return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    delay = 200,
    large_file_cutoff = 2000,
    large_file_overrides = { providers = { "lsp" } },
  },
  config = function(_, opts)
    require("illuminate").configure(opts)

    -- Keep same ]]/[[ feel — navigate between occurrences
    vim.keymap.set("n", "]]", function() require("illuminate").goto_next_reference() end, { desc = "Next reference" })
    vim.keymap.set("n", "[[", function() require("illuminate").goto_prev_reference() end, { desc = "Prev reference" })
  end,
}
