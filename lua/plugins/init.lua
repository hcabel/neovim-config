return {
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

    -- BUGS
    -- > Tab with autocompletion goes to second item instead of completing the first
    -- > commenting a line, comment empty lines too

    -- IDEA
    -- > When searching i'd like the non matching lines to be faded out
    -- > Keypress history
    -- > Remove Text from cmp suggestion
    -- > snipets higher ranking in cmp
    -- > Go back to root in netrw
}
