require('lualine').setup {
	options = {
		theme = 'auto',
		component_separators = '|',
	},
	sections = {
		lualine_a = {'%3c', 'mode'},
		lualine_x = {'filetype'},
		lualine_y = {''},
		lualine_z = {'%3p%%'},
	},
	tabline = {
		lualine_a = {'buffers'},

	}
}

