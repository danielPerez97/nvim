-- Vim Configuration
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- LSP
vim.lsp.enable({
	'rust-analyzer',
	'clangd',
})

-- Keymappings
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show Diagnostic' })

