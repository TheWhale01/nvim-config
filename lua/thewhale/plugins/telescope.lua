return {
	'nvim-telescope/telescope.nvim',
	branch = 'master',
	version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
		},
	}
}
