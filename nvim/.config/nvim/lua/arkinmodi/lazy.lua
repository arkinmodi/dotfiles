local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	-- telescope.nvim
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                              , branch = '0.1.1',
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-context",

	-- undotree
	"mbbill/undotree",

	-- gitsigns
	"lewis6991/gitsigns.nvim",

	-- auto complete pairs (e.g, '{' -> '{}')
	"windwp/nvim-autopairs",

	-- colours
	"navarasu/onedark.nvim",
	"rose-pine/neovim",
	"folke/tokyonight.nvim",
	{ "catppuccin/nvim", name = "catppuccin" },

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	},
	"jose-elias-alvarez/null-ls.nvim",

	-- Commenting
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"folke/todo-comments.nvim",
})