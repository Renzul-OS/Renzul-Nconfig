return{
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
  local lspconfig = require("lspconfig")
  local capabilities = vim.lsp.protocol.make_client_capabilities()
   pcall(function()
  capabilities = require('cmp_nvim_lsp').default_capabilities()
  end)
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls", "pyright", "rust_analyzer", "html", "cssls" }, 
      automatic_installation = true,
    }
-- Language LSPS
local servers = {
  "asm_lsp", "cssls", "html", "ltex", "marksman", "pyright", "sqls", "texlab", "ts_ls"
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { capabilities = capabilities }
end
-- Special config for lua_ls if needed:
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
    }
  }
}
  end,
}
