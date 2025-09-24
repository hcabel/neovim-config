return {
    "L3MON4D3/LuaSnip",
    lazy = true,
    keys = {
        { mode = "i", "<C-n>", "<Plug>luasnip-next-choice" },
        { mode = "s", "<C-n>", "<Plug>luasnip-next-choice" },
        { mode = "i", "<C-p>", "<Plug>luasnip-prev-choice" },
        { mode = "s", "<C-p>", "<Plug>luasnip-prev-choice" },
    },
    opts = {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        delete_check_events = "TextChanged",
    },
};
