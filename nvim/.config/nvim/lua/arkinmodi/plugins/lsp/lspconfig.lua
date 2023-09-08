return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.keymap.set(
			"n",
			"<leader>q",
			vim.diagnostic.setloclist,
			{ desc = "vim.diagnostic.setloclist" }
		)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "vim.diagnostic.goto_prev" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "vim.diagnostic.goto_next" })
		vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "vim.diagnostic.open_float" })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				vim.keymap.set(
					"n",
					"<leader>rn",
					vim.lsp.buf.rename,
					{ buffer = ev.buf, desc = "vim.lsp.buf.rename" }
				)

				vim.keymap.set(
					"n",
					"K",
					vim.lsp.buf.hover,
					{ buffer = ev.buf, desc = "vim.lsp.buf.hover" }
				)

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

		vim.diagnostic.config({ virtual_text = true })

		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Supported LSP Configurations
		-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations

		-- Lua
		if vim.fn.executable("lua-language-server") == 1 then
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
		end

		if vim.fn.executable("rust-analyzer") == 1 then
			lspconfig["rust_analyzer"].setup({ capabilities = capabilities }) -- Rust
		end

		if vim.fn.executable("jdtls") == 1 then
			lspconfig["jdtls"].setup({ capabilities = capabilities }) -- Java
		end

		if vim.fn.executable("gopls") == 1 then
			lspconfig["gopls"].setup({ capabilities = capabilities }) -- Go
		end

		if vim.fn.executable("typescript-language-server") == 1 then
			lspconfig["tsserver"].setup({ capabilities = capabilities }) -- TypeScript
		end

		if vim.fn.executable("vscode-json-language-server") == 1 then
			lspconfig["jsonls"].setup({ capabilities = capabilities }) -- JSON
		end

		if vim.fn.executable("vscode-css-language-server") == 1 then
			lspconfig["cssls"].setup({ capabilities = capabilities }) -- CSS
		end

		if vim.fn.executable("vscode-html-language-server") == 1 then
			lspconfig["html"].setup({ capabilities = capabilities }) -- HTML
		end

		if vim.fn.executable("vscode-eslint-language-server") == 1 then
			lspconfig["eslint"].setup({ capabilities = capabilities }) -- ESLint
		end

		if vim.fn.executable("tailwindcss-language-server") == 1 then
			lspconfig["tailwindcss"].setup({ capabilities = capabilities }) -- Tailwind CSS
		end

		if vim.fn.executable("astro-ls") == 1 then
			lspconfig["astro"].setup({ capabilities = capabilities }) -- Astro
		end

		-- YAML
		if vim.fn.executable("yaml-language-server") == 1 then
			lspconfig["yamlls"].setup({
				capabilities = capabilities,
				settings = {
					yaml = {
						schemas = {
							["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
							["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
							["https://json.schemastore.org/dependabot-2.0.json"] = ".github/dependabot.{yml,yaml}",
							["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
							["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
						},
					},
				},
			})
		end
	end,
}
