return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local python_linters = {}
		if vim.fn.executable("flake8") == 1 then
			table.insert(python_linters, "flake8")
		end
		if vim.fn.executable("mypy") == 1 then
			table.insert(python_linters, "mypy")
		end

		local yaml_linters = {}
		if vim.fn.executable("yamllint") == 1 then
			table.insert(yaml_linters, "yamllint")
		end

		local nvim_lint = require("lint")
		nvim_lint.linters_by_ft = {
			python = python_linters,
			yaml = yaml_linters,
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
