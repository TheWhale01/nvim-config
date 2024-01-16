return {
		"NvChad/nvterm",
		config = function ()
				require("nvterm").setup()
				local nvterm = require('nvterm.terminal')
				local toggle_modes = { 'n', 't' }
				local nvterm_mappings = {
						{
								toggle_modes, '<A-i>', function () nvterm.toggle('float') end
						},
				}
				local opts = { noremap = true, silent = true }
				for _, mapping in ipairs(nvterm_mappings) do
						vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
				end
		end,
}
 
