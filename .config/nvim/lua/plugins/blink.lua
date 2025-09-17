require("blink.cmp").setup {
  completion = {
    documentation = {
      auto_show = true,
    },
    menu = {
      draw = {
        components = {
          kind_icon = {
            highlight = function(ctx)
              local hl = ctx.kind_hl
              if vim.tbl_contains({ "Path" }, ctx.source_name) then
                local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                if dev_icon then
                  hl = dev_hl
                end
              end
              return hl
            end,
          }
        }
      }
    }
  },
  sources = {
    -- default = { "lazydev", "lsp", "path", "codecompanion", "minuet", "snippets", "spell", "buffer" },
    default = { "lazydev", "lsp", "path", "snippets", "spell", "buffer" },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
      spell = {
        name = 'Spell',
        module = 'blink-cmp-spell',
        opts = {
          -- EXAMPLE: Only enable source in `@spell` captures, and disable it
          -- in `@nospell` captures.
          enable_in_context = function()
            local curpos = vim.api.nvim_win_get_cursor(0)
            local captures = vim.treesitter.get_captures_at_pos(
              0,
              curpos[1] - 1,
              curpos[2] - 1
            )
            local in_spell_capture = false
            for _, cap in ipairs(captures) do
              if cap.capture == 'spell' then
                in_spell_capture = true
              elseif cap.capture == 'nospell' then
                return false
              end
            end
            return in_spell_capture
          end,
        },
      },
      -- codecompanion = {
      --   name = "CodeCompanion",
      --   module = "codecompanion.providers.completion.blink",
      --   enabled = true,
      -- },
      -- minuet = {
      --   name = 'minuet',
      --   module = 'minuet.blink',
      --   async = true,
      --   timeout_ms = 3000,
      --   score_offset = 50,
      -- },
    },
  },
  keymap = { preset = 'default' },
  appearance = {
    nerd_font_variant = 'mono'
  },
  fuzzy = {
    -- implementation = "prefer_rust_with_warning",
    -- Spell support sorting
    sorts = {
      function(a, b)
        local sort = require('blink.cmp.fuzzy.sort')
        if a.source_id == 'spell' and b.source_id == 'spell' then
          return sort.label(a, b)
        end
      end,
      -- This is the normal default order, which we fall back to
      'score',
      'kind',
      'label',
    },
  },
  signature = { enabled = true },
}
