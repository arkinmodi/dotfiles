return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		{ "rcarriga/nvim-dap-ui", config = true },
		{ "theHamsta/nvim-dap-virtual-text", config = true },
	},
	keys = { "<F1>", "<F4>", "<F5>", "<F6>", "<F7>", "<F8>", "<F9>" },
	config = function()
		local dap = require("dap")

		vim.keymap.set("n", "<F1>", require("dapui").toggle, { desc = 'require("dapui").toggle' })
		vim.keymap.set(
			"n",
			"<F4>",
			dap.clear_breakpoints,
			{ desc = 'require("dap").clear_breakpoints' }
		)
		vim.keymap.set(
			"n",
			"<F5>",
			dap.toggle_breakpoint,
			{ desc = 'require("dap").toggle_breakpoint' }
		)
		vim.keymap.set("n", "<F6>", dap.continue, { desc = 'require("dap").continue' })
		vim.keymap.set("n", "<F7>", dap.step_into, { desc = 'require("dap").step_into' })
		vim.keymap.set("n", "<F8>", dap.step_over, { desc = 'require("dap").step_over' })
		vim.keymap.set("n", "<F9>", dap.step_out, { desc = 'require("dap").step_out' })
	end,
}
