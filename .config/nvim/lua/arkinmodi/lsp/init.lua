local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("arkinmodi.lsp.configs")
require("arkinmodi.lsp.handlers").setup()
require("arkinmodi.lsp.null-ls")
