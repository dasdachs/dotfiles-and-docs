require("mason-nvim-dap").setup()
local dap = require("dap")
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

require("nvim-dap-virtual-text").setup {
  -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
  display_callback = function(variable)
    if #variable.value > 15 then
      return " " .. string.sub(variable.value, 1, 15) .. "... "
    end

    return " " .. variable.value
  end,
}
vim.g.dap_virtual_text = true

vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "DAP: Debugger Continue" })
vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "DAP: Debugger Restart" })
vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, { desc = "DAP: Debugger Run Last" })
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "DAP: Debugger Breakpoint Toggle" })
vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = "DAP: Debugger Conditional Breakpoint" })
vim.keymap.set("n", "<leader>dn", function() dap.step_over() end, { desc = "DAP: Debugger Step Over" })
vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "DAP: Debugger Step Into" })
vim.keymap.set("n", "<leader>do", function() dap.step_out() end, { desc = "DAP: Debugger Step Out" })
vim.keymap.set("n", "<leader>dp", function() dap.pause() end, { desc = "DAP: Debugger Pause" })
vim.keymap.set("n", "<leader>ds", function() dapui.toggle() end, { desc = "DAP: Debugger UI Toggle" })
vim.keymap.set("n", "<leader>de", function() require('dapui').eval() end, { desc = "DAP: Debugger Evaluate Expression" })

dap.set_log_level("DEBUG")

-- https://www.darricheng.com/posts/setting-up-nodejs-debugging-in-neovim/
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/bin/js-debug-adapter",
    args = { "${port}" },
  }
}

for _, language in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to Node app",
      address = "localhost",
      port = 9229,
      cwd = "${workspaceFolder}",
      restart = true,
    },
  }
end
