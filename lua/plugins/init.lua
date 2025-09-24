return {
    {
        'rose-pine/neovim', -- Theme
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        dependencies = {
            'mawkler/modicator.nvim', -- Current line number highlight
        },
        config = function() vim.cmd([[colorscheme rose-pine]]) end,
    },

    "karb94/neoscroll.nvim", -- Smoother scrolling

    {
        "catgoose/nvim-colorizer.lua", -- Color color text in the IDE
        event = "BufReadPre",
        opts = {},
    }
    -- LSP
    -- {
    --     "nvim-treesitter/nvim-treesitter", -- Better syntax highlighting
    --     build = ':TSUpdate',
    --     config = function()
    --         -- require("nvim-treesitter.configs").setup({
    --         --     ensure_installed = {
    --         --         "javascript",
    --         --         "typescript",
    --         --         "c",
    --         --         "lua",
    --         --         "vim",
    --         --         "vimdoc",
    --         --         "query",
    --         --         "rust",
    --         --         "cpp"
    --         --     },
    --         --     sync_install = false,
    --         --     auto_install = true, -- Require tree-sitter CLI
    --         --     highlight = {
    --         --         enable = true,
    --         --         -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    --         --         -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    --         --         -- Using this option may slow down your editor, and you may see some duplicate highlights.
    --         --         -- Instead of true it can also be a list of languages
    --         --         additional_vim_regex_highlighting = false,
    --         --     },
    --         --     indent = {
    --         --         enable = true,
    --         --     }
    --         -- })
    --     end
    -- },
    -- "nvim-treesitter/playground", -- Allow you to see the symbols tree

    -- {
    --     "saecki/crates.nvim",
    --     config = function() require("crates").setup() end
    -- },
    --
    -- {
    --     "folke/lazydev.nvim", -- Resolve "vim" global var in lua file
    --     ft = "lua",
    --     cmd = "LazyDev",
    --     opts = {
    --         library = {
    --             { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    --             { path = "LazyVim",            words = { "LazyVim" } },
    --             { path = "snacks.nvim",        words = { "Snacks" } },
    --             { path = "lazy.nvim",          words = { "LazyVim" } },
    --         },
    --     },
    -- },

    -- {
    --     'windwp/nvim-ts-autotag', -- Auto close and rename html tags
    --     config = function()
    --         require('nvim-ts-autotag').setup()
    --     end
    -- },

    -- -- {
    -- --     "windwp/nvim-autopairs", -- Auto close brackets, parens, quotes, etc.
    -- --     dependencies = { "hrsh7th/nvim-cmp", -- Required for autopairs to work with nvim-cmp },
    -- --     event = "InsertEnter",
    -- --     config = function()
    -- --         local cmp = require("cmp")
    -- --         local autopairs = require("nvim-autopairs")
    -- --         autopairs.setup({
    -- --             check_ts = true, -- Enable treesitter support
    -- --         })
    -- --     end
    -- -- },

    -- "NickvanDyke/opencode.nvim", TODO: Try this one later
    -- -- "mrcjkb/rustaceanvim", TODO: Try this later
}
