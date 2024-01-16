return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require('mason')
		local mason_lspconfig = require('mason-lspconfig')
		local lsp_servers = require('thewhale.configs.lspconfig')
		mason.setup()
		mason_lspconfig.setup({
			ensure_installed = lsp_servers,
			automatic_installation = true,
		})
	end,
}
