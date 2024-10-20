
require('modicator').setup({
	show_warnings = false,
	highlights = {
		defaults = {
			bold = true,
			italic = false,
		},
	},
	integration = {
		lualine = {
			enabled = true,
			-- Letter of lualine section to use
			-- (if `nil`, gets detected automatically)
			mode_section = nil,
			highlight = 'bg',
		},
	},
})
