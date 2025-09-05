-- Startup text
print("Hello mom")
--         ____                    
--       ./___/\__                 
--     _._\   \/_/\__.                
--     __\       \/__/\            
--     \   __    __  \ \  ~Renzul-OS.inc
--  __  \  \_\   \_\  \ \    __    
-- /_/\_.\   __   __   \ \._/_/\   
-- \_\/_/ \__\/\__\/\__.\./_\_\/   
--    \_\/                \_\/        
--Loaded lazy and modules
require('config.lazy')
require("Options")
require("KeyBinds")
require("config.blink-toggle")
--Mason setup
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
pcall(function()
  capabilities = require('cmp_nvim_lsp').default_capabilities()
end)
mason.setup({
  ui = {
    check_outdated_packages_on_open = true,
    auto_install = false,
    icons = {
    package_installed = "✓",
    package_pending = "➜",
    package_uninstalled = "✗",
   },
  }
})
--Attach LSp to buffers
vim.api.nvim_create_autocmd("LspAttach",{
   callback= function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client.server_capabilities.completionProvider then end
   end,
})
--Keybinds and Options are loaded
require("Options")
require("KeyBinds")
--Resourcing lazy.nvim file
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "lazy.lua",
  callback = function()
    dofile(vim.fn.expand("<afile>"))
    print("lazy.lua reloaded!")
  end,
})
--Oil fix
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("oil").setup({
  default_file_explorer = true,
  columns = {
    "icon",
    "size",
  },
  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
  win_options = {
    wrap = false,
    signcolumn = "no",
    cursorcolumn = false,
    foldcolumn = "0",
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = "nvic",
  },
  delete_to_trash = false,
  skip_confirm_for_simple_edits = false,
  prompt_save_on_select_new_entry = true,
  cleanup_delay_ms = 2000,
  lsp_file_methods = {
    enabled = false,
    timeout_ms = 1000,
    autosave_changes = false,
  },
  constrain_cursor = "editable",
  watch_for_changes = true,
  keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
    ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
    ["<C-t>"] = { "actions.select", opts = { tab = true } },
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = { "actions.close", mode = "n" },
    ["<C-l>"] = "actions.refresh",
    ["-"] = { "actions.parent", mode = "n" },
    ["_"] = { "actions.open_cwd", mode = "n" },
    ["`"] = { "actions.cd", mode = "n" },
    ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    ["gs"] = { "actions.change_sort", mode = "n" },
    ["gx"] = "actions.open_external",
    ["g."] = { "actions.toggle_hidden", mode = "n" },
    ["g\\"] = { "actions.toggle_trash", mode = "n" },
  },
  use_default_keymaps = true,
  view_options = {
    show_hidden = true,
    is_hidden_file = function(name, bufnr)
      local m = name:match("^%.")
      return m ~= nil
    end,
    is_always_hidden = function(name, bufnr)
      return false
    end,
    natural_order = "fast",
    case_insensitive = false,
    sort = {
      { "type", "asc" },
      { "name", "asc" },
    },
    highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
      return nil
    end,
  },
  extra_scp_args = {},
  git = {
    add = function(path)
      return false
    end,
    mv = function(src_path, dest_path)
      return false
    end,
    rm = function(path)
      return false
    end,
  },
  float = {
    padding = 2,
    max_width = 0,
    max_height = 0,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
    get_win_title = nil,
    preview_split = "auto",
    override = function(conf)
      return conf
    end,
  },
  preview_win = {
    update_on_cursor_moved = true,
    preview_method = "fast_scratch",
    disable_preview = function(filename)
      return false
    end,
    win_options = {},
  },
  confirmation = {
    max_width = 0.9,
    min_width = { 40, 0.4 },
    width = nil,
    max_height = 0.9,
    min_height = { 5, 0.1 },
    height = nil,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  },
  progress = {
    max_width = 0.9,
    min_width = { 40, 0.4 },
    width = nil,
    max_height = { 10, 0.9 },
    min_height = { 5, 0.1 },
    height = nil,
    border = "rounded",
    minimized_border = "none",
    win_options = {
      winblend = 0,
    },
  },
  ssh = {
    border = "rounded",
  },
  keymaps_help = {
    border = "rounded",
  },
  })  end,
})
--Oil autocommand Fix and conflict handler
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"*","dbout"},
  callback = function()
		  if vim.bo.filetype == "oil" then
				  return
		  end
--require("cmp").setup.buffer({ sources ={{ name = "vim-dadbod-completion" }}})
    vim.bo.bufhidden = "wipe"
    vim.opt_local.conceallevel = 2
    vim.opt_local.cursorline = false
  end,
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = "*",
  callback = function(ev)
       if vim.bo.filetype == "oil" or vim.fn.expand("%:p"):match("^oil://") then
      return -- don't run for oil.nvim buffers
    end
	end,})
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname:match("^oil://") or vim.bo.filetype == "oil" then
      return -- Don't run for oil.nvim buffers
    end
  end,
})

  -- Vimtex view options and Latex integration
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")
vim.g.vimtex_view_method = 'sumatrapdf'
vim.g.vimtex_view_general_viewer = 'C:/Users/Renzul-OS/AppData/Local/SumatraPDF/SumatraPDF.exe'
vim.g.vimtex_view_general_options ='-reuse-instance -forward-search @tex @line @pdf'
vim.g.vimtex_compiler_method='latexmk'
 --Vimtex and SumatraPDf server setup
function _G.write_server_name()
   local server_file = vim.fn.expand("$TEMP") .."\\vimtexserver.txt"
   vim.fn.writefile({vim.v.servername}, server_file)
end
vim.cmd("autocmd FileType tex lua write_server_name()")
 --R_lang integration
require('lspconfig').r_language_server.setup{}
vim.g.R_assign= 0 --use <--
vim.g.R_auto_start= 1
vim.g.R_rconsole_width= 80
vim.g.R_app="radian"
vim.g.R_cmd="R"
vim.g.R_hl_term=0
--Using \rf or \\rf to start R
   --keymaps & colorschme loaded
vim.cmd.colorscheme("habamax") --try desert,habamax,lunaperche,slate,sorbet
--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
--vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
--plugins loaded test
print('I hope youre doing alright in PNG?')
--modules loaded
-- Bufferline loaded
vim.opt.termguicolors = true
require("bufferline").setup{}
print('Im off to write my heart out\n XOXO Renzul')

