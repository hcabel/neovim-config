-- clear trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


-- Delete multiple blank lines
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "*",
    command = [[%s/\n\{3,}/\r\r/e]],
})
