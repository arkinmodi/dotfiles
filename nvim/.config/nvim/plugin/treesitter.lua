local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  -- "all" or a list of languages (https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)
  ensure_installed = {
    "bash",
    "c",
    "css",
    "dockerfile",
    "go",
    "graphql",
    "hcl",
    "html",
    "http",
    "java",
    "javascript",
    "json",
    "latex",
    "lua",
    "make",
    "markdown",
    "python",
    "scss",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },

  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = false, disable = { "" } },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
