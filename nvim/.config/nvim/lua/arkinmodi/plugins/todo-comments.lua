return {
	"folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
	dependencies = { "nvim-lua/plenary.nvim" },
}
