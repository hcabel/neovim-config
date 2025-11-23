return {
    'folke/snacks.nvim',
    priority = 1001,
    opts = {
        scroll = {
            enabled = true, -- Disable scrolling animations
            animate = {
                duration = { step = 25, total = 100 },
                easing = "linear",
            },
            animate_repeat = {
                duration = { step = 5, total = 50 },
                easing = "linear",
            }
        },
        explorer = {
            enabled = false, -- TODO [hcabel 2025-09-28]: Give it another try, if it can hide itself
        },
        image = {
            enabled = true, -- Open image in neovim
            -- FIXME [hcabel 2025-09-28]: Not working with alacrity
        },
        indent = {
            enabled = true, -- Show indent guides
        },
        lazygit = {
            configure = true,
            enabled = true, -- Show git changes in the sign column
        },
    }
}
