return {
    "nvim-treesitter/nvim-treesitter", -- Better syntax highlighting
    dependencies = {
        "nvim-treesitter/playground",  -- Allow you to see the symbols tree
    },
    build = ':TSUpdate',
    opts =
    {
        ensure_installed = {
            "javascript",
            "typescript",
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "rust",
            "cpp"
        },
        sync_install = false,
        auto_install = true,     -- Require tree-sitter CLI
        highlight = {
            enable = true,
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
        }
    }
};
