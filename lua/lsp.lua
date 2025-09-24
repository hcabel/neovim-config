local vim = vim

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = '',
            [vim.diagnostic.severity.INFO] = ''
        }
    }
})

vim.lsp.config("*", {
    root_markers = { ".git/" },
    on_attach = function(client, bufnr)
        -- REMAPS
        local opts = { noremap = true, silent = true, buffer = bufnr }
        local keymap = vim.keymap.set
        -- keymap("n", "<leader>gi", function() vim.lsp.buf.implementation() end, opts)
        keymap("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
        -- keymap("n", "<leader>gD", function() vim.lsp.buf.declaration() end, opts)
        keymap("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        keymap("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
        keymap("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        keymap("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        keymap("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        -- keymap("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
        keymap("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
        keymap("n", "]d", function() vim.diagnostic.goto_next() end, opts)
        keymap("n", "]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, opts)
        keymap("n", "[e", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, opts)
        keymap("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        --  AUTO FORMAT ON SAVE
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function() vim.lsp.buf.format({ async = false }) end
        })
    end,
});

vim.lsp.config("clangd", {});
vim.lsp.enable("clangd");

vim.lsp.config("rust_analyzer", {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "rust-project.json" }
});
vim.lsp.enable("rust_analyzer");

vim.lsp.config("luals", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".git/", ".luarc.json/", ".luarc.jsonc/" }
});
vim.lsp.enable("luals");
