local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local lsp_zero = require('lsp-zero')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
        ['<Tab>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})


lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    -- Check to switch to :do for diagnostic ?
    vim.keymap.set("n", "<leader>do", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>]", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>[", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>ref", function() vim.lsp.buf.references() end, opts)
    -- or F2
    vim.keymap.set("n", "<leader>R", function() vim.lsp.buf.rename() end, opts)
    -- vim.keymap.set("i", "<leader>h", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({

})
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls', 'rust_analyzer', 'bashls', 'diagnosticls',
        'eslint', 'pylsp', 'tsserver', 'vimls',
        'yamlls', 'jsonls', 'cssls'
    },
    handlers = {
        lsp_zero.default_setup,
    },

})

require('lspconfig').cssls.setup{
    filetypes = { 'css', 'scss', 'sass', 'less', 'uss', 'tss' },
}
