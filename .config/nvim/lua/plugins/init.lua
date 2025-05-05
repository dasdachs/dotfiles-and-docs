return require("packer").startup(function(use)
  -- First install Packer as it can manage itself
  use "wbthomason/packer.nvim"

  -- Enhancments
  use "mbbill/undotree"       -- undotree saved
  use "nvim-lua/plenary.nvim" -- Lua extensions
  use {                       -- better sorting with cmdline sort
    "sQVe/sort.nvim",
    config = function()
      require("sort").setup()
    end
  }

  -- UI
  use "norcalli/nvim-colorizer.lua" -- fast color support
  use "rebelot/kanagawa.nvim"       -- current theme
  use {                             -- lualine
    "nvim-lualine/lualine.nvim",
    config = function() require("plugins.lualine") end
  }
  use "ryanoasis/vim-devicons" -- Devicons for nvim tree or a start page

  -- Completion
  use {
    'saghen/blink.cmp',
    requires = {
      'rafamadriz/friendly-snippets'
    },
  }

  -- Finder and navigation
  use {
    "nvim-telescope/telescope.nvim",
    config = function() require("plugins.telescope") end,
  }
  use "nvim-telescope/telescope-file-browser.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable "make" == 1 }

  -- File navigation
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function() require("plugins.nvim-tree") end
  }
  use {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  }

  -- Code highlighting and parsing
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = function() require("plugins.treesitter") end
  }
  use { -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  }
  use { -- "Sticky" function and classes
    "nvim-treesitter/nvim-treesitter-context",
    after = "nvim-treesitter",
    config = function()
      require("treesitter-context").setup {}
    end,
  }
  use { -- Symbol tree outlier
    "hedyhli/outline.nvim",
    config = function() require("plugins.outline") end,
  }

  -- Lsp
  use { -- collection of lsp setups
    "neovim/nvim-lspconfig",
    config = function() require("plugins.lsp") end,
  }
  use { -- LSP server manager
    "williamboman/mason.nvim",
    config = function() require("mason").setup() end,
  }
  use { -- LSP config/manager integration
    "williamboman/mason-lspconfig.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim"
    },
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls', 'ts_ls', 'gopls' }
      }
    end
  }

  -- Debugger
  use {
    "mfussenegger/nvim-dap",
    requires = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function() require("plugins.debugger") end
  }

  use {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup()
    end
  }

  -- Git
  use "tpope/vim-fugitive" -- Git integration
  use {                    -- Git "anotations" for blame etc
    "lewis6991/gitsigns.nvim",
    config = function() require("plugins.gitsigns") end
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require('toggleterm').setup()
    end }

  -- Utils
  use { -- Key hints
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }

  -- Ai
  use {
    "olimorris/codecompanion.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function() require("plugins.llm") end
  }
end
)
