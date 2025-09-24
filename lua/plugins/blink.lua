return {
    'saghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets', -- optional: provides snippets for the snippet source TODO replace with luasnip
    },
    version = '1.*',
    opts = {
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        keymap = {
            preset = "enter",
        },
        completion = {
            list = {
                selection = {
                    preselect = true,
                    auto_insert = false,
                }
            },
            documentation = {
                auto_show = true,
            },
        },
        appearance = {
            nerd_font_variant = 'mono'
        },
        cmdline = {
            completion = {
                ghost_text = { enabled = false },
                menu = { auto_show = true, }
            },
        },
        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        fuzzy = { implementation = "prefer_rust" }
    },
    opts_extend = { "sources.default" }
}
