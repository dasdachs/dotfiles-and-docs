require('fff').setup({
  title = 'Find ',
  grep = {
    modes = { 'regex', 'fuzzy', 'plain' }, -- Available grep modes and their cycling order, toggle with <S-Tab>
  }
})

vim.keymap.set('n', '<leader>sg', require('fff').live_grep, { desc = '[S]earch [f]iles' })
vim.keymap.set('n', '<leader>sf', require('fff').find_files, { desc = '[s]earch by [G]rep' })
