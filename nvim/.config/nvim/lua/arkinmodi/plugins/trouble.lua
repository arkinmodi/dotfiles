return {
	"folke/trouble.nvim",
	tag = "v2.10.0",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("trouble").setup()

		vim.keymap.set("n", "<leader>tt", require("trouble").toggle, { desc = "trouble.toggle()" })

		vim.keymap.set("n", "[t", function()
			require("trouble").previous({ skip_groups = true, jump = true })
		end, { desc = "trouble.previous()" })

		vim.keymap.set("n", "]t", function()
			require("trouble").next({ skip_groups = true, jump = true })
		end, { desc = "trouble.next()" })
	end,
}
