return {
	-- enabled = false,
	"nvim-orgmode/orgmode",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter", lazy = true },
	},
	ft = "org",
	config = function()
		require("orgmode").setup_ts_grammar()
		require("orgmode").setup()
	end,
}
