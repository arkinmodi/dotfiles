return {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		local comment = require("Comment")
		local ts_context_commentstring =
			require("ts_context_commentstring.integrations.comment_nvim")

		comment.setup({
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
	keys = {
		{ "gcc", mode = "n", desc = "Toggles the current line using linewise comment" },
		{ "gbc", mode = "n", desc = "Toggles the current line using blockwise comment" },
		{ "gc", mode = "v", desc = "Toggles the region using linewise comment" },
		{ "gb", mode = "v", desc = "Toggles the region using blockwise comment" },
	},
}
