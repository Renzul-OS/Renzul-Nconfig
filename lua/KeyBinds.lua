--general Custom keybinds

return{
--General Keybinds
	--Buffer navigation
vim.keymap.set({'n','v'},'<leader>bn',':bn<CR>',{desc ="Next Buffer"}),
vim.keymap.set({'n','v'},'<leader>bp',':bp<CR>',{desc = "Previous buffer"}),
vim.keymap.set({'n','v'},'<leader>bf',':bf<CR>',{desc = "Delete current buffer"}),
vim.keymap.set({'n','v'},'<leader>bq',':bd<CR>',{desc ="Close Current buffer"}),
	--Quit Neovim
vim.keymap.set({'n','v'},'<leader><leader>Q',':qa!<CR>',{desc ="Quit Neovim"}),
	--Save Buffer
vim.keymap.set({'n','v'},'<leader>w',':w!<CR>',{desc ="Force Save file"}),
	--Source Buffer
vim.keymap.set({'n','v'},'<leader>so',':so<CR>',{desc ="Run Lua file"}),
--plugin keybindings
	--Oil .nvim
vim.keymap.set({'n','v'},'<leader>-',':Oil --float<CR>',{desc ="Floating Oil Buffer"}),
vim.keymap.set({'n','v'},'-',':Oil<CR>',{desc ="Oil Nav Buffer"}),
-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" }),
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" }),
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" }),
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" }),
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" }),
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" }),
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" }),
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" }),

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" }),
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" }),
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" }),
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" }),
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" }),
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" }),

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" }),
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" }),
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" }),
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" }),

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" }),

-- File Travel
vim.keymap.set("n", "<leader>rc", ":e ~/AppData/Local/nvim/.configs/Renzul-OS/init.lua<CR>", { desc = "Edit config" }),
vim.keymap.set("n", "<leader>sr", ":Oil ~/Desktop/Work<CR>", { desc = "Open Work folder" }),
-- Alternative navigation (more intuitive)
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New tab' }),
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close tab' }),
-- Tab moving
vim.keymap.set('n', '<leader>tm', ':tabmove<CR>', { desc = 'Move tab' }),
vim.keymap.set('n', '<leader>tR', ':tabmove +1<CR>', { desc = 'Move tab right' }),
vim.keymap.set('n', '<leader>tL', ':tabmove -1<CR>', { desc = 'Move tab left' }),
-- LSP Keybinds
vim.keymap.set("n","ld",vim.lsp.buf.definition,{desc ="LSP definition"}),
vim.keymap.set("n","lr",vim.lsp.buf.references,{desc ="LSP Reference"}),
vim.keymap.set("n","K",vim.lsp.buf.hover,{desc= "Show description"}),
vim.keymap.set("n","<leader>ca",vim.lsp.buf.code_action,{desc ="LSP Code action"}),
-- Vim-dadbod keybinds
vim.keymap.set("n","<leader>du","<cmd>DBUIToggle<CR>"),
vim.keymap.set("n","<leader>df","<cmd>DBUIFindBuffer<CR>"),
vim.keymap.set("n","<leader>dr","<cmd>BDUIRenameBuffer<CR>"),
vim.keymap.set("n","<leader>dq","<ESC><cmd>'<,'>DB<CR>"),
--Blink keymaps
vim.keymap.set({ "i", "s" }, "<Tab>", function()
  return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<Tab>"
end, { expr = true, silent = true }),

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
  return require("luasnip").jumpable(-1) and "<Plug>luasnip-jump-prev" or "<S-Tab>"
end, { expr = true, silent = true }),
}
