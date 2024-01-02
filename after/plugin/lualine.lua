
local lualine = require('lualine')

-- Slow ??
local function lsp_progress()
	local messages = vim.lsp.util.get_progress_messages()
	if #messages == 0 then
		return ""
	end
	local status = {}
	for _, msg in pairs(messages) do
		table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
	end
	local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
	local ms = vim.loop.hrtime() / 1000000
	local frame = math.floor(ms / 120) % #spinners
	return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

local custom_auto = require('lualine.themes.auto')
print(custom_auto.inactive.a.bg)
local bg_color = '#26233a'
custom_auto.normal.c.bg = bg_color
custom_auto.insert.c.bg = bg_color
custom_auto.visual.c.bg = bg_color
custom_auto.replace.c.bg = bg_color
custom_auto.command.c.bg = bg_color
custom_auto.inactive.c.bg = "#1c1a2a"

lualine.setup({
	options = {
		icons_enabled = true,
		theme = custom_auto,
		section_separators = { left = '', right = '' },
		component_separators = { left = '❱', right = '❰' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {
			'branch',
			{
				'diff',
				symbols = {
					added = ' ',
					modified = ' ',
					removed = ' '
				}
			}
		},
		lualine_c = {
			{
				'filetype',
				icon_only = true,
				separator = '',
			}, {
				padding = { left = 0, right = 1 },
				'filename',
				path = 1,
				symbols = {
					modified = '',
					readOnly = '',
					unamed = '',
					newfile = '',
				},
			}, {
				'location',
				padding = { left = 0, right = 1 }
			}, {
				'diagnostics',
				symbols = {
					error = ' ',
					warn = ' ',
					hint = ' ',
					info = ' '
				},
			}
		},
		lualine_x = { lsp_progress },
		lualine_y = {"tabs"},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
})

