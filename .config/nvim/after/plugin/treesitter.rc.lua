vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "typescript",
    "tsx",
    "toml",
    "bash",
    "json",
    "yaml",
    "kotlin",
    "css",
    "html",
    "cmake",
    "c",
    "vim",
    "lua",
  },
  sync_install = false,
  auto_install = true,
  ncremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
}

