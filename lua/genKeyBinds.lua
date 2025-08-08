--general Custom keybinds

return{
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


}
