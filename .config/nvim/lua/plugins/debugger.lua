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

vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "DAP: Type [d]ebuger [c]ontinue" })
vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "DAP: Type [d]ebuger [r]estart" })
vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, { desc = "DAP: Type [d]ebuger [l]ast" })
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end,
  { desc = "DAP: Type [d]ebuger [b]reakpoint toggle" })

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
