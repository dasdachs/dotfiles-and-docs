require('config');
require('keymaps');
require('plugins');
require('commands');

-- vim.cmd("let g:gruvbox_transparent_bg = 1")
vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
vim.o.termguicolors = true
require("kanagawa").setup()
vim.cmd("colorscheme kanagawa")
--vim.o.background = "dark" -- or "light" for light mode
--vim.cmd([[colorscheme gruvbox]])

-- Start git commit messages in insert mode
vim.api.nvim_create_augroup("bufcheck", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "bufcheck",
    pattern = { "gitcommit", "gitrebase" },
    command = "startinsert | 1",
})

-- Spellcheck for documentation
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.rst", "*.tex" }, command = "setlocal spell" }
)

