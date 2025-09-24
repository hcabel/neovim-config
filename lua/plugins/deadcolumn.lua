return {
    "Bekaboo/deadcolumn.nvim", -- Nicer max color line
    opts =
    {
        scope = 'visible',
        modes = { 'n', 'i', 'ic', 'ix', 'R', 'Rc', 'Rx', 'Rv', 'Rvc', 'Rvx' },
        blending = {
            threshold = 0.75,
            colorcode = '#000000',
            hlgroup = {
                'Normal', 'bg',
            },
        },
        warning = {
            alpha = 0.4,
            offset = 0,
            colorcode = '#FF0000',
            hlgroup = {
                'Error', 'bg',
            },
        },
        extra = {
            follow_tw = nil,
        },
    }
}
