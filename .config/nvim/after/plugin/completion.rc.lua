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
  },
  strategies = {
    chat = {
      adapter = "qwen14b",
    },
    inline = {
      adapter = "qwen14b",
    },
    opts = {
      -- Set debug logging
      log_level = "DEBUG",
    },
  },
})
