require("onedark").setup({
	style = "darker",
	transparent = true,
})

require("rose-pine").setup()

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

function ColourMe(colour)
	colour = colour or "ayu"
	vim.cmd.colorscheme(colour)

	-- make transparent
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColourMe()

require("colorizer").setup({
	"css",
	"html",
	"javascript",
	"typescript",
}, {
	css = true,
	css_fn = true,
	mode = "background",
})
