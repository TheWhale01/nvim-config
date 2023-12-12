vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	'neoclide/coc.nvim',
	{
 	   "nvim-treesitter/nvim-treesitter",
    	build = ":TSUpdate",
    	config = function () 
      		local configs = require("nvim-treesitter.configs")

      		configs.setup({
          		ensure_installed = { "c", "cpp", "lua", "javascript", "typescript", "python", "html", "css" },
          		sync_install = false,
          		highlight = { enable = true },
          		indent = { enable = true },  
        	})
    	end
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"NvChad/nvterm",
		config = function ()
			require("nvterm").setup()
			local nvterm = require('nvterm.terminal')
			local toggle_modes = { 'n', 't' }
			local nvterm_mappings = {
				{ toggle_modes, '<A-i>', function () nvterm.toggle('float') end },
			}
			local opts = { noremap = true, silent = true }
			for _, mapping in ipairs(nvterm_mappings) do
				vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
			end
		end,
	},
})

-- Set remaps for Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Disable replace tabs with spaces
vim.cmd('set noexpandtab')
vim.opt.tabstop = 4
vim.opt.smarttab = true

-- Line numbers
vim.wo.number = true

-- Set the default theme
vim.cmd.colorscheme('catppuccin-macchiato')
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
