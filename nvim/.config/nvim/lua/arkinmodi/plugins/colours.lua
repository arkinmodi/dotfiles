return {
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function()
			require("ayu").setup({
				mirage = false,
				overrides = {
					IncSearch = {
						bg = "#FFFFFF", -- White
						fg = "#000000", -- Black
					},
					Normal = {
						bg = "none", -- make transparent
					},
					NormalFloat = {
						bg = "none", -- make transparent
					},
					Visual = {
						bg = "#36454F", -- Charcoal Grey
					},
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
		}
	},
	{
		"rose-pine/neovim",
		name = 'rose-pine',
		lazy = true,
		config = true,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
	},
}
