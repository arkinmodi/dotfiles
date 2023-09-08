return {
	"norcalli/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function ()
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
	end
}
