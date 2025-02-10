return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	opts = {},
	keys = {
		{
			"<leader>tt",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"[t",
			"<cmd>Trouble diagnostics prev focus=true<cr>",
			desc = "Diagnostics Previous (Trouble)",
		},
		{
			"]t",
			"<cmd>Trouble diagnostics next focus=true<cr>",
			desc = "Diagnostics Next (Trouble)",
		},
	},
}
