vim.pack.add({{ src = 'https://github.com/stevearc/oil.nvim', name = 'oil' }})

require('oil').setup({})

vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>')

