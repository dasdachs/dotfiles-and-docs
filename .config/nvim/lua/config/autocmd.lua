-- vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")

-- Spellcheck for documentation
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.rst", "*.tex" }, command = "setlocal spell" }
)

-- Start git commit messages in insert mode
vim.api.nvim_create_augroup("bufcheck", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "bufcheck",
    pattern = { "gitcommit", "gitrebase" },
    command = "startinsert | 1",
})


-- Auto generat index.ts files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "typescriptreact" },
  callback = function()
    vim.api.nvim_buf_create_user_command(0, "GenIndexTS", require("commands.gen-index-ts").generate_index_ts, {})
  end,
})
