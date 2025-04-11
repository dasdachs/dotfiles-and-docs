local dap = require('dap')
local dapui = require("dapui")
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

-- Node.js adapter
dap.configurations.typescript = {
  {
    type = 'pwa-node',
    request = 'launch',
    name = 'Attach debugger to nodejs server',
    program = '${file}',
    cwd = '${workspaceFolder}/src',
    restart = true,
  }
}
