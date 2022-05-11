vim.cmd [[

  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
  augroup END

  augroup format_on_save
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.formatting()
  augroup end

]]
