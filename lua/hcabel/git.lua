
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
vim.keymap.set('n', "<leader>gh", gitsigns.preview_hunk)
vim.keymap.set('n', "<leader>ngh", gitsigns.next_hunk)
vim.keymap.set('n', "<leader>pgh", gitsigns.prev_hunk)
vim.keymap.set('n', "<leader>gsh", gitsigns.stage_hunk)
vim.keymap.set('n', "<leader>grh", gitsigns.reset_hunk)
