vim.pack.add({{ src = 'https://github.com/folke/tokyonight.nvim', name = 'tokyonight' }})

require('tokyonight').setup({})
vim.cmd[[colorscheme tokyonight-night]]

