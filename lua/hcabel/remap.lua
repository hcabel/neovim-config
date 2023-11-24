vim.keymap.set("n", "<leader>ff", vim.cmd.Ex)

-- Move line up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")

-- Paste with ctrl+v
vim.keymap.set("i", "<C-v>", '<Esc>"+pa')

-- shortcut for +y register
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Search = cursor middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- add empty line without existing normal mode
vim.keymap.set("n", "<leader>O", function ()
	vim.api.nvim_call_function("append", {vim.fn.line(".") - 1, ""})
end)
vim.keymap.set("n", "<leader>o", function ()
	vim.api.nvim_call_function("append", {vim.fn.line("."), ""})
end)

