return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		"L3MON4D3/LuaSnip",
		'saadparwaiz1/cmp_luasnip',
	},
	config = function()
		local cmp = require('cmp')

		require('luasnip.loaders.from_vscode').lazy_load()
		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
			},
		})
	end
}
