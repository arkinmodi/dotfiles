return {
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function()
			local colours = require("ayu.colors")
			colours.generate()
			require("ayu").setup({
				mirage = false,
				overrides = {
					GitSignsCurrentLineBlame = { fg = colours.guide_active },
					IblScope = { fg = colours.guide_active },
					IncSearch = { bg = colours.lsp_parameter, fg = colours.selection_inactive },
					StatusLine = { fg = colours.keyword },
					Visual = { bg = colours.selection_bg },
				},
			})
			vim.cmd.colorscheme("ayu")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
	},
	{
		"navarasu/onedark.nvim",
		lazy = true,
		opts = {
			style = "darker",
			transparent = true,
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		config = true,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
	},
}
