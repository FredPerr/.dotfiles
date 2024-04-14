local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- search for a string in the current project (respects .gitignore)
vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})

-- open neovim current buffers
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

-- find term under cursor
vim.keymap.set('n', '<leader>ft', builtin.grep_string, {})
