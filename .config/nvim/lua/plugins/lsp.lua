local capabilities = require('blink.cmp').get_lsp_capabilities()

-- Vim help
vim.lsp.enable('vimls', { capabilities = capabilities })

-- Lua
vim.lsp.enable('lua_ls', { capabilities = capabilities })

-- Javascript/typescript
vim.lsp.enable('ts_ls', { capabilities = capabilities })
vim.lsp.enable('biome', { capabilities = capabilities })

-- Html & css
vim.lsp.enable('tailwindcss')

-- Golang
vim.lsp.enable('gopls')

-- Bash
vim.lsp.enable('bashls')

-- Yaml, toml etc
vim.lsp.enable('yamlls')

-- Keymaps
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, { desc = 'LSP: [f]ormat' })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode action" })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP: [R]e[n]ame' })
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'LSP: [G]oto [D]efinition' })
vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, { desc = 'LSP: [G]oto [R]eference' })
vim.keymap.set('n', '<leader>gI', vim.lsp.buf.implementation, { desc = 'LSP: [G]oto [I]mplementation' })
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'LSP: Type [D]efinition' })
vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols,
  { desc = 'LSP: [D]ocument [S]ymbols' })
vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
  { desc = 'LSP: [W]orkspace [S]ymbols' })
vim.keymap.set('n', '<leader>h', function() vim.lsp.buf.signature_help() end, { desc = 'LSP: [h]elp' })
vim.keymap.set('n', '<leader>e', function() vim.diagnostic.open_float() end, { desc = 'LSP: Show [e]rror' })
