-- Start impatient if available
local impatient_status, impatient = pcall(require, "impatient")
if impatient_status then
  impatient.enable_profile()
end

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the init.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Plugin manager, packer, failed to load!")
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- have packer manage itself
  use("nvim-lua/plenary.nvim") -- common dependency
  use("nvim-lua/popup.nvim") -- common dependency
  use("windwp/nvim-autopairs") -- autopairs, integrates with both cmp and treesitter
  use("kyazdani42/nvim-web-devicons") -- file icons
  use("akinsho/bufferline.nvim") -- shows buffers as tabs
  use("moll/vim-bbye")
  use("lewis6991/impatient.nvim") -- use cache to improve nvim start time
  use("lukas-reineke/indent-blankline.nvim")
  use("folke/which-key.nvim")

  -- Colorschemes
  use("joshdick/onedark.vim")

  -- Start Screen
  use({
    "goolord/alpha-nvim",
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  })

  -- Completion Plugins
  use("hrsh7th/nvim-cmp") -- the completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp") -- lsp completions
  use("hrsh7th/cmp-nvim-lua") -- neovim lua completions

  -- Snippet Engine
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- Language Server Protocol (LSP)
  use("neovim/nvim-lspconfig") -- enable LSP
  use("williamboman/nvim-lsp-installer") -- simple to use language server installer
  use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  use("mfussenegger/nvim-jdtls") -- java

  -- Telescope
  use("nvim-telescope/telescope.nvim") -- fuzzy finder
  use("nvim-telescope/telescope-ui-select.nvim")

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter", -- syntax highlighting
    run = ":TSUpdate",
  })
  use("p00f/nvim-ts-rainbow") -- colored brackets
  use("windwp/nvim-ts-autotag") --  autoclose and autorename html tag

  -- Commenting
  use("numToStr/Comment.nvim") -- easily commenting stuff
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Git
  use("lewis6991/gitsigns.nvim")

  -- File Explorer
  use("kyazdani42/nvim-tree.lua")

  -- Status Line
  use("nvim-lualine/lualine.nvim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
