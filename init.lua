local vim = vim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("set")

vim.g.lazyvim_check_order = false -- FIXME [hcabel 2025-09-28]: temporary workaround
require("lazy").setup("plugins")

require("remap")
require("automation")
require("lsp")
require("snippets")

local function set_transparency()
    vim.cmd([[
        hi Normal guibg=NONE ctermbg=NONE
        hi NormalNC guibg=NONE ctermbg=NONE
        hi SignColumn guibg=NONE ctermbg=NONE
        hi TabLine guibg=NONE ctermbg=NONE
        hi TabLineFill guibg=NONE ctermbg=NONE
        hi TabLineSel guibg=NONE ctermbg=NONE
    ]])
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#777777' })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#777777' })
end
set_transparency()
