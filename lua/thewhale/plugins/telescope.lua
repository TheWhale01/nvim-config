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
	},
	config = function()
		require('telescope').setup({
			defaults = {
				preview = {
					treesitter = false,
				},
			},
		})
	end
}
