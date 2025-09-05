return{
 {"mason-org/mason.nvim",
      build = ":MasonUpdate",
      opts = {},
      config= function()
         require("mason").setup({
         PATH = "prepend",
      })
      end,
    },
}
