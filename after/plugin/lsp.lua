local lsp = require("lsp-zero")
lsp.preset('recommended')

lsp.nvim_workspace()

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = '',
		warn = '',
		hint = '',
		info = ''
	},
})

lsp.on_attach(function(_client, bufnr)
	local opts = {buffer = bufnr, remap = false}
--
-- 	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
 	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
-- 	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
-- 	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
-- 	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.format_on_save({
	format_ops = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["rust_analyzer"] = {
			'rust',
		},
	}
})

local servers = {
	"rust_analyzer@2024-10-14",
}

require('mason-lspconfig').setup({
	ensure_installed = servers,
	handlers = {
		lsp.default_setup,
		rust_analyzer = function()
			require('lspconfig').rust_analyzer.setup({
				filetypes = { "rust" },
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						diagnostics = {
							enable = true,
						}
					}
				}
			})
		end,
	}
})

local rust_lsp = lsp.build_options("rust_analyzer", {})
lsp.setup()

require('rust-tools').setup({
	server = rust_lsp,
})

vim.diagnostic.config({
	underline = {
		severity = { max = vim.diagnostic.severity.INFO }
	},
	virtual_text = {
		severity = { min = vim.diagnostic.severity.WARN }
	}
})

vim.g.rust_recommended_style = false
