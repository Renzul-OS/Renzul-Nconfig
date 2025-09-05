return{
{"nvim-treesitter/nvim-treesitter",
     build=':TSUpdate',
     config=function()
     require('nvim-treesitter.configs').setup {
       ensure_installed = { "sql","python","r","powershell","json","rust","latex","c","cpp","javascript","typescript", "lua", "vim", "vimdoc", "query", "markdown","go","rust" },
       auto_install = true,
       sync_install = false,
       indent={enable = true},
       highlight = {enable = true,
  		},
	 }
     end,
    },
}
