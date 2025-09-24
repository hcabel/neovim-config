return {
    'nvim-telescope/telescope.nvim', -- Fuzzy finder
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { mode = 'n', "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { mode = 'n', "<leader>ps", "<cmd>Telescope live_grep<cr>",  desc = "Live grep" },
    },
    opts = {
        defaults = {
            prompt_prefix = '🔍 ',
            mappings = {
                -- Insert mode mappings
                i = {
                    ["<C-z>"] = function()
                    end
                }
            },

        },
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
            }
        },
    },
}
