-- Highlight Yanks
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- Auto-Remove Whitespace
-- https://github.com/neovim/neovim/blob/6d1a2f2c3c51560555ea6f7867273635d07eb287/runtime/lua/editorconfig.lua#L93-L102
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("TrimTrailingWhitespace", { clear = true }),
	callback = function()
		local view = vim.fn.winsaveview()
		vim.api.nvim_command("silent! undojoin")
		vim.api.nvim_command("silent keepjumps keeppatterns %s/\\s\\+$//e")
		vim.fn.winrestview(view)
	end,
})
