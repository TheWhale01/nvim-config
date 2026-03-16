return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.install({
			"c", "cpp", "lua", "javascript", "typescript",
			"python", "html", "css", "svelte", "rust"
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(event)
				pcall(vim.treesitter.start, event.buf)
				vim.bo[event.buf].indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
			end,
		})
	end,
}
