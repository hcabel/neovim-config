
-- Default indent (4 space)

-- LSP
vim.lsp.config("rust_analyzer", {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "rust-project.json" }
});
vim.lsp.enable("rust_analyzer");
