require("codecompanion").setup({
  adapters = {
    qwen14b = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "qwen14b",
        schema = {
          model = {
            default = "qwen2.5-coder:14b-instruct-q4_K_M",
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
    qwen7b = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "qwen7b",
        schema = {
          model = {
            default = "qwen2.5-coder:14b-instruct-q4_K_M",
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
        name = "deepcoder1_5",
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
      adapter = "qwen7b",
    },
    opts = {
      -- Set debug logging
      log_level = "DEBUG",
    },
  },
})

require("minuet").setup {
  provider = "openai_fim_compatible",
  n_completions = 1,
  context_window = 4096,
  provider_options = {
    openai_fim_compatible = {
      api_key = "TERM",
      name = "Ollama",
      end_point = "http://localhost:11434/v1/completions",
      model = "qwen2.5-coder:7b-base-q4_K_M",
      optional = {
        max_tokens = 56,
        top_p = 0.9,
      },
    },
  },
}
