-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'}
		}
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

	use('mbbill/undotree')

	-- Git workflow
	use({'NeogitOrg/neogit',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'sindrets/diffview.nvim'}
		}
	})
	use("lewis6991/gitsigns.nvim")

	use({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			"simrat39/rust-tools.nvim",

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
			{'hrsh7th/cmp-nvim-lsp'},
			-- {'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'}, -- Required
		}
	})

	use("theprimeagen/harpoon")

	use({
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make'
	})

	use('github/copilot.vim')

	use({
		'gelguy/wilder.nvim',
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	use("numToStr/Comment.nvim")

--	use({
--		"nvim-neo-tree/neo-tree.nvim",
--		branch = "v3.x",
--		requires = {
--			"nvim-lua/plenary.nvim",
--			"nvim-tree/nvim-web-devicons",
--			"MunifTanjim/nui.nvim",
--		},
--	})

	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	})

	use({
		'akinsho/bufferline.nvim',
		tag = "*", requires = 'nvim-tree/nvim-web-devicons'
	})

	use {"hcabel/ov-log-highlighting"}

	use("Bekaboo/deadcolumn.nvim") -- Nicer color column

	use({ 'mawkler/modicator.nvim', -- Current line number highlight
		after = "rose-pine",
	})
end)
