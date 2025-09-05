return {
  "saghen/blink.cmp",
  build = "cargo build --release", -- This line is essential!
  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "saghen/blink.compat",
  },
  config = function()
    require("blink.cmp").setup({
      fuzzy = {implementation = "lua"},
        snippets = {
        expand = function(snippet, _)
          require("luasnip").lsp_expand(snippet.body)
        end,
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        -- REMOVE compat = {...}
      },
      keymap = {
        preset = "enter",
        ["<C-y>"] = { "select_and_accept" },
        ["<Tab>"] = { "snippet_forward", "accept", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" }, 
      },
      completion = {
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
        },
        accept = {
          auto_brackets = { enabled = true },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },
      appearance = {
        kind_icons = {
          Class = "🟣",
          Function = "🔵",
          Snippet = "⋗",
        },
        nerd_font_variant = "mono",
      },
      -- REMOVE formatting = {...}
      -- Optionally force lua fallback if you still get errors:
      -- fuzzy = { implementation = "lua" },
    })
  end,
}
