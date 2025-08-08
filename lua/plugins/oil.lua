return{
  'stevearc/oil.nvim',
  --@module 'oil'
  --@type oil.SetupOpts
 opts = {},
 dependencies = { "nvim-tree/nvim-web-devicons" },
--No lazy loarding to avoid conflicts
  lazy = false,
  default_file_explorer= true,
}
