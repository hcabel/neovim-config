return {
    'nvim-telescope/telescope.nvim', -- Fuzzy finder
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
        { mode = 'n', "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { mode = 'n', "<leader>ps", "<cmd>Telescope live_grep<cr>",  desc = "Live grep" },
        {
          "<leader>fe",
          function()
            local pickers = require("telescope.pickers")
            local finders = require("telescope.finders")
            local conf = require("telescope.config").values
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")

            pickers.new({}, {
              prompt_title = "Env files in bin/",
              finder = finders.new_oneshot_job({
                "fd",
                "--type", "f",
                "--hidden",
                "--no-ignore",
                "--glob", "*.env",
                "bin/",
              }),
              previewer = conf.file_previewer({}),
              sorter = conf.generic_sorter({}),
              attach_mappings = function(prompt_bufnr)
                actions.select_default:replace(function()
                  actions.close(prompt_bufnr)
                  local selection = action_state.get_selected_entry()
                  vim.cmd("edit " .. selection[1])
                end)
                return true
              end,
            }):find()
          end,
          desc = "Find env files in bin/",
        },
    },
    opts = {
        defaults = {
            prompt_prefix = '🔍 ',
            mappings = {
                n = {
                    ["q"] = function(...)
                        require("telescope.actions").close(...)
                    end,
                }
            },

        },
        pickers = {
            find_files = {
                find_command = {
                    "rg",
                    "--files",
                    "--hidden",
                    "-u",
                    "--glob", "!bin/",
                    "--glob", "!.git/",
                    "--glob", "!.github/",
                    "--glob", "!.vscode/",
                    "--glob", "!node_modules/",
                    "--glob", "!dist/",
                    "--glob", "!.nx/",
                    "--glob", "!target/",
                    "--glob", "!bin/",
                },
            },
            live_grep = {
                additional_args = function()
                    return {
                        "--hidden",
                        "-u",
                        "--glob", "!bin/",
                        "--glob", "!.git/",
                        "--glob", "!.github/",
                        "--glob", "!.vscode/",
                        "--glob", "!node_modules/",
                        "--glob", "!dist/",
                        "--glob", "!.nx/",
                        "--glob", "!target/",
                        "--glob", "!bin/",
                    }
                end,
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
