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

-- Auto-Adjusting Indentation Guides
-- https://www.reddit.com/r/neovim/comments/17aponn/i_feel_like_leadmultispace_deserves_more_attention
local function update_lead()
	local lcs = vim.opt_local.listchars:get()
	local space = vim.fn.str2list(lcs.multispace or lcs.space)
	local lead = { vim.fn.char2nr("│") }
	for i = 1, vim.bo.tabstop - 1 do
		lead[#lead + 1] = space[i % #space + 1]
	end
	vim.opt_local.listchars:append({ leadmultispace = vim.fn.list2str(lead) })
end

vim.api.nvim_create_autocmd("OptionSet", {
	group = vim.api.nvim_create_augroup("UpdateLeadMultiSpace", { clear = true }),
	pattern = { "listchars", "tabstop", "filetype" },
	callback = update_lead,
})

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("UpdateLeadMultiSpace", { clear = true }),
	once = true,
	callback = update_lead,
})

-- LSP Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		vim.keymap.set(
			"n",
			"<leader>rn",
			vim.lsp.buf.rename,
			{ buffer = ev.buf, desc = "vim.lsp.buf.rename" }
		)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "vim.lsp.buf.hover" })
		vim.keymap.set(
			"n",
			"gD",
			vim.lsp.buf.declaration,
			{ buffer = ev.buf, desc = "vim.lsp.buf.declaration" }
		)
		vim.keymap.set(
			"n",
			"gd",
			vim.lsp.buf.definition,
			{ buffer = ev.buf, desc = "vim.lsp.buf.definition" }
		)
		vim.keymap.set(
			"n",
			"gi",
			vim.lsp.buf.implementation,
			{ buffer = ev.buf, desc = "vim.lsp.buf.implementation" }
		)
		vim.keymap.set(
			"n",
			"go",
			vim.lsp.buf.type_definition,
			{ buffer = ev.buf, desc = "vim.lsp.buf.type_definition" }
		)
		vim.keymap.set(
			"n",
			"gr",
			vim.lsp.buf.references,
			{ buffer = ev.buf, desc = "vim.lsp.buf.references," }
		)
		vim.keymap.set(
			"i",
			"<C-h>",
			vim.lsp.buf.signature_help,
			{ buffer = ev.buf, desc = "vim.lsp.buf.signature_help" }
		)
		vim.keymap.set(
			{ "n", "v" },
			"<leader>ca",
			vim.lsp.buf.code_action,
			{ buffer = ev.buf, desc = "vim.lsp.buf.code_action" }
		)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("ConcealLevel", { clear = true }),
	pattern = "org",
	callback = function()
		vim.opt_local.conceallevel = 1
	end,
})
