require("mason-nvim-dap").setup()
local dap = require('dap')
local dapui = require("dapui")
local utils = require("dap.utils")

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.g.dap_virtual_text = true

vim.keymap.set("n", '<leader>dc', function() dap.continue() end, { desc = 'DAP: Type [d]ebuger [c]ontinue' })
vim.keymap.set("n", '<leader>dl', function() dap.run_last() end, { desc = 'DAP: Type [d]ebuger [l]ast' })
vim.keymap.set("n", '<leader>db', function() dap.toggle_breakpoint() end,
  { desc = 'DAP: Type [d]ebuger [b]reakpoint toggle' })

dap.set_log_level("DEBUG")

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = { vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
  }
}

for _, language in ipairs({ 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' }) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach Program (pwa-node, select pid)",
      cwd = vim.fn.getcwd(),
      port =  9229,
      skipFiles = { "<node_internals>/**" },
    },
  }
end
