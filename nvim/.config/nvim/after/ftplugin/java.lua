-- Java Vim Settings
local options = {
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  colorcolumn = "100",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Java LSP
local status_ok, jdtls = pcall(require, "jdtls")
if not status_ok then
  return
end

local setup_status_ok, jdtls_setup = pcall(require, "jdtls.setup")
if not setup_status_ok then
  return
end

local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local prefix = vim.fn.expand("~/jdtls/.cache/")
local cache_dir = prefix .. workspace_dir
local jdtls_dir = vim.fn.expand("~/jdtls/jdtls-1.11.0/")
local lombok_dir = vim.fn.expand("~/jdtls/lombok/")

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "-javaagent:" .. lombok_dir .. "lombok.jar",
    "-jar",
    jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
    "-configuration",
    jdtls_dir .. "/config_mac", -- | config_win | config_linux
    "-data",
    cache_dir,
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = jdtls_setup.find_root({ ".git", "mvnw", "gradlew" }),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {},
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {},
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
vim.api.nvim_set_keymap("n", "gl", '<cmd>lua vim.diagnostic.open_float(0, { scope = "line" })<CR>', opts)
vim.api.nvim_set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>lA", "<cmd>lua require('jdtls').code_action()<CR>", opts)
vim.api.nvim_set_keymap("n", "<M-o>", "<cmd>lua require('jdtls').organize_imports()<CR>", opts)

vim.api.nvim_set_keymap("n", "crv", "<cmd>lua require('jdtls').extract_variable()<CR>", opts)
vim.api.nvim_set_keymap("v", "crv", "<esc><cmd>lua require('jdtls').extract_variable(true)<CR>", opts)

vim.api.nvim_set_keymap("n", "crc", "<cmd>lua require('jdtls').extract_constant()<CR>", opts)
vim.api.nvim_set_keymap("v", "crc", "<esc><cmd>lua require('jdtls').extract_constant(true)<CR>", opts)

vim.api.nvim_set_keymap("v", "crm", "<esc><cmd>lua require('jdtls').extract_method(true)<CR>", opts)
