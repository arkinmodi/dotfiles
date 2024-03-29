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
	{ import = "arkinmodi.plugins" },
	{ import = "arkinmodi.plugins.lsp" },
	{ import = "arkinmodi.plugins.dap" },
}, {
	install = {
		colorscheme = { "ayu" },
	},
	change_detection = {
		notify = false,
	},
})
