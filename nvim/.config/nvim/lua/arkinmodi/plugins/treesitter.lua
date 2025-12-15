return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	version = false,
	build = ":TSUpdate",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		{ "windwp/nvim-ts-autotag", opts = {} },
	},
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
		},
		sync_install = false,
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		local treesitter = require("nvim-treesitter")
		local already_installed_parsers = treesitter.get_installed()
		local parser_to_install = vim.iter(opts["ensure_installed"])
			:filter(function(parser)
				return not vim.tbl_contains(already_installed_parsers, parser)
			end)
			:totable()
		local available_parsers = treesitter.get_available()

		local function install_parser(langs)
			local five_minutes = 1000 * 60 * 5
			local sync_install = opts["sync_install"] or false
			if sync_install then
				treesitter.install(langs, { summary = true }):wait(five_minutes)
			else
				treesitter.install(langs, { summary = true })
			end
		end

		install_parser(parser_to_install)

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("nvim-treesitter", { clear = true }),
			callback = function(ev)
				local lang = vim.treesitter.language.get_lang(ev.match)

				local auto_install = opts["auto_install"] or false
				if auto_install and vim.tbl_contains(available_parsers, lang) then
					already_installed_parsers = treesitter.get_installed()
					if not vim.tbl_contains(already_installed_parsers, lang) then
						install_parser({ lang })
					end
				end

				local highlight = opts["highlight"] or { enable = false }
				if highlight.enable then
					pcall(vim.treesitter.start, ev.buf)
				end

				local indent = opts["indent"] or { enable = false }
				if indent.enable then
					vim.api.nvim_set_option_value(
						"indentexpr",
						"v:lua.LazyVim.treesitter.indentexpr()",
						{ scope = "local" }
					)
				end
			end,
		})
	end,
}
