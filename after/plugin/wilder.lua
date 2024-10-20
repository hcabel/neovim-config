local wilder = require('wilder')

wilder.set_option('renderer', wilder.popupmenu_renderer({
	highlighter = wilder.basic_highlighter(),
	left = {
		' ',
		wilder.popupmenu_devicons(),
	},
	highlights = {
		accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#f4468f'}}),
	},
}))

wilder.setup({
	modes =	{':', '/', '?'},
})
