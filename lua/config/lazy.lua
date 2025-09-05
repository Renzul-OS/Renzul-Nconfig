--Loading Keymaps before lazy
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
      {import = "plugins"},
    {"nvim-tree/nvim-web-devicons", opts = {}}, 
    {"folke/lazydev.nvim",ft = "lua",opts = {},}, 
    {"neovim/nvim-lspconfig"},
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},
    {"lewis6991/gitsigns.nvim",},
    {"lervag/vimtex", lazy= false},
    {"neovim/nvim-lspconfig",},
    {"quarto-dev/quarto-nvim",dependencies={"jmbuhr/otter.nvim"}},
    {"jalvesaq/Nvim-R",lazy= false},
    {"tpope/vim-dadbod",lazy = true},
    {"kristijanhusak/vim-dadbod-completion", dependencies = "tpope/vim-dadbod",
    ft = {"sql","mysql","pysql"},
    },
    {"kristijanhusak/vim-dadbod-ui",dependencies = "tpope/vim-dadbod",
     cmd ={"DBUI","DBUIToggle"},
     init = function()
        vim.g.db_ui_use_nerd_fonts = 1
     end,  
    }, 
},
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
