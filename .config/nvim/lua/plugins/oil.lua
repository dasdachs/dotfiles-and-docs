require("oil").setup({
  -- show_hidden = true,
  skip_confirm_for_simple_edits = true,

  view_options = {
    -- show_hidden = true,
    -- is_hidden_file = function(name, bufnr)
    --   return vim.startswith(name, ".")
    -- end,
    -- is_always_hidden = function(name, bufnr)
    --   return false
    -- end,

    sort = {
      { "type", "asc" },
      { "name", "asc" },
    },
  },

  float = {
    padding = 4,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  },
})

vim.keymap.set("n", "<leader>n", function()
  -- Get the directory of the current buffer
  local current_file = vim.fn.expand("%:p")
  local current_dir

  if current_file == "" then
    current_dir = vim.fn.getcwd()
  else
    current_dir = vim.fn.fnamemodify(current_file, ":h")
  end

  require("oil").open_float(current_dir)
end, { desc = "Open Oil in floating window (current buffer dir)" })
