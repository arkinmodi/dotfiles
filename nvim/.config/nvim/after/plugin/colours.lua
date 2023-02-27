require('onedark').setup({
    style = 'darker',
    transparent = true,
})

function ColourMe(colour)
	colour = colour or "onedark"
	vim.cmd.colorscheme(colour)

	-- make transparent
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColourMe()
