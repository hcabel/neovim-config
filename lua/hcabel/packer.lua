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
    use("wbthomason/packer.nvim")                -- Have packer manage itself

    use({ 'rose-pine/neovim', as = 'rose-pine', }) -- Theme

    use({
        'nvim-telescope/telescope.nvim',         -- Fuzzy finder
        requires = {
            "nvim-lua/plenary.nvim"
        }
    })

    use('nvim-treesitter/nvim-treesitter', { -- Better syntax highlighting
        run = ':TSUpdate',
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "javascript",
                    "typescript",
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "rust",
                    "cpp"
                },
                sync_install = false,
                auto_install = true, -- Require tree-sitter CLI
                highlight = {
                    enable = true,
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                }
            })
        end
    })
    use('nvim-treesitter/playground') -- Allow you to see the symbols tree

    use('mbbill/undotree')          -- Better undo history

    -- Git workflow
    use({
        'NeogitOrg/neogit',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'sindrets/diffview.nvim' }
        },
    })
    use("lewis6991/gitsigns.nvim")

    use({
        "saecki/crates.nvim",
        config = function()
            require("crates").setup()
        end
    })

    use("theprimeagen/harpoon") -- Better file markers

    use({
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    })

    use({
        'gelguy/wilder.nvim', -- Cmdline completion
        requires = { "nvim-tree/nvim-web-devicons" },
    })

    use({
        "numToStr/Comment.nvim", -- Easy commenting code
        config = function()
            require('Comment').setup({ ignore = "^%s*$", })
        end
    })

    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    })

    use({
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons'
    })

    use("Bekaboo/deadcolumn.nvim") -- Nicer color column
    use({
        'mawkler/modicator.nvim', -- Current line number highlight
        after = "rose-pine",
    })

    use({
        'folke/noice.nvim', -- Better cmd field
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify", -- Notification
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
                    bottom_search = false,
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true, -- add a border to hover docs and signature help
                },
            })
        end
    })

    use("karb94/neoscroll.nvim") -- Smooth scrolling

    use({
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end
    })

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

    -- AI
    use('github/copilot.vim')
    -- use('NickvanDyke/opencode.nvim') TODO: Try this one later


    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
