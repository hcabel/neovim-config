
if vim.loop.os_uname().sysname == "Windows" then
	vim.opt.undodir = os.getenv("UserProfile") .. "/.vim/undodir"
	vim.g.undotree_DiffCommand = "FC"
else
	vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
	vim.g.undotree_DiffCommand = "diff"
end
vim.keymap.set('n', "<leader>u", vim.cmd.UndotreeToggle)
