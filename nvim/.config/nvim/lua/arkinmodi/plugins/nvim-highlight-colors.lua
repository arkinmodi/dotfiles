return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		enable_named_colors = true,
		enable_tailwind = true,
		render = "background",
	},
}
