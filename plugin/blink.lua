vim.pack.add({
    { src = 'https://github.com/saghen/blink.lib' },
	{ src = 'https://github.com/saghen/blink.cmp' },
})
local blink = require('blink.cmp')
blink.build():pwait()
blink.setup()

