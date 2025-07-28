--Config verification text
print("Hello mom -This is the test init.lua file")


--Plugin install
require('config.lazy')

--Keymappings
vim.keymap.set('n','<space><space>x','<cmd> source %<CR>')
vim.keymap.set('n','<space>x',':.lua<CR>')
vim.keymap.set('v','<space>x',':lua<CR>')

--Highight yanking text
vim.api.nvim_create_autocmd('TextYankPost',{
    desc ='highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank',{clear = true}),
    callback = function()
        vim.highlight.on_yank()
    end,
})
--Win32 yank config

vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
				["+"] ="win32yank.exe -i --crlf",
				["*"] ="win32yank.exe -i --crlf",
		},
		paste ={
				["+"] ="win32yank.exe -o --lf",
				["*"] ="win32yank.exe -o --lf",
		},
		cache_enabled = true,
}
