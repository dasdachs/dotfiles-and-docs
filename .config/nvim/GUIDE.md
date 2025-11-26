# Neovim Debugger Guide

## 1. Introduction
This guide explains how to use the integrated debugger in your Neovim setup, powered by `nvim-dap`, `nvim-dap-ui`, and related plugins. It covers supported languages, workflow, and practical examples to help you debug efficiently inside Neovim.

---

## 2. Prerequisites
- **Required Plugins:**
  - [`nvim-dap`](https://github.com/mfussenegger/nvim-dap)
  - [`nvim-dap-ui`](https://github.com/rcarriga/nvim-dap-ui)
  - [`nvim-dap-virtual-text`](https://github.com/theHamsta/nvim-dap-virtual-text)
  - [`mason.nvim`](https://github.com/williamboman/mason.nvim) and [`mason-nvim-dap`](https://github.com/jay-babu/mason-nvim-dap.nvim)
- **Install Adapters:**
  - Open `:Mason` and install the required debug adapters (e.g., `js-debug-adapter` for Node.js/JavaScript/TypeScript).

---

## 3. Key Bindings
| Action                    | Keybinding         | Description                        |
|---------------------------|-------------------|------------------------------------|
| Continue                  | `<leader>dc`      | Start/continue debugging           |
| Restart                   | `<leader>dr`      | Restart current session            |
| Run Last                  | `<leader>dl`      | Run last debug configuration       |
| Toggle Breakpoint         | `<leader>db`      | Add/remove breakpoint              |
| Conditional Breakpoint    | `<leader>dB`      | Set a conditional breakpoint       |
| Step Over                 | `<leader>dn`      | Step over                         |
| Step Into                 | `<leader>di`      | Step into                         |
| Step Out                  | `<leader>do`      | Step out                          |
| Pause                     | `<leader>dp`      | Pause execution                   |
| Toggle Debugger UI        | `<leader>ds`      | Toggle DAP UI panels              |
| Evaluate Expression       | `<leader>de`      | Evaluate expression (under cursor or prompt) |


---

## 4. Starting a Debugging Session

### A. Launching a File (Node.js/TypeScript/JavaScript)
1. Open the file you want to debug.
2. Set breakpoints with `<leader>db`.
3. Start debugging with `<leader>dc`.
4. The DAP UI will open automatically, showing variables, call stack, etc.

### B. Attaching to a Running Process
1. Start your Node.js app with `--inspect` (e.g., `node --inspect index.js`).
2. Use `<leader>dc` to attach (choose "Attach to Node app" config).

---

## 5. Debugging Workflow
- **Step Over:** `<leader>dn`
- **Step Into:** `<leader>di`
- **Step Out:** `<leader>do`
- **Pause/Resume:** `<leader>dp`
- **Evaluate Expression:** `<leader>de` (hover or prompt)
- **Toggle Debugger UI:** `<leader>ds`
- **Set Conditional Breakpoint:** `<leader>dB`
- **View Variables/Scopes:** Use the DAP UI sidebar.

---

## 6. Using the UI
- **DAP UI Panels:** Scopes, Breakpoints, Stacks, Watches, REPL.
- **Toggling UI:** `<leader>ds` toggles the DAP UI panels.
- **Floating Windows:** Use `<leader>de` to evaluate expressions in a float (under cursor or prompt).

---

## 7. Advanced Usage
- **Conditional Breakpoints:** *(describe how to set, if supported)*
- **Logpoints:** *(describe, if supported)*
- **Persisting Breakpoints:** *(describe, if supported)*
- **Telescope Integration:** Fuzzy-find breakpoints, commands, etc. (if `telescope-dap.nvim` is installed).

---

## 8. Example Debugging Scenarios

### A. Debugging a Node.js Script
```sh
node --inspect-brk myscript.js
```
- Open the script in Neovim.
- Set breakpoints.
- Attach using the "Attach to Node app" config.

### B. Debugging a TypeScript File
- Open `.ts` file.
- Set breakpoints.
- Use "Launch file" config.

---

## 9. Troubleshooting
- **DAP not starting:** Check adapter installation in Mason.
- **Breakpoints not hit:** Ensure source maps are correct for TS, or that the process is running with `--inspect`.
- **UI not showing:** Check for errors in `:messages` or DAP logs.

---

## 10. Resources
- [nvim-dap documentation](https://github.com/mfussenegger/nvim-dap)
- [nvim-dap-ui documentation](https://github.com/rcarriga/nvim-dap-ui)
- [Mason.nvim documentation](https://github.com/williamboman/mason.nvim)
- [Awesome Neovim Debugging](https://github.com/rockerBOO/awesome-neovim#debugging)

---

## 11. Customization
- To add new adapters/configurations, edit your `debugger.lua` and follow the plugin documentation.
- Customize UI layout and keymaps as desired for your workflow.

---

Happy debugging! 🚀
