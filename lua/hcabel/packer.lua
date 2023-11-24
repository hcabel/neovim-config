-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}) -- Better intelissense
	use('nvim-treesitter/playground') -- Allow you to see the symbole tree

	-- use('mbbill/undotree')

	-- Git workflow
	use('tpope/vim-fugitive')
	use("lewis6991/gitsigns.nvim")

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{"williamboman/mason-lspconfig.nvim"},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'}, -- Required
		}
	}

	use("theprimeagen/harpoon")

	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	use('zbirenbaum/copilot.lua')
	use {
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function ()
			require("copilot_cmp").setup()
		end
	}
end)
