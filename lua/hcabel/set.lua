vim = vim

vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false

if vim.loop.os_uname().sysname == "Windows" then
	vim.opt.undodir = os.getenv("UserProfile") .. "/.vim/undodir"
else
	vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 20
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.numberwidth = 3

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.opt.list = true

vim.opt.listchars:append({
	tab = '🢒 ',
	multispace = '·',
	extends = '>',
	precedes = '<',
});

vim.opt.guifont = "CaskaydiaMono NF:h11"

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.termguicolors = true

if vim.g.neovide then
	vim.g.neovide_transparency = 0.9
end
