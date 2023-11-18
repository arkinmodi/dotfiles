return {
	"nvim-neorg/neorg",
	version = "*",
	build = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim" },
	ft = "norg",
	config = function()
		require("neorg").setup({
			load = {
				["core.concealer"] = {},
				["core.defaults"] = {},
				["core.export"] = {},
				["core.export.markdown"] = { config = { extensions = "all" } },
				["core.journal"] = { config = { strategy = "flat" } },
				["core.summary"] = {},
			},
		})
	end,
}
