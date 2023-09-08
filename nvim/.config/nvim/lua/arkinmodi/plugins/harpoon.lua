return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "harpoon add file" })
		vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "harpoon open menu" })

		vim.keymap.set("n", "<C-h>", function()
			ui.nav_file(1)
		end, { desc = "harpoon go to file 1" })
		vim.keymap.set("n", "<C-j>", function()
			ui.nav_file(2)
		end, { desc = "harpoon go to file 2" })
		vim.keymap.set("n", "<C-k>", function()
			ui.nav_file(3)
		end, { desc = "harpoon go to file 3" })
		vim.keymap.set("n", "<C-l>", function()
			ui.nav_file(4)
		end, { desc = "harpoon go to file 4" })
	end,
}
