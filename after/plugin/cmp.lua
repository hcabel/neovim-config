
local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}

local function GetMapping()
	local mapping = cmp.mapping.preset

	mapping.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	})

	mapping["<Tab>"] = vim.NIL
	mapping["<S-Tab>"] = vim.NIL

	return mapping
end

cmp.setup({
	mapping = GetMapping(),
})

