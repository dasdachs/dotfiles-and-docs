require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "typescript",
    "go",
    "tsx",
    "yaml",
    "css",
    "html",
    "c",
    "vim",
    "lua",
    "markdown",
  },
  sync_install = false,
  auto_install = false,
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
}

