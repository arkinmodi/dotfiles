vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "gl", vim.diagnostic.open_float)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf })
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf })
		vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { buffer = ev.buf })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf })
		vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = ev.buf })
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf })

		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = false })
		end, { buffer = ev.buf })
	end,
})

vim.diagnostic.config({ virtual_text = true })

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = vim.NIL,
		["<S-Tab>"] = vim.NIL,
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	sources = cmp.config.sources({
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
	}, { name = "buffer" }),
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Supported LSP Configs
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations

-- Lua
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
})

lspconfig["rust_analyzer"].setup({ capabilities = capabilities }) -- Rust
lspconfig["jdtls"].setup({ capabilities = capabilities }) -- Java

-- TODO: Setup:
-- gopls (https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/gopls.lua)
-- tsserver (https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/tsserver.lua)
-- jsonls (https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/jsonls.lua)
--     https://github.com/hrsh7th/vscode-langservers-extracted (html, cssls, jsonls, eslint)
-- tailwindcss (https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/tailwindcss.lua)
-- astro (https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/astro.lua)
-- yamlls (https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/yamlls.lua)
-- docker???
-- docker-compose???

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.completion.spell,
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,
	},
})
