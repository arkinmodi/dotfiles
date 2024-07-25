return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
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

		if vim.fn.executable("graphql-lsp") == 1 then
			lspconfig["graphql"].setup({ capabilities = capabilities }) -- Graphql
		end

		if vim.fn.executable("ansible-language-server") == 1 then
			lspconfig["ansiblels"].setup({ capabilities = capabilities }) -- Ansible
		end

		if vim.fn.executable("ngserver") == 1 then
			-- Angular
			local node_lib = vim.fn.glob("~/opt/node-*/*/*/lib/node_modules/")
			local ngserver_cmd = {
				"ngserver",
				"--stdio",
				"--tsProbeLocations",
				node_lib,
				"--ngProbeLocations",
				node_lib,
			}
			lspconfig["angularls"].setup({
				cmd = ngserver_cmd,
				capabilities = capabilities,
				on_new_config = function(new_config, _)
					new_config.cmd = ngserver_cmd
				end,
			})
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
							["https://json.schemastore.org/pre-commit-config.json"] = ".pre-commit-config.{yml,yaml}",
							["https://json.schemastore.org/pre-commit-hooks.json"] = ".pre-commit-hooks.{yml,yaml}",
						},
					},
				},
			})
		end
	end,
}
