return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    local lspconfig = require("lspconfig")
    local on_attach = function(client, bufnr)
    local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    end
    lspconfig.lua_ls.setup ({
         require("lspconfig").lua_ls.setup({
            settings = {
               Lua = {
                  workspace = { checkThirdParty = false },
                  telemetry = { enable = false },
               },
            },
         })
      })
    lspconfig.pyright.setup {on_attach = on_attach}
    lspconfig.rust_analyzer.setup {on_attach = on_attach}
    lspconfig.asm_lsp.setup{on_attach = on_attach}
    lspconfig.ltex.setup{on_attach = on_attach}
    lspconfig.texlab.setup{on_attach = on_attach}
    lspconfig.ts_ls.setup{on_attach = on_attach}
    lspconfig.marksman.setup{on_attach = on_attach}
   end,
}
