return {
    {
        'folke/snacks.nvim',
        priority = 1001,
        opts = {
            scroll = {
                enabled = true, -- Disable scrolling animations
                animate = {
                    duration = { step = 25, total = 100 },
                },
            },
            explorer = {
                enabled = false, -- TODO [hcabel 2025-09-28]: Give it another try, if it can hide itself
            },
            image = {
                enabled = true, -- Open image in neovim
                -- FIXME [hcabel 2025-09-28]: Not working with alacrity
            },
        }
    },

    {
        "catgoose/nvim-colorizer.lua", -- Color color text in the IDE
        event = "BufReadPre",
        opts = {},
    },

    {
        "saecki/crates.nvim", -- Show crate versions
        ft = { "toml" },
    }
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

    -- TO TRY LATER
    -- > "NickvanDyke/opencode.nvim"
    -- > "mrcjkb/rustaceanvim"

    -- IDEA
    -- > When searching i'd like the non matching lines to be faded out
    -- > Keypress history
    -- > Remove Text from cmp suggestion
    -- > snipets higher ranking in cmp

}
