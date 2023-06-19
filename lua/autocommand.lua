-- Language Types ---
vim.cmd("autocmd! BufRead,BufNewFile *.folk set filetype=tcl")

--- Formatting ---
vim.cmd("autocmd FileType help wincmd L")
-- vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.format()")
vim.cmd([[
  autocmd BufWritePre * lua if vim.lsp.buf_get_clients() ~= nil then vim.lsp.buf.format() end
]])

vim.cmd("autocmd FileType gitcommit exec 'au VimEnter * startinsert'")
vim.cmd("autocmd FileType gitcommit imap <C-X> <C-o>:x<CR>")
