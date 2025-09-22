vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false -- Use tabs for indentation
vim.opt.smartindent = true

-- LSP
vim.lsp.config("clangd", {});
vim.lsp.enable("clangd");
