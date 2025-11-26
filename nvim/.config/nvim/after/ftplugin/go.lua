vim.cmd([[
  autocmd BufWritePre *.go lua vim.lsp.buf.format({ timeout_ms = 1000 })
]])
