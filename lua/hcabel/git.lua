local telescope = require('telescope.builtin')
local gitsigns = require('gitsigns')

vim.keymap.set('n', "<leader>gf", function () telescope.git_files({
  show_untracked = true,
}) end)

vim.keymap.set("n", "<leader>gs", function()
  vim.api.nvim_cmd({
    cmd = "Neogit",
  }, {})
end)

-- HUNK
vim.keymap.set('n', "<leader>ghk", gitsigns.preview_hunk)
vim.keymap.set('n', "<leader>ghp", gitsigns.prev_hunk)
vim.keymap.set('n', "<leader>ghn", gitsigns.next_hunk)
vim.keymap.set('n', "<leader>ghs", gitsigns.stage_hunk)
vim.keymap.set('n', "<leader>ghr", gitsigns.reset_hunk)
