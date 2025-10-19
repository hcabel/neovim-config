return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        "LazyVim/LazyVim",
        opt = true
    },
    events = "VeryLazy",
    opts = function()
        local LazyVim = require("lazyvim.util")
        -- PERF: we don't need this lualine require madness 🤷
        local lualine_require = require("lualine_require")
        lualine_require.require = require

        local icons = LazyVim.config.icons

        vim.o.laststatus = vim.g.lualine_laststatus
        return {
            options = {
                theme = "auto",
                globalstatus = vim.o.laststatus == 3,
                section_separators = { left = '', right = '' },
                component_separators = { left = '❱', right = '❰' },
                disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
            },
            sections = {
                lualine_a = { function() -- Custom Mode module to show recording status
                    local reg = vim.fn.reg_recording()
                    if reg ~= "" then
                        return "Recording @" .. reg
                    else
                        local mode = vim.api.nvim_get_mode().mode
                        local mode_map = {
                            n = 'NORMAL',
                            i = 'INSERT',
                            v = 'VISUAL',
                            V = 'V-LINE',
                            ['^V'] = 'V-BLOCK',
                            c = 'COMMAND',
                            R = 'REPLACE',
                            s = 'SELECT',
                            S = 'S-LINE',
                            ['^S'] = 'S-BLOCK',
                            t = 'TERMINAL',
                        }
                        return mode_map[mode] or mode:upper()
                    end
                end },
                lualine_b = {
                    'branch',
                    {
                        "diff",
                        symbols = {
                            added = icons.git.added,
                            modified = icons.git.modified,
                            removed = icons.git.removed,
                        },
                        source = function()
                            local gitsigns = vim.b.gitsigns_status_dict
                            if gitsigns then
                                return {
                                    added = gitsigns.added,
                                    modified = gitsigns.changed,
                                    removed = gitsigns.removed,
                                }
                            end
                        end,
                    },
                },
                lualine_c = {
                    {
                        'filetype',
                        icon_only = true,
                        separator = '',
                    },
                    {
                        padding = { left = 0, right = 1 },
                        LazyVim.lualine.pretty_path()
                    },
                    {
                        'location',
                        padding = { left = 0, right = 1 }
                    },
                    {
                        'diagnostics',
                        symbols = {
                            error = icons.diagnostics.Error,
                            warn = icons.diagnostics.Warn,
                            info = icons.diagnostics.Info,
                            hint = icons.diagnostics.Hint,
                        },
                    }
                },
                lualine_x = {
                    {
                        function() return require("noice").api.status.command.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                        color = function() return { fg = Snacks.util.color("Statement") } end,
                    },
                },
                lualine_y = {}, -- Override default lualine_y to be empty
                lualine_z = { "progress" }
            },
        }
    end
}
