if next(vim.api.nvim_list_uis()) ~= nil then
	require("no-neck-pain").setup({
		autocmds = {
			enableOnVimEnter = true,
		},
	})
end
