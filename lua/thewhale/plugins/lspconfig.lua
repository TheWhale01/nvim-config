return {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		local lspconfig = require('lspconfig')
		local cmp_nvim_lsp = require('cmp_nvim_lsp')
		local lsp_servers = require('thewhale.configs.lspconfig')
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = buffer
			keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)
			keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
			keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
			keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)
			keymap.set({ 'n', 'v' }, "<leader>ca", vim.lsp.buf.code_action, opts)
			keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
			keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)
			keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
			keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
			keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
			keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
		end
		local capabilities = cmp_nvim_lsp.default_capabilities()
		for _, lsp in ipairs(lsp_servers) do
			lspconfig[lsp].setup({
				on_attach = on_attach,
				capabilities = capabilities
			})
		end
	end
}
