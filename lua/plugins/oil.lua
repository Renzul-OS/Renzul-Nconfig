return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
    -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
    default_file_explorer = false,
    -- See :help oil-columns
    columns = {
    "icon",
    -- "permissions",
    "size",
    -- "mtime",
  },
  -- Buffer-local options to use for oil buffers
    buf_options = {
      buflisted = false,
      bufhidden = "hide",
  },
  -- Window-local options to use for oil buffers
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
  -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
    delete_to_trash = false,
  -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
    skip_confirm_for_simple_edits = false,
  -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
  -- (:help prompt_save_on_select_new_entry)
    prompt_save_on_select_new_entry = true,
    cleanup_delay_ms = 2000,--Oil delets hidden buffers which can be delayed by this
    lsp_file_methods = {
    -- Enable or disable LSP file operations
      enabled = true,
      timeout_ms = 1000,
      autosave_changes = false,
    },
  -- Constrain the cursor to the editable parts of the oil buffer
  -- Set to `false` to disable, or "name" to keep it on the file names
    constrain_cursor = "editable",
    watch_for_changes = true, --Watches Changes and reloads buffer
    keymaps = {
      ["g?"] = { "actions.show_help", mode = "n" },
      ["<CR>"] = "actions.select",
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
  -- Set to false to disable all of the above keymaps
    use_default_keymaps = true,
    view_options = {
      show_hidden = false,
      is_hidden_file = function(name, bufnr)
        local m = name:match("^%.")
        return m ~= nil
      end,
    -- This function defines what will never be shown, even when `show_hidden` is set
      is_always_hidden = function(name, bufnr)
        return false
      end,
    -- Can be "fast", true, or false. "fast" will turn it off for large directories.
      natural_order = "fast",
      case_insensitive = false,
      sort = {
        { "type", "asc" },
        { "name", "asc" },
      },
    -- Customize the highlight group for the file name
      highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
        return nil
      end,
    },
  -- Extra arguments to pass to SCP when moving/copying files over SSH
      extra_scp_args = {},
  -- EXPERIMENTAL support for performing file operations with git
    git = {
    -- Return true to automatically git add/mv/rm files
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
  -- Configuration for the floating window in oil.open_float
    float = {
      padding = 2,
      max_width = 0,
      max_height = 0,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
    get_win_title = nil,
    -- preview_split: Split direction: "auto", "left", "right", "above", "below".
    preview_split = "auto",
    override = function(conf)
      return conf
    end,
    },
  -- Configuration for the file preview window
    preview_win = {
      update_on_cursor_moved = true,
    -- How to open the preview window "load"|"scratch"|"fast_scratch"
      preview_method = "fast_scratch",
    -- A function that returns true to disable preview on a file e.g. to avoid lag
      disable_preview = function(filename)
        return false
      end,
    -- Window-local options to use for preview window buffers
      win_options = {},
    },
  -- Configuration for the floating action confirmation window
    confirmation = {
    -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
      max_width = 0.9,
    -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
      min_width = { 40, 0.4 },
    -- optionally define an integer/float for the exact width of the preview window
      width = nil,
    -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
      max_height = 0.9,
    -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
      min_height = { 5, 0.1 },
    -- optionally define an integer/float for the exact height of the preview window
      height = nil,
      border = "rounded",win_options = {winblend = 0,},
    },
  -- Configuration for the floating progress window
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
  -- Configuration for the floating SSH window
    ssh = {border = "rounded",},
  -- Configuration for the floating keymaps help window
    keymaps_help = {border = "rounded",},
  })   
  end,
}
