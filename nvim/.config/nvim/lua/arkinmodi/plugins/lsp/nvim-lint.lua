return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local nvim_lint = require("lint")
		nvim_lint.linters_by_ft = {
			python = { "flake8", "mypy" },
			yaml = { "yamllint" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
			callback = function()
				require("lint").try_lint()
			end,
		})
		vim.keymap.set("n", "<leader>fl", nvim_lint.try_lint, { desc = "run nvim-lint" })
	end,
}
