return {
    "mbbill/undotree", -- Better undo history
    lazy = false,
    keys = {
        { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" }
    },
    config = function()
        if vim.loop.os_uname().sysname == "Windows" then
            vim.opt.undodir = os.getenv("UserProfile") .. "/.vim/undodir"
            vim.g.undotree_DiffCommand = "FC"
        else
            vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
            vim.g.undotree_DiffCommand = "diff"
        end
        vim.opt.undofile = true
    end
}
