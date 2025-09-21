local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use ("wbthomason/packer.nvim") -- Have packer manage itself

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }

  use({
    'rose-pine/neovim', as = 'rose-pine',
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

  use({
    "saecki/crates.nvim",
    config = function()
      require("crates").setup()
    end
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

  use({
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup({ ignore = "^%s*$", })
    end
  })

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

  use("Bekaboo/deadcolumn.nvim") -- Nicer color column
  use({ 'mawkler/modicator.nvim', -- Current line number highlight
    after = "rose-pine",
  })

  use({ 'folke/noice.nvim', -- Better cmd field
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify", -- Notification manager
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      } )
    end
  })

  use({'windwp/nvim-ts-autotag', config = function ()
    require('nvim-ts-autotag').setup()
  end})

  use({
    "windwp/nvim-autopairs",
    requires = {
      "hrsh7th/nvim-cmp", -- Required for autopairs to work with nvim-cmp
    },
    event = "InsertEnter",
    config = function()
      local cmp = require("cmp")
      local autopairs = require("nvim-autopairs")
      autopairs.setup({
        check_ts = true, -- Enable treesitter support
      })
    end
  })


  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
