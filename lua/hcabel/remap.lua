vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ff", vim.cmd.Ex)

-- Move line up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")

-- Search = cursor middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Custom command that will teleport to the nvim config
vim.cmd("command! OpenConfig cd " .. vim.env.HOME .. "/AppData/Local/nvim | Ex")

