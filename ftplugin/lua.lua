
-- Default indent (4 space)

-- LSP
vim.lsp.config("luals", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".git/", ".luarc.json/", ".luarc.jsonc/" }
});
vim.lsp.enable("luals");
