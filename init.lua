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
-- Under the Oil Navigation window
	view_options = {
		show_hidden= true,
	},
	columns = {
		'icon','size'
		},
	delete_to_trash= true,
	skip_confirm_for_simple_edits = true,
-- Under Oil Floating window  navigation
	float={
	--padding= 0,
	max_width=0,
	max_height=0,
	border='rounded',
	--Window shape options
	win_options={
		winblend=0,
		},
},
})
--require('easypick').setup()
--Leader Key map-Space Bar
vim.g.mapleader = ' '
vim.g.maplocalleader ='\\'
--General Keybinds
	--Buffer navigation
vim.keymap.set({'n','v'},'<leader>n',':bn<CR>')
vim.keymap.set({'n','v'},'<leader>p',':bp<CR>')
vim.keymap.set({'n','v'},'<leader>x',':bf<CR>')
vim.keymap.set({'n','v'},'<leader>q',':bd<CR>')
	--Yank Keymaps
vim.keymap.set({'n','v'},'<leader>y','"+y<CR>')
vim.keymap.set({'n','v'},'<leader>d','"+d<CR>')
	--Quit Neovim
vim.keymap.set({'n','v'},'<leader><leader>Q',':q<CR>')
	--Save Buffer
vim.keymap.set({'n','v'},'<leader>s',':w!<CR>')
	--Source Buffer
vim.keymap.set({'n','v'},'<leader>R',':so<CR>')
	--window managemnet
   --vim.keymap.set({})
   --vim.keymap.set({})
   --vim.keymap.set({})
--General opt functions
	--Line Numbers
vim.opt.nu = true -- line Numbers
vim.opt.relativenumber = true --relative line 
vim.opt.tabstop= 3
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

