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
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({select = true}),
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-p>'] = cmp.mapping.select_prev_item(),
			}),
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
			},
		})
	end
}
