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
					IncSearch = { bg = colours.lsp_parameter, fg = colours.selection_inactive },
					StatusLine = { bg = colours.panel_bg, fg = colours.keyword },
					Visual = { bg = colours.selection_bg },

					-- transparency
					FoldColumn = { bg = "None" },
					Folded = { bg = "None" },
					Normal = { bg = "None" },
					NormalFloat = { bg = "None" },
					SignColumn = { bg = "None" },
					VertSplit = { bg = "None" },
					WhichKeyFloat = { bg = "None" },
					WinSeparator = { bg = "None" },
				},
			})
			vim.cmd.colorscheme("ayu")
		end,
	},
}
