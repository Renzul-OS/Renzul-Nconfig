--Config verification text
print("Hello mom")
--Module requires
--Problematic configs .lua files
--require('genKeyBinds')
--require('genOpts')
require('pluginKeyBinds')
require('pluginOpts')

--Plugin install
require('config.lazy')
require('oil').setup({
	default_file_explorer= true,
})
--require('wezterm-config').setup()
--require('easypick').setup()
--Leader Key map-Space Bar
vim.g.mapleader = ' '
vim.g.maplocalleader ='\\'
--General Keybinds
	--Buffer navigation
vim.keymap.set({'n','v'},'<leader>n',':bn<CR>')
vim.keymap.set({'n','v'},'<leader>p',':bp<CR>')
vim.keymap.set({'n','v'},'<leader>x',':bf<CR>')
	--Yank Keymaps
vim.keymap.set({'n','v'},'<leader>y','"+y<CR>')
vim.keymap.set({'n','v'},'<leader>d','"+d<CR>')
	--Quit buffer
vim.keymap.set({'n','v'},'<leader>Q',':q<CR>')
	--Save Buffer
vim.keymap.set({'n','v'},'<leader>s',':w!<CR>')
	--Source Buffer
vim.keymap.set({'n','v'},'<leader>R',':so<CR>')

--General opt functions
	--Line Numbers
vim.opt.nu = true -- line Numbers
vim.opt.relativenumber = true --relative line 


