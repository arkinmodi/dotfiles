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
		tag = "0.1.2",
		-- or                              , branch = '0.1.1',
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

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
	"Shatur/neovim-ayu",

	-- hex colour code preview
	"norcalli/nvim-colorizer.lua",

	-- LSP
	"L3MON4D3/LuaSnip",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-path",
	"hrsh7th/nvim-cmp",
	"neovim/nvim-lspconfig",

	-- TODO: null-ls is being archived and will eventually stop working due to
	-- neovim or formatter changes
	"jose-elias-alvarez/null-ls.nvim",

	-- Commenting
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"folke/todo-comments.nvim",

	-- indent level guide lines
	"lukas-reineke/indent-blankline.nvim",
})
