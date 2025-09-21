local vim = vim; -- silence linter

local harpoon = require("harpoon")

-- Calculate the size of the whole Neovim window
local width_val = 0;
local win = vim.api.nvim_list_wins();
for _i, window in ipairs(win) do
  local width = vim.api.nvim_win_get_width(window);
  width_val = width_val + width;
end

harpoon.setup({
  menu = {
    -- win size * 0.4
    width = math.floor(width_val * 0.4),
  },
});

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set('n', "<leader>a", mark.add_file)
vim.keymap.set('n', "<C-e>", ui.toggle_quick_menu)

vim.keymap.set('n', "<leader>1", function () ui.nav_file(1) end)
vim.keymap.set('n', "<leader>2", function () ui.nav_file(2) end)
vim.keymap.set('n', "<leader>3", function () ui.nav_file(3) end)
vim.keymap.set('n', "<leader>4", function () ui.nav_file(4) end)
vim.keymap.set('n', "<leader>5", function () ui.nav_file(5) end)
vim.keymap.set('n', "<leader>6", function () ui.nav_file(6) end)
vim.keymap.set('n', "<leader>7", function () ui.nav_file(7) end)
vim.keymap.set('n', "<leader>8", function () ui.nav_file(8) end)
vim.keymap.set('n', "<leader>9", function () ui.nav_file(9) end)
