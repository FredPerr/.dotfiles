vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
-- https://vimdoc.sourceforge.net/htmldoc/options.html#'isfname'
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
-- vim.opt.netwr_header = { hidden = true }

vim.filetype.add({
    extension = {
        uss = "uss",
        tss = "tss"
    }
})
vim.treesitter.language.register('css', 'uss')
vim.treesitter.language.register('css', 'tss')
