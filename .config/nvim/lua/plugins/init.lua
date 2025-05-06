return require("lazy").setup {
  -- Enhancments
  {"mbbill/undotree"},       -- undotree saved
  {"nvim-lua/plenary.nvim"}, -- Lua extensions
  {                        -- better sorting with cmdline sort
    "sQVe/sort.nvim",
    config = function()
      require("sort").setup()
    end
  },
  -- UI
  { "norcalli/nvim-colorizer.lua" }, -- fast color support
  {"rebelot/kanagawa.nvim"},           -- current theme
  {                                  -- lualine
    "nvim-lualine/lualine.nvim",
    config = function() require("plugins.lualine") end
  },
  {"ryanoasis/vim-devicons"}, -- Devicons for nvim tree or a start page
  -- Completion
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "ribru17/blink-cmp-spell"
    },
    config = function() require("plugins.blink") end
  },
  -- Finder and navigation
  {
    "nvim-telescope/telescope.nvim",
    config = function() require("plugins.telescope") end,
  },
  {"nvim-telescope/telescope-file-browser.nvim"},
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable "make" == 1 },
  -- File navigation
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function() require("plugins.nvim-tree") end
  },
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  },

  -- Code highlighting and parsing
  {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = function() require("plugins.treesitter") end
  },
  { -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  },
  { -- "Sticky" function and classes
    "nvim-treesitter/nvim-treesitter-context",
    after = "nvim-treesitter",
    config = function()
      require("treesitter-context").setup {}
    end,
  },
  { -- Symbol tree outlier
    "hedyhli/outline.nvim",
    config = function() require("plugins.outline") end,
  },

  -- Lsp
  { -- collection of lsp setups
    "neovim/nvim-lspconfig",
    config = function() require("plugins.lsp") end,
  },
  { -- LSP server manager
    "williamboman/mason.nvim",
    config = function() require("mason").setup() end,
  },
  { -- LSP config/manager integration
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim"
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "ts_ls", "gopls" }
      }
    end
  },
  {"folke/lazydev.nvim"},

  -- Debugger
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function() require("plugins.debugger") end
  },

  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup()
    end
  },

  -- Git
  {"tpope/vim-fugitive"}, -- Git integration
  {                    -- Git "anotations" for blame etc
    "lewis6991/gitsigns.nvim",
    config = function() require("plugins.gitsigns") end
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup()
    end
  },

  -- Utils
  { -- Key hints
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  },

  -- Ai
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function() require("plugins.llm") end
  }
}
