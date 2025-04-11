return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lua support
  use 'nvim-lua/plenary.nvim'

  -- oding
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use 'windwp/nvim-autopairs'

  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require("nvim-ts-autotag").setup {}
    end,
  }

  use 'norcalli/nvim-colorizer.lua'

  use { -- LSP Configuration & Plugins
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },

    }
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use { -- "Sticky" function and classes
    'nvim-treesitter/nvim-treesitter-context',
    after = 'nvim-treesitter',
    config = function()
      require("treesitter-context").setup {}
    end,
  }

  -- Symbol tree outlier
  use { 'hedyhli/outline.nvim',
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
      require("outline").setup {}
    end,
  }

  use({
    'sQVe/sort.nvim',

    config = function()
      require("sort").setup()
    end
  })

  use 'nvim-telescope/telescope.nvim'
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'

  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })

  -- Debugger
  use {
    'mfussenegger/nvim-dap',
    requires = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'jay-babu/mason-nvim-dap.nvim',
      'theHamsta/nvim-dap-virtual-text',
    },
  }
  -- Language specific adapters (choose what you need)

  -- For Python
  use 'mfussenegger/nvim-dap-python'
  -- For JavaScript/TypeScript
  use { 'mxsdev/nvim-dap-vscode-js', requires = {'mfussenegger/nvim-dap'} }
  -- For Go
  use 'leoluz/nvim-dap-go'
  -- For C/C++/Rust
  use 'jay-babu/mason-nvim-dap.nvim'

  use {
    'stevearc/overseer.nvim',
    config = function()
      require('overseer').setup()
    end
  }

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse

  -- Terminal
  use { 'akinsho/toggleterm.nvim', config = function()
    require('toggleterm').setup()
  end }

  -- UI
  use 'tjdevries/colorbuddy.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'ryanoasis/vim-devicons'
  use {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  }

  -- Utils
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 200
      require("which-key").setup {}
    end
  }

  -- AI
  use { 'ggml-org/llama.vim' }
  use({
    "olimorris/codecompanion.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    }
  })
end
)
