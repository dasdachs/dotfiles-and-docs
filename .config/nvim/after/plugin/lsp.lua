local lsp_zero = require('lsp-zero')

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  }
})

local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = event.buf, desc = 'LSP: [R]e[n]ame' })
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { buffer = event.buf, desc = 'LSP: [G]oto [D]efinition' })
    vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references,
      { buffer = event.buf, desc = 'LSP: [G]oto [R]eference' })
    vim.keymap.set('n', '<leader>gI', vim.lsp.buf.implementation,
      { buffer = event.buf, desc = 'LSP: [G]oto [I]mplementation' })
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = event.buf, desc = 'LSP: Type [D]efinition' })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = event.buf, desc = 'LSP: Type [C]ode [A]action' })
    vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols,
      { buffer = event.buf, desc = 'LSP: [D]ocument [S]ymbols' })
    vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
      { buffer = event.buf, desc = 'LSP: [W]orkspace [S]ymbols' })
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end,
      { buffer = event.buf, desc = 'LSP: [f]ormat' })
    vim.keymap.set('n', '<leader>h', function() vim.lsp.buf.signature_help() end,
      { buffer = event.buf, desc = 'LSP: [h]elp' })
    vim.keymap.set('n', '<leader>e', function() vim.diagnostic.open_float() end,
      { buffer = event.buf, desc = 'LSP: Show [e]rror' })

    vim.diagnostic.config({
      signs = true,
      underline = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
      update_in_insert = false,
      virtual_text = {
        prefix = '●',
      }
    })
  end,
})

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {'lua_ls', 'rust_analyzer'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})
