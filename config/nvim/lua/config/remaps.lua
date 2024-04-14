vim.g.mapleader = ' '

-- Go back to Netrw explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>pv", "<cmd>Neotree<CR>")

-- Tries to format and save the file.
vim.keymap.set("n", "<leader>s", function()
    vim.lsp.buf.format()
    vim.api.nvim_command('write')
end)

-- Move selected line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remove Ctrl+Q keybinding
vim.keymap.set("n", "Q", "<nop>")

-- Format only
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

-- Make the file executable (not silent)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = false })

-- Source the file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.o.clipboard = "unnamedplus"

