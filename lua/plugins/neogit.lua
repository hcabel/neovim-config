return {
    'NeogitOrg/neogit',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'sindrets/diffview.nvim' }
    },
    keys = {
        { mode = 'n', "<leader>gs", "<cmd>Neogit<cr>" },
    }
};
