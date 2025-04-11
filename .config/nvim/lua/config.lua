vim.cmd("autocmd!")

-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- File encoding
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Title
vim.opt.title = true

-- Fastscrolling
vim.opt.ttyfast = true

-- More menu
vim.opt.wildmenu = true

-- Line numbers
vim.opt.nu = true

-- Numbers are relative to the current line
-- vim.opt.relativenumber = true

-- Highlited current line
vim.opt.cursorline = true

-- Terminal colors
vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- Default tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Hide unused buffers
vim.opt.hidden = true

-- Disable swapfiles
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search higlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.opt.foldnestmax = 3

-- Line mark
vim.opt.colorcolumn = "120"

-- Clipboard sharing
vim.opt.clipboard:append { 'unnamedplus' }

-- Split default behaviaur
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Default case-insesitive searching
vim.opt.ignorecase = true

-- Ignore
vim.opt.wildignore:append { '*/node_modules/*' }

-- Conceal links
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'

-- Mouse mode
vim.o.mouse = 'a'

-- Relative line numbers
vim.opt.relativenumber = true
