-- Needed for evaluating directory paths
local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")

local options = {
  tabstop = 2, -- insert x spaces for a tab
  softtabstop = 2,
  shiftwidth = 2,
  autoindent = true,
  expandtab = true, -- convert tabs to spaces
  smartindent = true, -- make indenting smarter again
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  exrc = true,
  guicursor = "",
  relativenumber = true, -- set relative numbered lines
  nu = true,
  wrap = false, -- display lines as one long line
  hlsearch = false, -- highlight all matches on previous search pattern
  hidden = true,
  incsearch = true,
  scrolloff = 8,
  swapfile = false, -- creates a swapfile
  backup = false, -- creates a backup file
  undodir = { prefix .. "/nvim/.undo//" },
  undofile = true, -- enable persistent undo
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  cursorline = true, -- highlight the current line
  ignorecase = true, -- ignore case in search patterns
  smartcase = true, -- smart case
  termguicolors = true, -- set term gui colors (most terminals support this)
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
