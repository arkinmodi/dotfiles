return {
	-- enabled = false,
	"nvim-orgmode/orgmode",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter", lazy = true },
	},
	ft = "org",
	opts = {
		org_startup_folded = "showeverything",
	},
}
