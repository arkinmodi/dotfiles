-- Line Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

-- Backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

if os.getenv("XDG_CACHE_HOME") then
	vim.opt.undodir = os.getenv("XDG_CACHE_HOME") .. "/.vim/undodir"
else
	vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end

-- Search Highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Spelling
vim.opt.spell = true
vim.opt.spelllang = "en_ca"

vim.opt.termguicolors = true

vim.opt.scrolloff = 9
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "81"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number,screenline"

vim.opt.timeoutlen = 3000

-- Show Whitespace
-- vim.opt.listchars="eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"
-- ░ ▒ ▓ █
vim.opt.listchars = "tab:  ,trail:▓"
vim.opt.list = true

-- Python 3 Provider
vim.g.python3_host_prog = os.getenv("HOME") .. "/bin/python3"
