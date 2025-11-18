local vim = vim

vim.g.mapleader = ' '

vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab
-- Default indentation settings, this is overridden in the ftplugin files
vim.opt.tabstop = 4      -- number of visual spaces per TAB
vim.opt.softtabstop = 4  -- number of spaces in tab when editing
vim.opt.shiftwidth = 4   -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of Python
vim.opt.smartindent = false

vim.opt.swapfile = false
vim.opt.backup = false

-- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = true   -- highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

vim.opt.termguicolors = true

vim.opt.scrolloff = 20
vim.g.scrolloff = 20
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.numberwidth = 3

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.opt.list = true
vim.opt.listchars:append({
    tab = ' ',
    multispace = '   ',
    extends = '>',
    precedes = '<',
});

vim.opt.guifont = "CaskaydiaMono NF:h11"
vim.o.winborder = "rounded"

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.termguicolors = true

if vim.g.neovide then
    vim.g.neovide_transparency = 0.9
end
