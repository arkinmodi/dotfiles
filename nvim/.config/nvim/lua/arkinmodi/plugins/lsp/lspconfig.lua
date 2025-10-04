return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- Supported LSP Configurations
		-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp

		-- Lua
		if vim.fn.executable("lua-language-server") == 1 then
			vim.lsp.config("lua_ls", {
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if
							path ~= vim.fn.stdpath("config")
							and (
								vim.uv.fs_stat(path .. "/.luarc.json")
								or vim.uv.fs_stat(path .. "/.luarc.jsonc")
							)
						then
							return
						end
					end

					client.config.settings.Lua =
						vim.tbl_deep_extend("force", client.config.settings.Lua, {
							runtime = {
								-- Tell the language server which version of Lua you're using (most
								-- likely LuaJIT in the case of Neovim)
								version = "LuaJIT",
								-- Tell the language server how to find Lua modules same way as Neovim
								-- (see `:h lua-module-load`)
								path = {
									"lua/?.lua",
									"lua/?/init.lua",
								},
							},
							-- Make the server aware of Neovim runtime files
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME,
									-- Depending on the usage, you might want to add additional paths
									-- here.
									-- '${3rd}/luv/library'
									-- '${3rd}/busted/library'
								},
								-- Or pull in all of 'runtimepath'.
								-- NOTE: this is a lot slower and will cause issues when working on
								-- your own configuration.
								-- See https://github.com/neovim/nvim-lspconfig/issues/3189
								-- library = {
								--   vim.api.nvim_get_runtime_file('', true),
								-- }
							},
						})
				end,
				settings = { Lua = {} },
			})
			vim.lsp.enable("lua_ls")
		end

		-- Rust
		if vim.fn.executable("rust-analyzer") == 1 then
			vim.lsp.enable("rust_analyzer")
		end

		-- Go
		if vim.fn.executable("gopls") == 1 then
			vim.lsp.enable("gopls")
		end

		-- TypeScript
		if vim.fn.executable("typescript-language-server") == 1 then
			vim.lsp.enable("ts_ls")
		end

		-- JSON
		if vim.fn.executable("vscode-json-language-server") == 1 then
			vim.lsp.enable("jsonls")
		end

		-- CSS
		if vim.fn.executable("vscode-css-language-server") == 1 then
			vim.lsp.enable("cssls")
		end

		-- HTML
		if vim.fn.executable("vscode-html-language-server") == 1 then
			vim.lsp.enable("html")
		end

		-- ESLint
		if vim.fn.executable("vscode-eslint-language-server") == 1 then
			vim.lsp.enable("eslint")
		end

		-- Tailwind CSS
		if vim.fn.executable("tailwindcss-language-server") == 1 then
			vim.lsp.enable("tailwindcss")
		end

		-- GraphQL
		if vim.fn.executable("graphql-lsp") == 1 then
			vim.lsp.enable("graphql")
		end

		-- Ansible
		if vim.fn.executable("ansible-language-server") == 1 then
			vim.lsp.enable("ansiblels")
		end

		-- Angular
		if vim.fn.executable("ngserver") == 1 then
			vim.lsp.enable("angularls")
		end

		-- YAML
		if vim.fn.executable("yaml-language-server") == 1 then
			vim.lsp.config("yamlls", {
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
			vim.lsp.enable("yamlls")
		end
	end,
}
