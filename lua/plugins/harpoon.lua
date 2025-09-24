local api = vim.api;

return {
    "theprimeagen/harpoon", -- Better file markers
    branch = "harpoon2",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    keys = function()
        local keys = {
            { mode = 'n', "<leader>a", function() require("harpoon"):list():add() end },
            {
                mode = 'n',
                "<C-e>",
                function()
                    local harpoon = require("harpoon");
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end
            } }
        for i = 1, 9 do
            table.insert(keys, {
                "<leader>" .. i,
                function()
                    require("harpoon"):list():select(i)
                end,
                desc = "Harpoon to File " .. i,
            })
        end
        return keys
    end,
    opts = {
        settings = {
            save_on_toggle = true,
        },
    },
}
