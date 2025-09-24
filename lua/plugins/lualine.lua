-- local theme_auto = require('lualine.themes.auto')
-- local bg_color = '#26233a'
-- theme_auto.normal.c.bg = bg_color
-- theme_auto.insert.c.bg = bg_color
-- theme_auto.visual.c.bg = bg_color
-- theme_auto.replace.c.bg = bg_color
-- theme_auto.command.c.bg = bg_color
-- theme_auto.inactive.c.bg = "#1c1a2a"

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    opts = {
        options = {
            icons_enabled = true,
            theme = "rose-pine",
            section_separators = { left = '', right = '' },
            component_separators = { left = '❱', right = '❰' },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
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
                    'diff',
                    symbols = {
                        added = ' ',
                        modified = ' ',
                        removed = ' '
                    }
                }
            },
            lualine_c = {
                {
                    'filetype',
                    icon_only = true,
                    separator = '',
                },
                {
                    padding = { left = 0, right = 1 },
                    'filename',
                    path = 1,
                    symbols = {
                        modified = '',
                        readOnly = '',
                        unamed = '',
                        newfile = '',
                    },
                },
                {
                    'location',
                    padding = { left = 0, right = 1 }
                },
                {
                    'diagnostics',
                    symbols = {
                        error = ' ',
                        warn = ' ',
                        hint = ' ',
                        info = ' '
                    },
                }
            },
            lualine_x = {
                {
                    require("noice").api.statusline.mode.get,
                    cond = require("noice").api.statusline.mode.has,
                    color = { fg = "#ff9e64" },
                }
            },
            lualine_y = { "tabs" },
            lualine_z = { 'location' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }
}
