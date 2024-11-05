
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Find into config files (linux and other will use tmux sessionizer for that)
if vim.loop.os_uname().sysname == "Windows" then
	vim.keymap.set('n', '<leader>_f', function()
		builtin.find_files({ cwd = vim.env.HOME .. "/AppData/Local/nvim" })
	end)
	vim.keymap.set('n', '<leader>_g', function()
		builtin.git_files({ cwd = vim.env.HOME .. "/AppData/Local/nvim" })
	end)
end

local telescope = require('telescope');

telescope.setup{
	defaults = {
		prompt_prefix = '🔍 ',
		mappings = {
			-- Insert mode mappings
			i = {
				["<C-z>"] = function()
				end
			}
		},

	},
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
		}
	},
}

telescope.load_extension('fzf')

