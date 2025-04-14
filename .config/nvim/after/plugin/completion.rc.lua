require("codecompanion").setup({
  adapters = {
    qwen14b = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "qwen14b",
        schema = {
          model = {
            default = "qwen2.5-coder:14b-instruct-q4_0",
          },
          num_ctx = {
            default = 16384,
          },
          num_predict = {
            default = -1,
          },
        },
      })
    end,
    deepcoder1_5 = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "deepcoder1.5",
        schema = {
          model = {
            default = "deepcoder:1.5b",
          },
          num_ctx = {
            default = 16384,
          },
          num_predict = {
            default = -1,
          },
        },
      })
    end,
    deepcoder = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "deepcoder",
        schema = {
          model = {
            default = "deepcoder:14b-preview-q4_K_M",
          },
          num_ctx = {
            default = 16384,
          },
          num_predict = {
            default = -1,
          },
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = "deepcoder",
    },
    inline = {
      adapter = "deepcoder1_5",
    },
    opts = {
      -- Set debug logging
      log_level = "DEBUG",
    },
  },
})
