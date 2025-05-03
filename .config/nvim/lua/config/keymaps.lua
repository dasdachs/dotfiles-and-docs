-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Moving between split buffers, Ctrl + movement key
map("n", "<C-h>", "<C-W><C-H>")
map("n", "<C-j>", "<C-W><C-J>")
map("n", "<C-k>", "<C-W><C-K>")
map("n", "<C-l>", "<C-W><C-L>")

-- Resize
map("n", "<C-S-Up>", ":resize +2<CR>")
map("n", "<C-S-Down>", ":resize -2<CR>")
map("n", "<C-S-Left>", ":vertical resize +2<CR>")
map("n", "<C-S-Right>", ":vertical resize -2<CR>")

-- New split
map("n", "ss", ":split<Return><C-w>w")
map("n", "sv", ":vsplit<Return><C-w>w")

-- Terminal
map("n", "<C-t>", ":ToggleTerm<CR>")
map("t", "<ESC>", "<C-\\><C-N>")

-- Nerdtree
map("n", "<C-b>", ":NvimTreeToggle<CR>")

-- Outline
map("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

-- Diagonstic
map("n", "<leader>d", "vim.diagnostic.open_float()", { desc = "Display diagnostic" })

-- Move selected line
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)im.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")

-- greatest remap ever: overwrite highlighed line and keep buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

