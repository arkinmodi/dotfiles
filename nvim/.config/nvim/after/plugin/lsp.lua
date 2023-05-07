local lsp = require('lsp-zero').preset({
   name = 'recommended',
   -- name = 'minimal',
   set_lsp_keymaps = true,
   manage_nvim_cmp = true,
   suggest_lsp_servers = false
})

lsp.ensure_installed({
  'lua_ls',
})


-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<CR>'] = vim.NIL,
  ['<S-Tab>'] = vim.NIL,
  ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- lsp.nvim_workspace()

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

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


vim.diagnostic.config({
    virtual_text = true
})
