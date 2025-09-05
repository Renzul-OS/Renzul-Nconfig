vim.g.blink_cmp_enabled = true

local blink_cmp = require("blink.cmp")
local orig_should_complete = blink_cmp.should_complete

blink_cmp.should_complete = function(...)
  if vim.g.blink_cmp_enabled then
    return orig_should_complete(...)
  end
  return false
end

vim.keymap.set("n", "<leader>tb", function()
  vim.g.blink_cmp_enabled = not vim.g.blink_cmp_enabled
  if vim.g.blink_cmp_enabled then
    vim.notify("blink.cmp enabled", vim.log.levels.INFO)
  else
    vim.notify("blink.cmp disabled", vim.log.levels.WARN)
  end
end, { desc = "Toggle blink.cmp completion" })
