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
autocmd("BufWritePre", {
	group = augroup("Whitespace", { clear = true }),
	pattern = "*",
	command = "%s/\\s\\+$//e",
})

-- LSP Keymaps
autocmd("LspAttach", {
	group = augroup("UserLspConfig", { clear = true }),
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
			"n",
			"gs",
			vim.lsp.buf.signature_help,
			{ buffer = ev.buf, desc = "vim.lsp.buf.signature_help" }
		)

		vim.keymap.set(
			{ "n", "v" },
			"<leader>ca",
			vim.lsp.buf.code_action,
			{ buffer = ev.buf, desc = "vim.lsp.buf.code_action" }
		)

		vim.keymap.set("n", "<leader>ff", function()
			-- TODO: Add logic to run cli formatter based on file type (to replace null_ls)
			vim.lsp.buf.format({ async = false })
		end, { buffer = ev.buf, desc = "vim.lsp.buf.format" })
	end,
})
