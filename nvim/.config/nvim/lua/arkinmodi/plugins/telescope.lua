return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		"<C-p>",
		"<leader>pWs",
		"<leader>pf",
		"<leader>ps",
		"<leader>pws",
	},
	cmd = { "Telescope" },
	config = function()
		local actions = require("telescope.actions")
		local keymaps = {
			["<C-p>"] = require("telescope.actions.layout").toggle_preview,
			["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
			["<C-k>"] = actions.preview_scrolling_up,
			["<C-j>"] = actions.preview_scrolling_down,
			["<C-h>"] = actions.preview_scrolling_left,
			["<C-l>"] = actions.preview_scrolling_right,
		}

		require("telescope").setup({
			defaults = {
				mappings = {
					i = keymaps,
					n = keymaps,
				},
			},
		})

		require("telescope").load_extension("fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find_files" })
		vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope git_files" })

		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Telescope grep string" })

		vim.keymap.set("n", "<leader>pws", function()
			builtin.grep_string({ search = vim.fn.expand("<cword>") })
		end, { desc = "Telescope grep word under cusor" })

		vim.keymap.set("n", "<leader>pWs", function()
			builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
		end, { desc = "Telescope grep WORD under cusor" })
	end,
}
