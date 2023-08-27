require("arkinmodi.remap")
require("arkinmodi.set")
require("arkinmodi.lazy")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight Yanks
autocmd("TextYankPost", {
	group = augroup("HighlightYank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- Auto-Remove Whitespace
autocmd({ "BufWritePre" }, {
	group = augroup("Whitespace", { clear = true }),
	pattern = "*",
	command = "%s/\\s\\+$//e",
})
