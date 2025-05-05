-- Functional wrapper for mapping custom keybindings
function KeyMap(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Moving between split buffers, Ctrl + movement key
KeyMap("n", "<C-h>", "<C-W><C-H>")
KeyMap("n", "<C-j>", "<C-W><C-J>")
KeyMap("n", "<C-k>", "<C-W><C-K>")
KeyMap("n", "<C-l>", "<C-W><C-L>")

-- Resize
KeyMap("n", "<C-S-Up>", ":resize +2<CR>")
KeyMap("n", "<C-S-Down>", ":resize -2<CR>")
KeyMap("n", "<C-S-Left>", ":vertical resize +2<CR>")
KeyMap("n", "<C-S-Right>", ":vertical resize -2<CR>")

-- New split
KeyMap("n", "ss", ":split<Return><C-w>w")
KeyMap("n", "sv", ":vsplit<Return><C-w>w")

-- Terminal
KeyMap("n", "<C-t>", ":ToggleTerm<CR>")
KeyMap("t", "<ESC>", "<C-\\><C-N>")

-- Nerdtree
KeyMap("n", "<C-b>", ":NvimTreeToggle<CR>")

-- Outline
KeyMap("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

-- Diagonstic
KeyMap("n", "<leader>d", "vim.diagnostic.open_float()", { desc = "Display diagnostic" })

-- Move selected line
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")     -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")     -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)im.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")

-- greatest remap ever: overwrite highlighed line and keep buffer
vim.keymap.set("x", "<leader>p", [["_dP]])
